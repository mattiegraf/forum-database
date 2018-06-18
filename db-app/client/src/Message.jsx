import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import {TwoFieldForm} from './Forms.jsx';
import Cookies from 'universal-cookie';

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
            <ul> 
            {this.state.messages.map( (message) => {
                return (<li>From: {message.sent_email}<br/>
                        Date: {message.date_sent}<br/>
                        Body: {message.body}</li>);
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
    }).catch(err => {
    console.log('caught it!',err);
    });

}

export {MessagePage, NewMessagePage};