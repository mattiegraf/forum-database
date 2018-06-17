import React from 'react';
import Data from './Data.js';
import {Error} from './Error.jsx';
import { Link } from 'react-router-dom';
import { OneFieldForm, TwoFieldForm } from './Forms.jsx'
import Cookies from 'universal-cookie';


const Thread = ({match}) => {
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


function Comments(props){
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