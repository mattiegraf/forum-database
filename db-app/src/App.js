import React, { Component } from 'react';
import logo from './monkey.png';
import './App.css';
import { Link, Route, Switch } from 'react-router-dom';
import Subforum from './Subforum.jsx';
import Subforums from './Subforums.jsx';
import Data from './Data.js';


/* Home component */
const Hot = () => (
  <div>
    <Homepage/>
  </div>
);

/* Category component */
const Top = ({ match }) => (
  <div> 
    <h1>Top</h1>
    <Homepage/>
  </div>
);

/* Products component */
const New = () => (
  <div>
    <h1>New</h1>
    <Homepage/>
  </div>
);

class App extends Component {
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className="App-title">Team Bobo Forum</h1>
        </header>
        <FilterButtons/>
        <div>
          <Switch>
            <Route exact path="/" component={Hot}/>
            <Route path="/top" component={Top}/>
            <Route path="/new" component={New}/>
            <Route exact path="/s" component={Subforums}/>
            <Route path="/s/:name" component={Subforum}/>
          </Switch>
        </div>
      </div>
    );
  }
}


function Homepage(props){
  const homepage = (
  <div className = "Homepage">
    <h1> Homepage </h1>
    <SubforumList subforums = {Data.subforumData}/>
  </div>
  );

  return homepage;
}


function SubforumList(props) {
  const subforums = props.subforums;
  const listItems = subforums.map((subforum) =>
  
    <table>
      <caption>{subforum.name}</caption>
      <tbody>
        <ThreadList threads = {subforum.threads}/>
        </tbody>
      </table>
  

  );
  return listItems;
}

function ThreadList(props) {
  const threads = props.threads;
  const listItems = threads.map((thread) =>
    <tr>
      <td>{thread}</td>
    </tr>

  );
  return listItems;
}

function FilterButtons(props){
  return (
    <div className = "Filter-buttons">
      <button><Link to="/">Hot</Link></button>
      <button><Link to="/top">Top</Link></button>
      <button><Link to="/new">New</Link></button>
    </div>
  );
}

export default App;
