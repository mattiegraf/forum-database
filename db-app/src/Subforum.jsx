import React from 'react';
import { Link } from 'react-router-dom';
import Data from './Data.js';
import Error from './Error.jsx';


const Subforum = ({match}) => {
    var subforum= Data.subforumData.find(s => s.name === match.params.name);
    var subforumData;
  
    if(subforum){
        var linkList = subforum.threads.map( (thread) => {
            return(
              <li>
                <Link to={`${match.url}/${thread.id}`}>
                  {thread.title}
                </Link>
              </li>
              )});

        subforumData = <div> <h3> {subforum.name} Board </h3>
                        <ul> {linkList} </ul> </div>;
    }
    else{
      subforumData = <Error/>
    }
    return (
      <div>
        <div>
           {subforumData}
        </div>
      </div>
    )    
  };

  export default Subforum;
