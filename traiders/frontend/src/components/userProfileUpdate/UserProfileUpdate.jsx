import React from 'react';
import { Form, Icon, Input, Button } from 'antd';
import { Link } from 'react-router-dom';

import './user-profile-update.scss';
import Page from '../page/Page';

const UserProfileUpdate = (props) => {
  const datas = props;
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

  const { user } = datas.location.state;

  return (
    <Page>
      {user ? (
        <Form
          onSubmit={handleSubmit}
          {...formItemLayout}
          className="update-form"
        >
          <Form.Item label="Username">
            <Input
              prefix={<Icon type="user" style={{ color: 'rgba(0,0,0,.25)' }} />}
              defaultValue={user.username}
              readOnly
            />
          </Form.Item>
          <Form.Item label="Email">
            <Input
              prefix={<Icon type="mail" style={{ color: 'rgba(0,0,0,.25)' }} />}
              type="text"
              defaultValue={user.email}
              readOnly
            />
          </Form.Item>
          <Form.Item label="First Name">
            <Input type="text" defaultValue={user.first_name} />
          </Form.Item>
          <Form.Item label="Last Name:">
            <Input type="text" defaultValue={user.last_name} />
          </Form.Item>
          <Form.Item label="IBAN">
            <Input type="text" defaultValue={user.iban} />
          </Form.Item>
          <Form.Item label="Location">
            <Input
              readOnly
              type="text"
              defaultValue={`${user.city}/${user.country}`}
            />
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
      ) : (
        <div>:)</div>
      )}
    </Page>
  );
};

export default UserProfileUpdate;
