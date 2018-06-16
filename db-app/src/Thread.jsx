import React from 'react';
import Data from './Data.js';
import {Error} from './Error.jsx';
import { Link } from 'react-router-dom';
import { OneFieldForm, TwoFieldForm } from './Forms.jsx'


const Thread = ({match}) => {
    var subforum= Data.subforumData.find(s => s.name === match.params.name);
    var thread;
    var threadData;
    if(subforum){
        thread = subforum.threads.find(t => t.id === Number(match.params.id));
        if(thread){
            threadData = <div>
                            <h2><Link to={`/s/${match.params.name}`}>{subforum.name} Board</Link></h2>
                            <div>
                                <h1>{thread.title}</h1>
                                <h4>by {thread.author}</h4>
                                <p>{thread.body}</p>
                            </div>
                            <OneFieldForm fieldName = "Write a Reply"/>
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

export {Thread, NewThread};