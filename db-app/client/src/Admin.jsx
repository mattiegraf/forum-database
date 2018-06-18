import React, { Component } from 'react';
import Data from './Data.js';
import {OneFieldForm, OneFieldSelectForm, OneSelectForm} from './Forms.jsx';
import { Link } from 'react-router-dom';
import Cookies from 'universal-cookie';
import {Error, PermissionError} from './Error.jsx'

const cookies = new Cookies();


function AdminView({match}){
    return (
        <div>
        <h1>Admin Area</h1>
        <h5><Link to={`${match.url}/stats`}>Go to Admin Stats</Link></h5>
        <AddModerator/>
        <RemoveModerator/>
        <AddSubforum/>
        <RemoveSubforum/>
        <RemoveUser/>
        </div>
    );
}

function AdminStats(){
    const adminBit = Number(cookies.get('adminBit'));
    if(!adminBit){
        return <PermissionError/>;
    }
    else{
        return (
            <div>
            <h1>Admin Stats</h1>
            <p>Misc. Stats from the Forum</p>
            <Bobofan/>
            <AgeWorstBobo/>
            <AgeBestBobo/>
            <AgeGrandBobo/>
            <AgeBabyBobo/>
            </div>
        );
    }
    
}

function RemoveModerator(){
    return(
        <div>
            <h3>Remove Moderator</h3>
            <OneFieldSelectForm fieldName1 = "Username" fieldName2 = "Subforum" submitName = "Remove" options = {
            Data.subforumData.map( (subforum) => { return subforum.name})}/>
      </div>
    );
}

function AddModerator(){
    return(
        <div>
            <h3>Add Moderator</h3>
            <OneFieldSelectForm fieldName1 = "Username" fieldName2 = "Subforum" submitName = "Appoint" options = {
            Data.subforumData.map( (subforum) => { return subforum.name})}/>
      </div>
    );
}

function AddSubforum(){
    return(
        <div>
            <h3>Add Subforum</h3>
            <OneFieldForm fieldName = "Subforum" submitName = "Create"/>
      </div>
    );
}

function RemoveSubforum(){
    return(
        <div>
            <h3>Remove Subforum</h3>
            <OneSelectForm fieldName = "Subforum" submitName = "Remove" options = {
            Data.subforumData.map( (subforum) => { return subforum.name})}/>
      </div>
    );
}

function RemoveUser(){
    return(
        <div>
            <h3>Delete Account</h3>
            <OneFieldForm fieldName = "Email" submitName = "Delete" handler = {RemoveUserHandler}/>
      </div>
    );
}

function RemoveUserHandler(email){
    let self = this;
    /*
    if(email && email !== "undefined" && myEmail && email !== myEmail){
      fetch('/isadminuser/'+email, {
          method: 'GET'
      }).then(function(response) {
          if (response.status >= 400) {
              throw new Error("Bad response from server");
          }
          return response.json();
      }).then(function(data) {
        if(!data[0].isadmin.data[0]){
            //delete user
            console.log("kill user");
        }
    }).catch(err => {
      console.log('caught it!',err);
      });
    }*/
    //console.log(email);

    fetch('/deleteuser/'+email, {
        method: 'GET'
    }).then(function(response) {
        if (response.status >= 400) {
            throw new Error("Bad response from server");
        }
        return response;
    }).then(function(response) {
      //report success here
  }).catch(err => {
    console.log('caught it!',err);
    });

}


class Bobofan extends Component {
    constructor(props) {
      super(props)
      this.state = {
          fan: []
      }
      this.match = props.match;
  }
  
  componentDidMount() {
      let self = this;
      fetch('/superfan', {
          method: 'GET'
      }).then(function(response) {
          if (response.status >= 400) {
              throw new Error("Bad response from server");
          }
          return response.json();
      }).then(function(data) {
          self.setState({fan: data});
          console.log(data);
      }).catch(err => {
      console.log('caught it!',err);
      })
  }
  
    render(){
      return (
          <div>
            <h3>Ultimate BoboVerse Fans!</h3>
            <p>These superfans have posted a thread in every subforum! Wow!</p>
            <ul>
                {this.state.fan.map( (fan)=> {
                    return(<li>{fan.email}</li>);})}
            </ul>
            </div>
            );
  
      
    }
  
}


class AgeWorstBobo extends Component {
    constructor(props) {
      super(props)
      this.state = {
          age: []
      }
      this.match = props.match;
  }
  
  componentDidMount() {
      let self = this;
      fetch('/ageofworstbobo', {
          method: 'GET'
      }).then(function(response) {
          if (response.status >= 400) {
              throw new Error("Bad response from server");
          }
          return response.json();
      }).then(function(data) {
          self.setState({age: data});
          console.log(data);
      }).catch(err => {
      console.log('caught it!',err);
      })
  }
  
    render(){
      return (
          <div>
            <h3>Age of Worst Bobo</h3>
            <p>Age of the User with the Lowest Average Banana Score: 
                {this.state.age.map( (age)=> {
                        return(age.age);})}
            </p>
                
            </div>
            );
  
      
    }
  
}

class AgeGrandBobo extends Component {
    constructor(props) {
      super(props)
      this.state = {
          age: []
      }
      this.match = props.match;
  }
  
  componentDidMount() {
      let self = this;
      fetch('/ageofgrandbobo', {
          method: 'GET'
      }).then(function(response) {
          if (response.status >= 400) {
              throw new Error("Bad response from server");
          }
          return response.json();
      }).then(function(data) {
          self.setState({age: data});
          console.log(data);
      }).catch(err => {
      console.log('caught it!',err);
      })
  }
  
    render(){
      return (
          <div>
            <h3>Age of GrandBobo</h3>
            <p>Age of the Oldest User: 
                {this.state.age.map( (age)=> {
                        return(age.age);})}
            </p>
            </div>
            );
  
      
    }
  
}


class AgeBabyBobo extends Component {
    constructor(props) {
      super(props)
      this.state = {
          age: []
      }
      this.match = props.match;
  }
  
  componentDidMount() {
      let self = this;
      fetch('/ageofbabybobo', {
          method: 'GET'
      }).then(function(response) {
          if (response.status >= 400) {
              throw new Error("Bad response from server");
          }
          return response.json();
      }).then(function(data) {
          self.setState({age: data});
          console.log(data);
      }).catch(err => {
      console.log('caught it!',err);
      })
  }
  
    render(){
      return (
          <div>
            <h3>Age of BabyBobo</h3>
            <p>Age of the Youngest User: 
                {this.state.age.map( (age)=> {
                        return(age.age);})}
            </p>
                
            </div>
            );
  
      
    }
  
}



class AgeBestBobo extends Component {
    constructor(props) {
      super(props)
      this.state = {
          age: []
      }
      this.match = props.match;
  }
  
  componentDidMount() {
      let self = this;
      fetch('/ageofbestbobo', {
          method: 'GET'
      }).then(function(response) {
          if (response.status >= 400) {
              throw new Error("Bad response from server");
          }
          return response.json();
      }).then(function(data) {
          self.setState({age: data});
          console.log(data);
      }).catch(err => {
      console.log('caught it!',err);
      })
  }
  
    render(){
      return (
          <div>
            <h3>Age of Best Bobo</h3>
            <p>Age of the User with the Highest Average Banana Score: 
                {this.state.age.map( (age)=> {
                        return(age.age);})}
            </p>
                
            </div>
            );
  
      
    }
  
}

  export {AdminView, AdminStats};