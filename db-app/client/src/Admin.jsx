import React from 'react';
import Data from './Data.js';
import {OneFieldForm, OneFieldSelectForm, OneSelectForm} from './Forms.jsx';
import { Link } from 'react-router-dom';
//import Cookies from 'universal-cookie';

//const cookies = new Cookies();


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
    return (
        <div>
        <h1>Admin Stats</h1>
        <p>Misc. Stats from the Forum</p>
        </div>
    );
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

  export {AdminView, AdminStats};