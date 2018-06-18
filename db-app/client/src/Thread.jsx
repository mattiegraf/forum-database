import React, { Component } from 'react';
import Data from './Data.js';
import {Error} from './Error.jsx';
import { Link } from 'react-router-dom';
import { OneFieldForm, TwoFieldForm } from './Forms.jsx'
import Cookies from 'universal-cookie';

const cookies = new Cookies();


const Thread2 = ({match}) => {
    var subforum= Data.subforumData.find(s => s.name === match.params.name);
    var thread;
    var threadData;
    if(subforum){
        thread = subforum.threads.find(t => t.id === Number(match.params.id));
        if(thread){
            const cookies = new Cookies();
            const username = cookies.get('username');
            const adminBit = Number(cookies.get('adminBit'));
            const moderatorFlag = 0;
            threadData = <div>
                            <h2><Link to={`/s/${match.params.name}`}>{subforum.name} Board</Link></h2>
                            <div>
                                <h1>{thread.title}</h1>
                                <h4>by {thread.author}</h4>
                                <p>{thread.body}</p>
                                <DeleteThread username = {username} adminBit = {adminBit} moderatorFlag = {moderatorFlag} author = {thread.author}/>
                            </div>
                            <OneFieldForm fieldName = "Write a Reply"/>
                            <Comments comments = {thread.comments} username = {username} adminBit = {adminBit}
                                moderatorFlag = {moderatorFlag}/>
                        </div>
        }
        else{
            threadData = <Error/>
        }
    }
    else{
        threadData = <Error/>
    }


    return (
        <div>
          <div>
             {threadData}
          </div>
        </div>
      )    
};

class Thread extends Component {
    constructor(props) {
      super(props)
      this.state = {
          thread: [],
          mod: 0
      }
      this.match = props.match;
      this.email = cookies.get('email');
      this.adminBit = Number(cookies.get('adminBit'));
      //console.log("Admin bit is: " + this.adminBit);
  }
  
  componentDidMount() {
      let self = this;
      fetch('/thread/'+this.match.params.name+'/'+this.match.params.id, {
          method: 'GET'
      }).then(function(response) {
          if (response.status >= 400) {
              throw new Error("Bad response from server");
          }
          return response.json();
      }).then(function(data) {
          self.setState({thread: data});
          //console.log(data);
      });
    
      fetch('/modcheck/'+this.email+'/'+self.match.params.name, {
        method: 'GET'
    }).then(function(response) {
        if (response.status >= 400) {
            throw new Error("Bad response from server");
        }
        return response.json();
    }).then(function(data) {
        if(data.length){
            self.setState({mod: 1});
            //console.log("mod state reset to 1!")
        }
        else{
            //probably not necessary
            self.setState({mod: 0});
        } 
        //console.log(data);
    }).catch(err => {
      console.log('caught it!',err);
      })
  }
  
    render(){
      return (
          <div>
            {this.state.thread.map( (thread)=> {
                const temail = thread.email ? thread.email : "[deleted]";
                return(
                <div>
                    <div>
                        <h2><Link to={`/s/${this.match.params.name}`}>{thread.name} Board</Link></h2>
                    </div>
                    <div>
                        <h1>{thread.title}</h1>
                        <h4>{temail}</h4>
                        <p>{thread.textbody}</p>
                        <DeleteThread email = {this.email} isAdmin = {this.adminBit} moderatorFlag = {this.state.mod} 
                        author = {thread.email} id = {thread.id}/>
                    </div>
                    <div>
                        <Comments match = {this.match} mod = {this.state.mod}/>
                    </div>
                </div>
                );})}
            </div>
            );
  
      
    }
  
  }

  const Test = (props) => {
      
  }

const NewThread2 = ({match}) => {
    var subforum= Data.subforumData.find(s => s.name === match.params.name);
    if(subforum){
        return (
            <div>
                <h1>Post New Thread on <Link to={`/s/${match.params.name}`}>{subforum.name} Board</Link></h1>
                <TwoFieldForm fieldName1 = "Post Title" fieldName2 = "Post Body"/>
            </div>
        );

    }
    else{
        return (<div><Error/></div>);
    }
};


