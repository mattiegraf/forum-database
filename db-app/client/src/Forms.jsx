import React from 'react';

//generic one field form for React
class OneFieldForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {value: ''};

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.submissionHandler = props.handler;
    this.fieldName = props.fieldName;
    props.submitName ? this.submitName = props.submitName : this.submitName = "Submit";
    this.props = props;
  }

  handleChange(event) {
    this.setState({value: event.target.value});
  }

  handleSubmit(event) {
    //input processing must be done in handler
    this.submissionHandler(this.state.value, this.props);
    event.preventDefault();
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <label>
          {this.fieldName}:
          <input type="text" value={this.state.value} onChange={this.handleChange} />
        </label>
        <br></br>
        <input type="submit" value={this.submitName} />
      </form>
    );
  }
}


//generic two field form for React
class TwoFieldForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {value1: '', value2: ''};

    this.handleChange1 = this.handleChange1.bind(this);
    this.handleChange2 = this.handleChange2.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.submissionHandler = props.handler;
    this.fieldName1 = props.fieldName1;
    this.fieldName2 = props.fieldName2;
    props.submitName ? this.submitName = props.submitName : this.submitName = "Submit";
    this.rest = props.rest;
  }

  handleChange1(event) {
    this.setState({value1: event.target.value});
  }

  handleChange2(event) {
    this.setState({value2: event.target.value});
  }

  handleSubmit(event) {
    //input processing must be done in handler
    this.submissionHandler(this.state.value1, this.state.value2, this.rest);
    event.preventDefault();
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <label>
          {this.fieldName1}:
          <input type="text" value={this.state.value1} onChange={this.handleChange1} />
        </label>
        <br></br>
        <label>
          {this.fieldName2}:
          <input type="text" value={this.state.value2} onChange={this.handleChange2} />
        </label>
        <br></br>
        <input type="submit" value={this.submitName} />
      </form>
    );
  }
}

//generic one field and one select table for react
class OneFieldSelectForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {value1: '', value2: ''};

    this.handleChange1 = this.handleChange1.bind(this);
    this.handleChange2 = this.handleChange2.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.submissionHandler = props.handler;
    this.fieldName1 = props.fieldName1;
    this.fieldName2 = props.fieldName2;
    props.submitName ? this.submitName = props.submitName : this.submitName = "Submit";

    this.optionList = props.options.map( (opt) => {
      return(
        <option value={opt}>{opt}</option>)});
  }

  handleChange1(event) {
    this.setState({value1: event.target.value});
  }

  handleChange2(event) {
    this.setState({value2: event.target.value});
  }

  handleSubmit(event) {
    //input processing must be done in handler
    this.submissionHandler(this.state.value1, this.state.value2);
    event.preventDefault();
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <label>
          {this.fieldName1}:
          <input type="text" value={this.state.value1} onChange={this.handleChange1} />
        </label>
        <br></br>
        <label>
          {this.fieldName2}:
          <select onChange={this.handleChange2}>
            {this.optionList}
          </select>
        </label>
        <br></br>
        <input type="submit" value={this.submitName} />
      </form>
    );
  }
}

class OneSelectForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {value: ''};

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.submissionHandler = props.handler;
    this.fieldName = props.fieldName;
    props.submitName ? this.submitName = props.submitName : this.submitName = "Submit";

    this.optionList = props.options.map( (opt) => {
      return(
        <option value={opt}>{opt}</option>)});
  }

  handleChange(event) {
    this.setState({value: event.target.value});
  }

  handleSubmit(event) {
    //input processing must be done in handler
    this.submissionHandler(this.state.value);
    event.preventDefault();
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <label>
          {this.fieldName}:
          <select onChange={this.handleChange}>
            {this.optionList}
          </select>
        </label>
        <br></br>
        <input type="submit" value={this.submitName} />
      </form>
    );
  }
}

export {OneFieldForm, TwoFieldForm, OneFieldSelectForm, OneSelectForm};