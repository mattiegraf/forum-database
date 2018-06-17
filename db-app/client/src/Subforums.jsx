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
            <h3> Subforums</h3>
            <p>Please select a subforum.</p>
            <ul> {linkList} </ul>
          </div>
      </div>
   )
 }


export default Subforums;