class NewThread extends Component {
    constructor(props) {
      super(props)
      this.state = {
          subforum: []
          
      }
      this.match = props.match;
  }
  
  componentDidMount() {
      let self = this;
      fetch('/s/' + this.match.params.name, {
          method: 'GET'
      }).then(function(response) {
          if (response.status >= 400) {
              throw new Error("Bad response from server");
          }
          return response.json();
      }).then(function(data) {
          self.setState({subforum: data});
          //console.log(data);
      }).catch(err => {
      console.log('caught it!',err);
      })
  }
  
    render(){
      return (
  
        <div>
           {this.state.subforum.map( (subforum) => {
               return(
                <div>
                    <h1>Post New Thread on <Link to={`/s/${this.match.params.name}`}>{subforum.name} Board</Link></h1>
                    <TwoFieldForm fieldName1 = "Post Title" fieldName2 = "Post Body" rest = {subforum.name}
                        handler = {NewThreadHandler}/>
                </div>
           )})}
       </div>
      )
      
    }
  
}

function NewThreadHandler(title, body, name){
    let self = this;
    const author = cookies.get('email');
    fetch('/createthread/'+name+'/'+title+'/'+body+'/'+author, {
        method: 'GET'
    }).then(function(response) {
        if (response.status >= 400) {
            throw new Error("Bad response from server");
        }
        return response.json();
    }).then(function(data) {
        console.log(data);
    }).catch(err => {
    console.log('caught it!',err);
    });
}

  




function Comments1(props){
    var comments = props.comments.map((comment) => {
        return(
            <div>
                <h4>{comment.author}</h4>
                <p>{comment.body}</p>
                <DeleteComment username = {props.username} adminBit = {props.adminBit} moderatorFlag = {props.moderatorFlag} author = {comment.author}/>
            </div>
    )});
    return (<div>{comments}</div>);
}

class Comments extends Component {
    constructor(props) {
      super(props)
      this.state = {
          comments: []
      }
      this.match = props.match;
      this.email = cookies.get('email');
      this.adminBit = Number(cookies.get('adminBit'));
      //this.mod = props.mod;
      //console.log("mod status" + this.mod)
  }
  
  componentDidMount() {
      let self = this;
      fetch('/comments/'+this.match.params.name+'/'+this.match.params.id, {
          method: 'GET'
      }).then(function(response) {
          if (response.status >= 400) {
              throw new Error("Bad response from server");
          }
          return response.json();
      }).then(function(data) {
          self.setState({comments: data});
          //console.log(data);
      }).catch(err => {
      console.log('caught it!',err);
      })
  }
  
    render(){
      return (
          <div>
            <h3>Responses</h3>
            {this.state.comments.map( (comment)=> {
                const cemail = comment.email ? comment.email : "[deleted]";
                return(
                <div>
                    <h5>{cemail}</h5>
                    <p>{comment.body}</p>
                    <DeleteComment author = {comment.email} username = {this.email} isAdmin = {this.adminBit} moderatorFlag = {this.props.mod} id = {comment.id_num}/>
                </div>
            
                );})}
            </div>
            );
  
      
    }
  
}

function DeleteThread(props){
    var deleteView = null;
    if(props.author === props.email || props.isAdmin || props.moderatorFlag){
        deleteView = <button onClick = {() => {DeleteThreadHandler(props.id, props.author)}}>Delete</button>
    }
    return deleteView;
}

function DeleteThreadHandler(id, email){
    let self = this;
      fetch('/deletethread/'+id+'/'+email, {
          method: 'GET'
      }).then(function(response) {
          if (response.status >= 400) {
              throw new Error("Bad response from server");
          }
          return response.json();
      }).then(function(data) {
        console.log(data);
    }).catch(err => {
      console.log('caught it!',err);
      });
}

function DeleteComment(props){
    var deleteView = null;
    if(props.author === props.username || props.isAdmin || props.moderatorFlag){
        deleteView = <button>Delete</button>
    }
    return deleteView;
}


export {Thread, NewThread};