import React, { Component } from 'react';
import logo from './monkey.png';
import './App.css';
import { Link, Route, Switch, Redirect } from 'react-router-dom';
import Cookies from 'universal-cookie';
import Subforum from './Subforum.jsx';
import Subforums from './Subforums.jsx';
import {Thread, NewThread } from './Thread.jsx';
import {Error, PermissionError} from './Error.jsx';
import {TwoFieldForm, OneFieldSelectForm} from './Forms.jsx';
import {AdminView, AdminStats, AdminCommentStream} from './Admin.jsx'; 
import {MessagePage, NewMessagePage} from './Message.jsx';

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

const cookies = new Cookies();

class App extends Component {
  constructor(props){
    super(props);
   (cookies && cookies.get('username') && cookies.get('username') !== "undefined") ? this.state = {loggedIn : true} : this.state = {loggedIn : false};
    beginSession = beginSession.bind(this);
    endSession = endSession.bind(this);
    //connection.connect();
    //initializeDb();
    //connection.end();
    if(!cookies.get('dbinit')){

    }
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


function beginSession(email, password){
    let self = this;
    if(email && email !== "undefined"){
      fetch('/user/'+email+'/'+password, {
          method: 'GET'
      }).then(function(response) {
          if (response.status >= 400) {
              throw new Error("Bad response from server");
          }
          return response.json();
      }).then(function(data) {
        console.log(data);
        cookies.set('username', data[0].username, { path: '/' });
        cookies.set('email', data[0].email, { path: '/' })
        cookies.set('adminBit', data[0].isadmin.data[0], { path: '/' })
        self.setState({loggedIn : true});
    }).catch(err => {
      console.log('caught it!',err);
      });
    }

}

//logout handler
function endSession(){
  cookies.set('username', undefined, { path: '/' });
  cookies.set('email', undefined, { path: '/' });
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
              <Route exact path="/admin/stats" component={AdminStats}/>
              <Route exact path="/admin/commentstream" component={AdminCommentStream}/>
              <Route exact path="/top" component={Top}/>
              <Route exact path="/new" component={New}/>
              <Route exact path="/login" component={LoginPage}/>
              <Route exact path='/messages' component = {MessagePage}/>
              <Route exact path='/messages/new' component = {NewMessagePage}/>
              <Route exact path="/leaderboard" component={Leaderboard}/>
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
      <button><Link to="/leaderboard">Leaderboard</Link></button>
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
    return <AdminView match={props.match}/>;
  }
}

function DisplayAdmin(){
  const ab = cookies.get('adminBit');
  var view;
  Number(ab) ? view = <button><Link to="/admin">Admin</Link></button> : view = null;
  return view;
}

/*
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
*/
class Homepage extends Component {
  constructor(props) {
    super(props)
    this.state = {
        users: []
    }
}

componentDidMount() {
    let self = this;
    fetch('/clicked', {
        method: 'GET'
    }).then(function(response) {
        if (response.status >= 400) {
            throw new Error("Bad response from server");
        }
        return response.json();
    }).then(function(data) {
        self.setState({users: data});
    }).catch(err => {
    console.log('caught it!',err);
    })
}

  render(){
    return (
      <div><ul>
        {this.state.users.map( (account) => {
          return (<li>{account.email}</li>);
        })}
      </ul></div>
    )
  }

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


class Leaderboard extends Component {
  constructor(props) {
    super(props)
    this.state = {
        accounts: []
    }
    this.match = props.match;
}

componentDidMount() {
    let self = this;
    fetch('/top20bscore', {
        method: 'GET'
    }).then(function(response) {
        if (response.status >= 400) {
            throw new Error("Bad response from server");
        }
        return response.json();
    }).then(function(data) {
        self.setState({accounts: data});
        console.log(data);
    }).catch(err => {
    console.log('caught it!',err);
    })
}

  render(){
    return(
      <div>
          <h2>Top 20 Bobos</h2>
          <ol> 
          {this.state.accounts.map( (account) => {
              return (<li> {account.email}, Score: {account.banana_score}</li>);
              })} 
          </ol>
      </div>
    );

    

    
  }

}

export default App;
