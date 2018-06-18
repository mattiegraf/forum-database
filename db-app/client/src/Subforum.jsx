import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import Data from './Data.js';
import {Error} from './Error.jsx';

class Subforum extends Component {
  constructor(props) {
    super(props)
    this.state = {
        subforums: [],
        threads: []
        
    }
    this.match = props.match;
}

componentDidMount() {
    let self = this;
    fetch('/s/' + this.match.params.name, {
        method: 'GET'
    }).then(function(response) {
        if (response.status >= 400) {
            throw new Error("Bad response from server");
        }
        return response.json();
    }).then(function(data) {
        self.setState({subforums: data});
        //console.log(data);
    }).catch(err => {
    console.log('caught it!',err);
    })

    fetch('/yyy', {
        method: 'GET'
    }).then(function(response) {
        if (response.status >= 400) {
            throw new Error("Bad response from server");
        }
        return response.json();
    }).then(function(data) {
        self.setState({threads: data});
        console.log(data);
    }).catch(err => {
    console.log('caught it!',err);
    })
}

  render(){
    return (

      <div>
         <h3> {this.state.subforums.map( (subforum) => {
              return (
              subforum.name);
            })}  Board </h3>
        <h4><Link to={`${this.match.url}/new`}>Create New Thread</Link></h4>
        <ul> {this.state.threads.map( (thread) => {
            return(<li><Link to={`${this.match.url}/${thread.id}`}>{thread.title}</Link></li>)})}
              </ul>
     </div>
    )

    
  }

}




export default Subforum;
