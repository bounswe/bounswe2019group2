import React from 'react';
import { Form, Icon, Input, Button } from 'antd';
import { Link } from 'react-router-dom';

import './register.scss';
import Page from '../../../components/page/Page';

const Register = (props) => {
  const handleSubmit = (e) => {
    e.preventDefault();
    const { postUserRegister } = props;
    props.form.validateFields((err, values) => {
      if (!err) {
        postUserRegister(values);
      }
    });
  };
  const { form } = props;
  const { getFieldDecorator } = form;

  return (
    <Page>
      <div className="register-container">
        <div className="tabs">
          <Link to="/login">
            <Button>LOG IN</Button>
          </Link>
          <Link to="/register">
            <Button>REGISTER</Button>
          </Link>
        </div>
        <Form onSubmit={handleSubmit} className="register-form">
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
            {getFieldDecorator('email', {
              rules: [{ required: true, message: 'Please input your email!' }]
            })(
              <Input
                prefix={
                  <Icon type="mail" style={{ color: 'rgba(0,0,0,.25)' }} />
                }
                type="text"
                placeholder="Email"
              />
            )}
          </Form.Item>
          <Form.Item>
            {getFieldDecorator('firstName', {
              rules: [{ required: true, message: 'Please input your name!' }]
            })(<Input type="text" placeholder="First Name" />)}
          </Form.Item>
          <Form.Item>
            {getFieldDecorator('lasttName', {
              rules: [{ required: true, message: 'Please input your surname!' }]
            })(<Input type="text" placeholder="Surname" />)}
          </Form.Item>
          <Form.Item>
            {getFieldDecorator('iban', {
              rules: [{ required: true, message: 'Please enter your IBAN!' }]
            })(<Input type="text" placeholder="IBAN" />)}
          </Form.Item>
          <Form.Item>
            {getFieldDecorator('prefferedCurrency', {
              rules: [{ required: true, message: 'Please input your name!' }]
            })(<Input type="text" placeholder="Preferred Currency" />)}
          </Form.Item>
          <Form.Item>
            <Button
              type="primary"
              htmlType="submit"
              className="login-form-button"
            >
              Register
            </Button>
            Already have an account?<Link to="/login"> login!</Link>
          </Form.Item>
        </Form>
      </div>
    </Page>
  );
};

export default Form.create({ name: 'registerForm' })(Register);
