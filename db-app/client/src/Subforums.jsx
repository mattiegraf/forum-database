import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import Data from './Data.js';

class Subforums extends Component {
  constructor(props) {
    super(props)
    this.state = {
        subforums: []
    }
    this.match = props.match;
}

componentDidMount() {
    let self = this;
    fetch('/xxx', {
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
}

  render(){
    return (
      <div>
        <h3> Subforums</h3>
        <p>Please select a subforum.</p>
        <ul> 
          {this.state.subforums.map( (subforum) => {
              return (<li><Link to={`${this.match.url}/${subforum.name}`}>
              {subforum.name}</Link></li>);
            })} 
        </ul>
      </div>
    )

    
  }

}



export default Subforums;
