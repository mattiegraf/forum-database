import React from 'react';
class LoginForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {value1: '', value2: ''};

    this.handleChange1 = this.handleChange1.bind(this);
    this.handleChange2 = this.handleChange2.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.submissionHandler = props.handler;
  }

  handleChange1(event) {
    this.setState({value1: event.target.value});
  }

  handleChange2(event) {
    this.setState({value2: event.target.value});
  }

  handleSubmit(event) {
    //alert('A name was submitted: ' + this.state.value);
    //ive controlled for input in many places, we will probably want to centralize
    //where to do that. (I guess more places doesn't hurt, but still.)
    //currently username+password cannot be null
    if(this.state.value1 !== "undefined" && this.state.value1 !== "" && this.state.value2 !== "undefined" && this.state.value2 !== ""){
      this.submissionHandler(this.state.value1, this.state.value2);
    }
    event.preventDefault();
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <label>
          Username:
          <input type="text" value={this.state.value1} onChange={this.handleChange1} />
        </label>
        <br></br>
        <label>
          Password:
          <input type="text" value={this.state.value2} onChange={this.handleChange2} />
        </label>
        <br></br>
        <input type="submit" value="Submit" />
      </form>
    );
  }
}

class MessageForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {value1: '', value2: ''};

    this.handleChange1 = this.handleChange1.bind(this);
    this.handleChange2 = this.handleChange2.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.submissionHandler = props.handler;
  }

  handleChange1(event) {
    this.setState({value1: event.target.value});
  }

  handleChange2(event) {
    this.setState({value2: event.target.value});
  }

  handleSubmit(event) {
    //alert('A name was submitted: ' + this.state.value);
    //currently username+message body cannot be null, message body can be undefined
    if(this.state.value1 !== "undefined" && this.state.value1 !== ""  && this.state.value2 !== ""){
      this.submissionHandler(this.state.value1, this.state.value2);
    }
    event.preventDefault();
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <label>
          Send to Username:
          <input type="text" value={this.state.value1} onChange={this.handleChange1} />
        </label>
        <br></br>
        <label>
          Message Body:
          <input type="text" value={this.state.value2} onChange={this.handleChange2} />
        </label>
        <br></br>
        <input type="submit" value="Send" />
      </form>
    );
  }
}

export {LoginForm, MessageForm};