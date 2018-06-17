import React, { Component } from 'react';
import logo from './monkey.png';
import './App.css';
import { Link, Route, Switch, Redirect } from 'react-router-dom';
import Cookies from 'universal-cookie';
import Subforum from './Subforum.jsx';
import Subforums from './Subforums.jsx';
import Data from './Data.js';
import {Thread, NewThread } from './Thread.jsx';
import {Error, PermissionError} from './Error.jsx';
import {TwoFieldForm, OneFieldSelectForm} from './Forms.jsx';
import {AdminView} from './Admin.jsx';
 

const Hot = () => (
  <div>
    <Homepage/>
  </div>
);

const Top = ({ match }) => (
  <div> 
    <h1>Top</h1>
    <Homepage/>
  </div>
);

const New = () => (
  <div>
    <h1>New</h1>
    <Homepage/>
  </div>
);

const MessagePage = ({match}) => (
  <div>
    <h1>Messages</h1>
    <Link to={`${match.url}/new`}>Create New Message</Link>
  </div>
);

const NewMessagePage = () => (
  <div>
    <h1>Compose New Message</h1>
    <TwoFieldForm fieldName1 = "Username" fieldName2 = "Message Body" submitName = "Send"/>
  </div>
);

const Subscribed = () => (
  <div>
    <h1>Your Subforums</h1>
  </div>
);

const Search = () => (
  <div>
    <h1>Search</h1>
    <OneFieldSelectForm fieldName1 = "Search Phrase" fieldName2 = "From" submitName = "Search" options = {["Subforum", "Thread"]}/>
  </div>
);

const cookies = new Cookies();

class App extends Component {
  constructor(props){
    super(props);
   (cookies && cookies.get('username') && cookies.get('username') !== "undefined") ? this.state = {loggedIn : true} : this.state = {loggedIn : false};
    beginSession = beginSession.bind(this);
    endSession = endSession.bind(this);
  }
    
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className="App-title">The Boboverse</h1>
          <NavigationButtons/>
        </header>
        <RouteDirectory/>
      </div>
    );
  }
}

function LoginPage(props){
  if(cookies && cookies.get('username') && cookies.get('username') !== "undefined"){
    return(
      <div>
        <h1>Hello {cookies.get('username')}</h1>
        <button onClick = {endSession}>Press to Logout</button>
      </div>
    );
  }
  else{
    return(
      <div>
        <TwoFieldForm handler = {beginSession} fieldName1 = "Email" fieldName2 = "Password"/>
      </div>
    );
  }
}

//login handler
function beginSession(email, password){
  //type checking should mostly be done when creating a user, which is functionality
  //that currently doesn't exist... 
  if(email !== "undefined" && email !== ""){
    var account = Data.userData.find(acc => acc.email === email);
    if(account && account.password === password){
      cookies.set('username', account.username, { path: '/' });
      cookies.set('adminBit', account.isAdmin, { path: '/' });
      this.setState({loggedIn : true});
    } 
  }
}

//logout handler
function endSession(){
  cookies.set('username', undefined, { path: '/' });
  cookies.set('adminBit', undefined, { path: '/' });
  this.setState({loggedIn : false});
}

function RouteDirectory(){
  if(cookies && cookies.get('username') && cookies.get('username') !== "undefined"){
    return(
      <div>
            <Switch>
              <Route exact path="/" component={Hot}/>
              <Route exact path="/admin" component={AdminPage}/>
              <Route exact path="/top" component={Top}/>
              <Route exact path="/new" component={New}/>
              <Route exact path="/login" component={LoginPage}/>
              <Route exact path='/messages' component = {MessagePage}/>
              <Route exact path='/messages/new' component = {NewMessagePage}/>
              <Route exact path="/subscribed" component={Subscribed}/>
              <Route exact path="/search" component={Search}/>
              <Route exact path="/s" component={Subforums}/>
              <Route exact path="/s/:name" component={Subforum}/>
              <Route exact path="/s/:name/new" component={NewThread}/>
              <Route exact path="/s/:name/:id" component={Thread}/>
              <Route path="" component={Error}/>
            </Switch>
          </div>
    );
}
else{
  return(
    <div>
      <Switch>
        <Route exact path="/login" component={LoginPage}/>
        <Route path="" render={() => (
            <Redirect to="/login"/>)}/>
      </Switch>
    </div>
    );
  }
}


function NavigationButtons(props){
  //need home, subforum list, login/logout
  return (
  <div className = "Navigation-buttons">
      <button><Link to="/">Homepage</Link></button>
      <button><Link to="/s">Subforum List</Link></button>
      <button><Link to="/subscribed">Subscribed List</Link></button>
      <button><Link to="/search">Search</Link></button>
      <button><Link to="/messages">Messages</Link></button>
      <DisplayUsername/>
      <DisplayAdmin/>
      <button onClick={endSession}>Logout</button>
    </div>
  );
}

//!!! currently displaying username as a button since making it a header
//makes other buttons disappear???
function DisplayUsername(){
  const f = cookies.get('username');
  if(cookies && f && f !== "undefined"){
    return (
      <button>{f}</button>
    );
  }
  return null;
}

function AdminPage(props){
  const adminBit = Number(cookies.get('adminBit'));
  if(!adminBit){
    return <PermissionError/>;
  }
  else{
    return <AdminView/>;
  }
}

function DisplayAdmin(){
  const ab = cookies.get('adminBit');
  var view;
  Number(ab) ? view = <button><Link to="/admin">Admin</Link></button> : view = null;
  return view;
}

function Homepage(props){
  const homepage = (
  <div className = "Homepage">
    <h1> Homepage </h1>
    <FilterButtons/>
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
      <td>{thread.title}</td>
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

//determines if a user should be able to delete an entity (such as a comment, thread, subforum, user, etc)
//!!! stub
function DeleteEntity(){
  //will need to pull up isAdmin bit for user and subforums they moderate
  //is it possible/good practice to bring up
  return null;
}


export default App;
