import React from 'react';
import { Link } from 'react-router-dom';
import Data from './Data.js';
const Subforums = ({ match }) => {

  const subforumData = Data.subforumData;

   var linkList = subforumData.map( (subforum) => {
     return(
       <li>
         <Link to={`${match.url}/${subforum.name}`}>
           {subforum.name}
         </Link>
       </li>
       )
 
     })
 
   return(
     <div>
          <div>
            <h3> subforums</h3>
            <ul> {linkList} </ul>
          </div>
          <div>Please select a subforum.</div>
      </div>
   )
 }


export default Subforums;
