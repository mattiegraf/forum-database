import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import {TwoFieldForm} from './Forms.jsx';
import Cookies from 'universal-cookie';
import {AlertErrors} from './Error.jsx';

const cookies = new Cookies();

const MessagePage = ({match}) => (
    <div>
      <h1>Messages</h1>
      <Link to={`${match.url}/new`}>Create New Message</Link>
      <MessageView match = {match}/>
    </div>
);


class MessageView extends Component {
    constructor(props) {
      super(props)
      this.state = {
          messages: []
      }
      this.match = props.match;
  }
  
  componentDidMount() {
      let self = this;
      const to = cookies.get('email');
      fetch('/viewmessages/'+to, {
          method: 'GET'
      }).then(function(response) {
          if (response.status >= 400) {
              throw new Error("Bad response from server");
          }
          return response.json();
      }).then(function(data) {
          self.setState({messages: data});
          console.log(data);
      }).catch(err => {
      console.log('caught it!',err);
      })
  }
  
    render(){
      return(
        <div>
            <ul className="Messages"> 
            {this.state.messages.map( (message) => {
                 return (<li><p className="MessageEmail"> From: {message.sent_email}
                 <p1 className="MessageDate"> Date: {message.date_sent}</p1></p>
                 <div className="MessageBody">{message.body}</div></li>
                  );
                })} 
            </ul>
        </div>
      );

      
  
      
    }
  
  }


const NewMessagePage = () => (
<div>
    <h1>Compose New Message</h1>
    <TwoFieldForm fieldName1 = "Email" fieldName2 = "Message Body" submitName = "Send" handler = {sendMessageHandler}/>
</div>
);


function sendMessageHandler(to, body){
    const from = cookies.get('email');
    fetch('/sendMessage/'+to+'/'+from+'/'+body, {
        method: 'GET'
    }).then(function(response) {
        if (response.status >= 400) {
            throw new Error("Bad response from server");
        }
        return response.json();
    }).then(function(data) {
        console.log(data);
        AlertErrors(data, "Message could not be sent.");
    }).catch(err => {
    console.log('caught it!',err);
    })

}



export {MessagePage, NewMessagePage};