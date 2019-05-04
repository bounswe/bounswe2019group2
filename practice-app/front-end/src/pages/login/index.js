import React, { Component } from "react";
import { connect } from "react-redux";
import { Form, Button, Input, Card } from "antd";
import { Redirect } from "react-router-dom";

import * as authActionManager from "../../redux/auth/actions";

class Login extends Component {
  handleSubmit = e => {
    e.preventDefault();
    this.props.form.validateFields((err, values) => {
      if (!err) {
        this.props.dispatch(
          authActionManager.actionCreators.saveUser({
            email: values.email,
            password: values.password
          })
        );
      }
    });
    this.props.history.push("investments");
  };

  render() {
    const { getFieldDecorator } = this.props.form;
    return (
      <div>
        <Card title="LOGIN">
          <Form layout="vertical" onSubmit={this.handleSubmit}>
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
                    message: "Please provide your password!"
                  }
                ]
              })(<Input type="password" placeholder="******" />)}
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

export default Form.create({ name: "login_form" })(
  connect(
    null,
    null
  )(Login)
);
