import React from 'react';
import Data from './Data.js';
import Error from './Error.jsx';

const Thread = ({match}) => {
    var subforum= Data.subforumData.find(s => s.name === match.params.name);
    var thread;
    var threadData;
    if(subforum){
        thread = subforum.threads.find(t => t.id === Number(match.params.id));
        if(thread){
            threadData = <div><h1>{thread.title}</h1>
                         <h4>by {thread.author}</h4>
                         <p>{thread.body}</p></div>
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

export default Thread;