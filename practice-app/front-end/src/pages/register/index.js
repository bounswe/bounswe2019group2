import React, { Component } from "react";
import { connect } from "react-redux";
import { Form, Button, Input, Card } from "antd";

import * as authActionManager from "../../redux/auth/actions";

class Register extends Component {
  handleSubmit = e => {
    this.props.form.validateFields((err, values) => {
      if (!err) {
        this.props
          .dispatch(
            authActionManager.api.signUpUser({
              username: values.username,
              email: values.email,
              password: values.password
            })
          )
          .then()
          .catch();
      }
    });
  };

  render() {
    const { getFieldDecorator } = this.props.form;
    return (
      <div>
        <Card title="REGISTER">
          <Form layout="vertical" onSubmit={this.handleSubmit}>
            <Form.Item label="Username: ">
              {getFieldDecorator("username", {
                rules: [
                  {
                    required: true,
                    message: "You should pick a username!"
                  }
                ]
              })(<Input placeholder="username" />)}
            </Form.Item>
            <Form.Item label="Email: ">
              {getFieldDecorator("email", {
                rules: [
                  {
                    required: true,
                    message: "Please provide your email!"
                  }
                ]
              })(<Input placeholder="example@example.com" />)}
            </Form.Item>
            <Form.Item label="Password: ">
              {getFieldDecorator("password", {
                rules: [
                  {
                    required: true,
                    message: "You should provide a password!"
                  }
                ]
              })(<Input type="password" placeholder="*******" />)}
            </Form.Item>
            <Form.Item>
              <Button type="primary" htmlType="submit">
                LOGIN
              </Button>
            </Form.Item>
          </Form>
        </Card>
      </div>
    );
  }
}

export default Form.create({ name: "register_form" })(
  connect(
    null,
    null
  )(Register)
);
