import React, { Component } from 'react';
import { Form, Icon, Input, Button, Checkbox } from 'antd';
import { Link } from 'react-router-dom';
import fetch from 'cross-fetch';

import { API } from '../../../redux/apiConfig';
import { PostWithUrlBody } from '../../../common/http/httpUtil';
import MapContainer from '../../../components/map/MapContainer';
import './register.scss';
import Page from '../../../components/page/Page';
import history from '../../../common/history';

class Register extends Component {
  constructor(props) {
    super(props);
    this.state = {
      city: 'İstanbul',
      country: 'Turkey',
      // eslint-disable-next-line
      isTrader: false
    };
  }

  handleSubmit = (e) => {
    e.preventDefault();
    const { form } = this.props;
    const { city, country } = this.state;
    // eslint-disable-next-line
    const is_trader = this.state.isTrader;
    const passValue = form.getFieldValue('password');
    const ibanValue = form.getFieldValue('iban');

    if (this.validatePasswordRegex(passValue)) {
      // eslint-disable-next-line
      if (is_trader) {
        fetch(`https://openiban.com/validate/${ibanValue}`)
          .then((response) => response.json())
          .then((valid) => {
            if (valid && valid.valid) {
              form.validateFields(
                [
                  'username',
                  'password',
                  'email',
                  'first_name',
                  'last_name',
                  'iban'
                ],

                (errors, values) => {
                  if (!errors) {
                    PostWithUrlBody(`${API}/users/`, {
                      ...values,
                      is_trader,
                      city,
                      country
                    })
                      .then((response) => {
                        if (response.status === 201) {
                          // eslint-disable-next-line
                          history.push('/login');
                        } // else if (!response.ok) {
                        // eslint-disable-next-line
                        //response.text().then((text) => alert(text));}
                        else {
                          // eslint-disable-next-line
                          response
                            .json()
                            .then((res) => alert(res.type, res.message));
                        }
                      })

                      .catch((error) =>
                        // eslint-disable-next-line no-console
                        console.log('Error when fetch register\n', error)
                      );
                  } else {
                    // eslint-disable-next-line
                    alert(
                      Object.values(
                        Object.values(
                          Object.values(Object.values(errors)[0])[0]
                        )[0]
                      )[0]
                    );
                  }
                }
              );
            } else {
              // eslint-disable-next-line
              alert('Given IBAN is not a valid IBAN');
            }
          })
          .catch((error) =>
            // eslint-disable-next-line no-console
            console.log('Error when fetch register\n', error)
          );
      } else {
        form.validateFields(
          ['username', 'email', 'first_name', 'last_name', 'password'],

          (errors, values) => {
            if (!errors) {
              PostWithUrlBody(`${API}/users/`, {
                ...values,
                is_trader,
                city,
                country
              })
                .then((response) => {
                  if (response.status === 201) {
                    // eslint-disable-next-line
                    history.push('/login');
                  } // else if (!response.ok) {
                  // eslint-disable-next-line
                  //response.text().then((text) => alert(text));}
                  else {
                    // eslint-disable-next-line
                    response.json().then((res) => alert(res.type, res.message));
                  }
                })

                .catch((error) =>
                  // eslint-disable-next-line no-console
                  console.log('Error when fetch register\n', error)
                );
            } else {
              // eslint-disable-next-line
              alert(
                Object.values(
                  Object.values(Object.values(Object.values(errors)[0])[0])[0]
                )[0]
              );
            }
          }
        );
      }
    } else {
      // eslint-disable-next-line
      alert(
        "Password should be between 8-15 characters and include atleast a big letter 'A - Z' , a small letter 'a-z' and a number between 0-9"
      );
    }
  };

  setCity = (city) => {
    if (city) {
      this.setState({
        city
      });
    }
  };

  setCountry = (country) => {
    if (country) {
      this.setState({
        country
      });
    }
  };

