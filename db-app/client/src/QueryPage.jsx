import React, { Component } from 'react';

function QueryPage(props){
    return(
        <div className = "App-QueryPage">
            <h1> General Query Page </h1>
            <p> Make a General Query with your Own Specifications </p>
            <br/>
            <ThreeFieldForm fieldName1 = "SELECT" fieldName2 = "FROM" fieldName3 = "WHERE" submitName = "Query" handler = {GeneralQueryHandler}/>
        </div>
    );
}

function GeneralQueryHandler(select, from, where){
    let self = this;
    //console.log(this.state.mah);
    if(where){
        fetch('/query/'+select+'/'+from+'/'+where, {
            method: 'GET'
        }).then(function(response) {
            if (response.status >= 400) {
                throw new Error("Bad response from server");
            }
            return response.json();
        }).then(function(data) {
        console.log(data);
        self.setState({values : data});
    }).catch(err => {
        console.log('caught it!',err);
        });
    }else{
        fetch('/queryw/'+select+'/'+from, {
            method: 'GET'
        }).then(function(response) {
            if (response.status >= 400) {
                throw new Error("Bad response from server");
            }
            return response.json();
        }).then(function(data) {
        console.log(data);
        self.setState({values : data});
    }).catch(err => {
        console.log('caught it!',err);
        });
    }
}

//generic three field form for React
class ThreeFieldForm extends React.Component {
    constructor(props) {
      super(props);
      this.state = {value1: '', value2: '', value3: '', values : []};
  
      this.handleChange1 = this.handleChange1.bind(this);
      this.handleChange2 = this.handleChange2.bind(this);
      this.handleChange3 = this.handleChange3.bind(this);
      this.handleSubmit = this.handleSubmit.bind(this);
      this.submissionHandler = props.handler;
      this.fieldName1 = props.fieldName1;
      this.fieldName2 = props.fieldName2;
      this.fieldName3 = props.fieldName3;
      props.submitName ? this.submitName = props.submitName : this.submitName = "Submit";
      this.rest = props;
    }
  
    handleChange1(event) {
      this.setState({value1: event.target.value});
    }
  
    handleChange2(event) {
      this.setState({value2: event.target.value});
    }

    handleChange3(event) {
        this.setState({value3: event.target.value});
      }
  
    handleSubmit(event) {
      //input processing must be done in handler
      this.submissionHandler(this.state.value1, this.state.value2, this.state.value3, this.rest);
      event.preventDefault();
    }
  
    render() {
      return (
        <div>
        <form onSubmit={this.handleSubmit}>
          <label>
            {this.fieldName1}
            <input type="text" value={this.state.value1} onChange={this.handleChange1} />
          </label>
          <br></br>
          <label>
            {this.fieldName2}
            <input type="text" value={this.state.value2} onChange={this.handleChange2} />
          </label>
          <br></br>
          <label>
            {this.fieldName3}
            <input type="text" value={this.state.value3} onChange={this.handleChange3} />
          </label>
          <br></br>
          <input type="submit" value={this.submitName} />
        </form>
        <DisplayQueryResult values = {this.state.values}/>
        </div>
      );
    }
  }



  class DisplayQueryResult extends Component {
    constructor(props) {
      super(props)
      
  }
  
    render(){
      return (
          <div>
           <h3>Results</h3>
            {this.props.values.map( (value)=> {
                return(
                <div>
                    <p>{JSON.stringify(value)}</p>
                </div>
            
                );})}
            </div>
            );
  
      
    }
  
}


  export {QueryPage};