import React, { Component } from 'react';
import Data from './Data.js';
import {Error} from './Error.jsx';
import { Link } from 'react-router-dom';
import { OneFieldForm, TwoFieldForm } from './Forms.jsx'
import Cookies from 'universal-cookie';


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
          thread: []
      }
      this.match = props.match;
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
      }).catch(err => {
      console.log('caught it!',err);
      })
  }
  
    render(){
      return (
          <div>
            {this.state.thread.map( (thread)=> {
                return(
                <div>
                    <div>
                        <h1>{thread.title}</h1>
                        <h4>{thread.email}</h4>
                        <p>{thread.textbody}</p>
                    </div>
                    <div>
                        <Comments match = {this.match}/>
                    </div>
                </div>
                );})}
            </div>
            );
  
      
    }
  
  }

const NewThread = ({match}) => {
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
          console.log(data);
      }).catch(err => {
      console.log('caught it!',err);
      })
  }
  
    render(){
      return (
          <div>
            <h3>Responses</h3>
            {this.state.comments.map( (comment)=> {
                return(
                <div>
                    <h5>{comment.email}</h5>
                    <p>{comment.body}</p>
                </div>
            
                );})}
            </div>
            );
  
      
    }
  
}

function DeleteThread(props){
    var deleteView = null;
    if(props.author === props.username || props.isAdmin || props.moderatorFlag){
        deleteView = <button>Delete</button>
    }
    return deleteView;
}

function DeleteComment(props){
    var deleteView = null;
    if(props.author === props.username || props.isAdmin || props.moderatorFlag){
        deleteView = <button>Delete</button>
    }
    return deleteView;
}


export {Thread, NewThread};