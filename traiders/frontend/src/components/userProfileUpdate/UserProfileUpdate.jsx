import React from 'react';
import { Form, Icon, Input, Button } from 'antd';
import { Link } from 'react-router-dom';
import { connect } from 'react-redux';

import { PatchWithAuthorization } from '../../common/http/httpUtil';
import './user-profile-update.scss';
import Page from '../page/Page';

const UserProfileUpdate = (props) => {
  const { form } = props;
  const { getFieldDecorator } = form;
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

  const { user } = props.user;

  const handleUpdate = (e) => {
    e.preventDefault();
    props.form.validateFields((err, values) => {
      const { firstName, lastName, iban } = values;
      const body = {
        first_name: firstName,
        last_name: lastName,
        iban
      };
      const token = props.user.key;
      const url = `https://api.traiders.tk/users/${user.id}`;

      PatchWithAuthorization(url, body, token).then((response) =>
        console.log(response)
      );
    });
  };

  return (
    <Page>
      {user ? (
        <Form
          onSubmit={handleUpdate}
          {...formItemLayout}
          className="update-form"
        >
          <Form.Item label="Username">
            {getFieldDecorator('username', {
              initialValue: user.username
            })(
              <Input
                prefix={
                  <Icon type="user" style={{ color: 'rgba(0,0,0,.25)' }} />
                }
                readOnly
              />
            )}
          </Form.Item>
          <Form.Item label="Email">
            {getFieldDecorator('email', {
              initialValue: user.email
            })(
              <Input
                prefix={
                  <Icon type="mail" style={{ color: 'rgba(0,0,0,.25)' }} />
                }
                type="text"
                readOnly
              />
            )}
          </Form.Item>
          <Form.Item label="First Name">
            {getFieldDecorator('firstName', { initialValue: user.first_name })(
              <Input type="text" />
            )}
          </Form.Item>
          <Form.Item label="Last Name:">
            {getFieldDecorator('lastName', { initialValue: user.last_name })(
              <Input type="text" />
            )}
          </Form.Item>
          <Form.Item label="IBAN">
            {getFieldDecorator('iban', { initialValue: user.iban })(
              <Input type="text" />
            )}
          </Form.Item>
          <Form.Item label="Location">
            {getFieldDecorator('location', {
              initialValue: user.city + '/' + user.country.name
            })(<Input type="text" readOnly />)}
          </Form.Item>
          <Form.Item>
            <div className="buttons-container">
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

const mapStateToProps = (state) => {
  return {
    user: state.user.currentUser
  };
};

export default connect(mapStateToProps)(
  Form.create({ name: 'updateForm' })(UserProfileUpdate)
);
