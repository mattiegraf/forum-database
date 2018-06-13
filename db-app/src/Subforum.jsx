import React from 'react';
import { Link, Route } from 'react-router-dom';
import Data from './Data.js';


const Subforum = ({match}) => {
    var subforum= Data.subforumData.find(s => s.name == match.params.name);
    var subforumData;
  
    if(subforum)
      subforumData = <div>
        <h3> {subforum.name} Board </h3>
        </div>;
    else
      subforumData = <h2> Sorry, this Subforum doesnt exist yet. </h2>;
  
    return (
      <div>
        <div>
           {subforumData}
        </div>
      </div>
    )    
  }

  export default Subforum;
