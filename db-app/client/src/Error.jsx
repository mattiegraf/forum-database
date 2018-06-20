import React from 'react';

const Error = () => {
    return (
    <div>
        <h1>404: Page does not exist</h1>
    </div>
)};

const PermissionError = () => {
    return (
    <div>
        <h1>403: You do not have permission to view this page</h1>
    </div>
)};


function AlertErrors(data, extra){
    const dbErr = data[0] ? data[0].error : undefined;
    if(dbErr){
        if(extra){
            alert("Error!\nMessage: " + extra + "\nCode: " + dbErr.code + "\nSQLError: " + dbErr.sqlMessage);
        }
        else{
            alert("Error!\nCode: " + dbErr.code + "\nSQLError: " + dbErr.sqlMessage);
        }
        console.log(data);
    }
}


function AlertUnaffected(data, extra){
    const ar = data.affectedRows;
    if(!ar){
        if(extra){
            alert("Error!\nMessage: " + extra +  "\nSQLError: No rows were affected");
        }
        else{
            alert("Error!\nSQLError: No rows were affected");
        }
        console.log(data);
    }
}

export {Error, PermissionError, AlertErrors, AlertUnaffected};
