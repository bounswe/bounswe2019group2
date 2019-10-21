import React from 'react';
import { Form, Icon, Input, Button } from 'antd';
import { Link } from 'react-router-dom';

import './user-profile.scss';
import Page from '../page/Page';

const UserProfile = () => {
  const formItemLayout = {
    labelCol: {
      xs: { span: 24 },
      sm: { span: 8 }
    },
    wrapperCol: {
      xs: { span: 24 },
      sm: { span: 16 }
    }
  };
  const handleSubmit = (e) => {
    e.preventDefault();
  };
  return (
    <Page>
      <Form onSubmit={handleSubmit} {...formItemLayout} className="update-form">
        <Form.Item label="Username">
          <Input
            prefix={<Icon type="user" style={{ color: 'rgba(0,0,0,.25)' }} />}
            defaultValue="Username cannot change"
            readOnly
          />
        </Form.Item>
        <Form.Item label="Email">
          <Input
            prefix={<Icon type="mail" style={{ color: 'rgba(0,0,0,.25)' }} />}
            type="text"
            defaultValue="email@email.com"
            readOnly
          />
        </Form.Item>
        <Form.Item label="First Name">
          <Input type="text" defaultValue="First Name" />
        </Form.Item>
        <Form.Item label="Last Name:">
          <Input type="text" defaultValue="Surname" />
        </Form.Item>
        <Form.Item label="IBAN">
          <Input type="text" defaultValue="IBAN" />
        </Form.Item>
        <Form.Item label="Location">
          <Input readOnly type="text" defaultValue="City / Country" />
        </Form.Item>
        <Form.Item>
          <div className="container">
            <Link to="/changepassword">Change Password!</Link>
            <Button
              type="primary"
              htmlType="submit"
              className="update-form-button"
            >
              Update
            </Button>
          </div>
        </Form.Item>
      </Form>
    </Page>
  );
};

export default UserProfile;
