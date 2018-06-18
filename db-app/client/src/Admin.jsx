import React, { Component } from 'react';
import Data from './Data.js';
import {OneFieldForm, OneFieldSelectForm, OneSelectForm, TwoFieldForm} from './Forms.jsx';
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
            <BestBobo/>
            <AgeWorstBobo/>
            <AgeBestBobo/>
            <AgeGrandBobo/>
            <AgeBabyBobo/>
            </div>
        );
    }
    
}

//will allow an admin to view all comments
function AdminCommentStream(){

}

function RemoveModerator(){
    return(
        <div>
            <h3>Remove Moderator</h3>
            <TwoFieldForm fieldName1 = "Email" fieldName2 = "Subforum" submitName = "Remove" handler = {RemoveModeratorHandler}/>
      </div>
    );
}

function RemoveModeratorHandler(email, subforum){
    let self = this;
      fetch('/removemod/'+email+'/'+subforum, {
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

function AddModerator(){
    return(
        <div>
            <h3>Add Moderator</h3>
            <TwoFieldForm fieldName1 = "Email" fieldName2 = "Subforum" submitName = "Appoint" handler = {AddModeratorHandler} 
            />
      </div>
    );
}

function AddModeratorHandler(email, subforum){
    let self = this;
      fetch('/addmod/'+email+'/'+subforum, {
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

function AddSubforum(){
    return(
        <div>
            <h3>Add Subforum</h3>
            <OneFieldForm fieldName = "Subforum" submitName = "Create" handler = {AddSubforurmHandler}/>
      </div>
    );
}

function AddSubforurmHandler(subforum){
    let self = this;
      fetch('/addsubforum/'+subforum, {
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

function RemoveSubforum(){
    return(
        <div>
            <h3>Remove Subforum</h3>
            <OneFieldForm fieldName = "Subforum" submitName = "Remove" handler = {RemoveSubforurmHandler}/>
      </div>
    );
}

function RemoveSubforurmHandler(subforum){
    let self = this;
      fetch('/removesubforum/'+subforum, {
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
          //console.log(data);
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

class BestBobo extends Component {
    constructor(props) {
      super(props)
      this.state = {
          best: []
      }
      this.match = props.match;
  }
  
  componentDidMount() {
      let self = this;
      fetch('/bestbobo', {
          method: 'GET'
      }).then(function(response) {
          if (response.status >= 400) {
              throw new Error("Bad response from server");
          }
          return response.json();
      }).then(function(data) {
          self.setState({best: data});
          //console.log(data);
      }).catch(err => {
      console.log('caught it!',err);
      })
  }
  
    render(){
      return (
          <div>
            <h3>Best Bobos</h3>
            <p>These bobos have the highest banana score of all accounts!</p>
            <ul>
                {this.state.best.map( (best)=> {
                    return(<li>{best.email}</li>);})}
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
      fetch('/ageofworstavgbobo', {
          method: 'GET'
      }).then(function(response) {
          if (response.status >= 400) {
              throw new Error("Bad response from server");
          }
          return response.json();
      }).then(function(data) {
          self.setState({age: data});
          //console.log(data);
      }).catch(err => {
      console.log('caught it!',err);
      })
  }
  
    render(){
      return (
          <div>
            <h3>Age of Worst Bobos</h3>
            <p>Age with the Lowest Average Banana Score: 
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
          //console.log(data);
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
          //console.log(data);
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
      fetch('/ageofbestavgbobo', {
          method: 'GET'
      }).then(function(response) {
          if (response.status >= 400) {
              throw new Error("Bad response from server");
          }
          return response.json();
      }).then(function(data) {
          self.setState({age: data});
          //console.log(data);
      }).catch(err => {
      console.log('caught it!',err);
      })
  }
  
    render(){
      return (
          <div>
            <h3>Age of Best Bobos</h3>
            <p>Age with the Highest Average Banana Score: 
                {this.state.age.map( (age)=> {
                        return(age.age);})}
            </p>
                
            </div>
            );
  
      
    }
  
}

  export {AdminView, AdminStats};