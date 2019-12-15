import React from 'react';
import { Form, Icon, Input, Button, Checkbox } from 'antd';
import { Link } from 'react-router-dom';

import GoogleLogin from 'react-google-login';

import './login.scss';
import Page from '../../../components/page/Page';
import history from '../../../common/history';

const Login = (props) => {
  const { user, form } = props;
  const { getFieldDecorator } = form;

  if (user) {
    history.push('/'); // If there is a logged in user then redirect to the home page
  }

  const handleSubmit = (e) => {
    e.preventDefault();
    const { loginUser } = props;
    props.form.validateFields((err, values) => {
      if (!err) {
        loginUser(values);
      }
    });
  };

  const responseGoogle = (response) => {
    const { loginUserWithGoogle } = props;
    if (response) {
      const accessToken = response.Zi.access_token;
      if (accessToken) {
        const body = {
          access_token: accessToken
        };
        loginUserWithGoogle(body);
      }
    }
  };

  return (
    <Page>
      {!user || !user.user ? (
        <div className="login-container">
          <div className="tabs">
            <Link to="/login">
              <Button>LOG IN</Button>
            </Link>
            <Link to="/register">
              <Button>REGISTER</Button>
            </Link>
          </div>
          <Form onSubmit={handleSubmit} className="login-form">
            <Form.Item>
              {getFieldDecorator('username', {
                rules: [
                  { required: true, message: 'Please input your username!' }
                ]
              })(
                <Input
                  prefix={
                    <Icon type="user" style={{ color: 'rgba(0,0,0,.25)' }} />
                  }
                  placeholder="Username"
                />
              )}
            </Form.Item>
            <Form.Item>
              {getFieldDecorator('password', {
                rules: [
                  { required: true, message: 'Please input your Password!' }
                ]
              })(
                <Input
                  prefix={
                    <Icon type="lock" style={{ color: 'rgba(0,0,0,.25)' }} />
                  }
                  type="password"
                  placeholder="Password"
                />
              )}
            </Form.Item>
            <Form.Item>
              {getFieldDecorator('remember', {
                valuePropName: 'checked',
                initialValue: true
              })(<Checkbox>Remember me</Checkbox>)}
              <a className="login-form-forgot" href="1">
                Forgot password
              </a>
              <div className="google-signin">
                <GoogleLogin
                  clientId="729799288738-fe0gs3ahsru0ecfn242gvtq5m83rog57.apps.googleusercontent.com"
                  buttonText="LOGIN WITH GOOGLE"
                  onSuccess={responseGoogle}
                  onFailure={responseGoogle}
                />
              </div>
              <Button
                type="primary"
                htmlType="submit"
                className="login-form-button"
              >
                Log in
              </Button>
              Or <Link to="/register"> register now!</Link>
            </Form.Item>
          </Form>
        </div>
      ) : (
        <Link to="/">Go to home page</Link>
      )}
    </Page>
  );
};

export default Form.create({ name: 'loginForm' })(Login);
