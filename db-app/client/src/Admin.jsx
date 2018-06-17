import React, { Component } from 'react';
import Data from './Data.js';
import {OneFieldForm, OneFieldSelectForm, OneSelectForm} from './Forms.jsx';


function AdminView(){
    return (
        <div>
        <h1>Admin Area</h1>
        <AddModerator/>
        <RemoveModerator/>
        <AddSubforum/>
        <RemoveSubforum/>
        <RemoveUser/>
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
            <OneFieldForm fieldName = "Username" submitName = "Delete"/>
      </div>
    );
}


  export {AdminView};