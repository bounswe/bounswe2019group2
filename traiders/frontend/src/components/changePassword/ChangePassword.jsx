import React from 'react';
import { Form, Icon, Input, Button } from 'antd';

import Page from '../page/Page';

const ChangePassword = () => {
  const handleSubmit = (e) => {
    e.preventDefault();
  };
  return (
    <Page>
      <Form onSubmit={handleSubmit} className="login-form">
        <Form.Item>
          <Input
            prefix={<Icon type="lock" style={{ color: 'rgba(0,0,0,.25)' }} />}
            type="password"
            placeholder="Old Password"
          />
        </Form.Item>
        <Form.Item>
          <Input
            prefix={<Icon type="lock" style={{ color: 'rgba(0,0,0,.25)' }} />}
            type="password"
            placeholder="New Password"
          />
        </Form.Item>
        <Form.Item>
          <Input
            prefix={<Icon type="lock" style={{ color: 'rgba(0,0,0,.25)' }} />}
            type="password"
            placeholder="New Password Confirmation"
          />
        </Form.Item>
        <Form.Item>
          <Button
            type="primary"
            htmlType="submit"
            className="login-form-button"
          >
            Change Password
          </Button>
        </Form.Item>
      </Form>
    </Page>
  );
};

export default ChangePassword;
