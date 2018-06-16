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


export {Error, PermissionError};
