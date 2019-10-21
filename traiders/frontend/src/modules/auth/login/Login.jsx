import React from 'react';
import { Form, Icon, Input, Button, Checkbox } from 'antd';
import { Link } from 'react-router-dom';

import './login.scss';
import Page from '../../../components/page/Page';

const Login = (props) => {
  const { user } = props;

  const handleSubmit = (e) => {
    e.preventDefault();
    const { loginUser } = props;
    props.form.validateFields((err, values) => {
      if (!err) {
        loginUser(values);
      }
    });
  };
  const { form } = props;
  const { getFieldDecorator } = form;

  return (
    <Page>
      {!user ? (
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
