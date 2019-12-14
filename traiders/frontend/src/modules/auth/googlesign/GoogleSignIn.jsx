import React, { Component } from 'react';
import GoogleLogin from 'react-google-login';

class GoogleSignIn extends Component {
  render() {
    const responseGoogle = (response) => {
      console.log(response);
    };

    return (
      <div>
        <GoogleLogin
          clientId="729799288738-fe0gs3ahsru0ecfn242gvtq5m83rog57.apps.googleusercontent.com"
          buttonText="LOGIN WITH GOOGLE"
          onSuccess={responseGoogle}
          onFailure={responseGoogle}
        />
      </div>
    );
  }
}

export default GoogleSignIn;