  validatePasswordRegex = (value) => {
    const mediumRegex = new RegExp(
      '^(((?=.*[a-z])(?=.*[A-Z]))|((?=.*[a-z])(?=.*[0-9]))|((?=.*[A-Z])(?=.*[0-9])))(?=.{8,15})'
    );
    // const reg = /^[A-Za-z0-9]{7,14}$/;
    const test = mediumRegex.test(value);

    if (!test) {
      return false;
    }
    return true;
  };

  handleConfirmBlur = (e) => {
    const { value } = e.target;
    const { confirmDirty } = this.state;
    this.setState({ confirmDirty: confirmDirty || !!value });
  };

  compareToFirstPassword = (rule, value, callback) => {
    const { form } = this.props;
    if (value && value !== form.getFieldValue('password')) {
      callback('Two passwords that you enter is inconsistent!');
    } else {
      callback();
    }
  };

  validateToNextPassword = (rule, value, callback) => {
    const { form } = this.props;
    const { confirmDirty } = this.stete;
    if (value && confirmDirty) {
      form.validateFields(['confirm'], { force: true });
    }
    callback();
  };

  handleCheckbox = (e) => {
    e.preventDefault();

    this.setState((prevState) => ({
      isTrader: !prevState.isTrader
    }));
  };

  render() {
    const { form } = this.props;
    const { getFieldDecorator } = form;
    const intentionalSpace = <br />;
    // eslint-disable-next-line
    const { isTrader } = this.state;
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
          <Form onSubmit={this.handleSubmit} className="register-form">
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
            <Form.Item help="Password should be between 8-15 characters and include a big letter 'A - Z' and a number between 0-9!">
              {getFieldDecorator('password', {
                rules: [
                  {
                    required: true,
                    message:
                      "Password should be between 8-15 characters and include a big letter 'A - Z' and a number between 0-9!"
                  }
                ]
              })(
                <Input.Password
                  prefix={
                    <Icon type="lock" style={{ color: 'rgba(0,0,0,.25)' }} />
                  }
                  type="password"
                  placeholder="Password"
                  min={8}
                  max={15}
                />
              )}
            </Form.Item>
            <Form.Item>
              {getFieldDecorator('confirm', {
                rules: [
                  {
                    required: false,
                    message:
                      "Password should be between 8-15 characters and include a big letter 'A - Z' , a number between 0-9!  and be between 8-15 characters!"
                  },
                  {
                    validator: this.compareToFirstPassword
                  }
                ]
              })(
                <Input.Password
                  prefix={
                    <Icon type="lock" style={{ color: 'rgba(0,0,0,.25)' }} />
                  }
                  type="password"
                  placeholder="Confirm"
                  min={8}
                  max={15}
                />
              )}
            </Form.Item>
            <Form.Item>
              {getFieldDecorator('email', {
                rules: [
                  {
                    type: 'email',
                    message: 'The input is not valid E-mail!'
                  },
                  {
                    required: true,
                    message: 'Please input your E-mail!'
                  }
                ]
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
              {getFieldDecorator('first_name', {
                rules: [{ required: true, message: 'Please input your name!' }]
              })(<Input type="text" placeholder="First Name" />)}
            </Form.Item>
            <Form.Item>
              {getFieldDecorator('last_name', {
                rules: [
                  { required: true, message: 'Please input your surname!' }
                ]
              })(<Input type="text" placeholder="Last Name" />)}
            </Form.Item>

            <Checkbox onChange={this.handleCheckbox}>
              I want to have a Trader Account
            </Checkbox>

            {isTrader && (
              <Form.Item>
                {getFieldDecorator('iban', {
                  rules: [
                    { required: false, message: 'Please enter your IBAN!' }
                  ]
                })(<Input type="text" placeholder="IBAN" />)}
              </Form.Item>
            )}
            <Form.Item>
              <MapContainer
                setCity={this.setCity}
                setCountry={this.setCountry}
              />
            </Form.Item>
            {intentionalSpace}
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
  }
}

export default Form.create({ name: 'registerForm' })(Register);
