import React from 'react';
import { Layout, Menu, Button, Input } from 'antd';
import { Link } from 'react-router-dom';

import history from '../../common/history';
import Logo from './Logo';
import './navbar.scss';
import { navbarOptions } from '../../common/constants/generalConstants';

const { Header } = Layout;
const { Search } = Input;

const Navbar = (props) => {
  const navbarList = navbarOptions.map((element) => {
    return (
      <Menu.Item key={element.id}>
        <Link to={element.url}>{element.name}</Link>
      </Menu.Item>
    );
  });

  const Logout = () => {
    const { logout } = props;
    logout();
  };

  const { user } = props;

  const onSearch = (value) => {
    const url = `/search/${value}`;
    history.push(url);
  };

  return (
    <div className="navbar-container">
      <Layout className="layout">
        <Header>
          <div className="logo">
            <Logo />
          </div>

          <Search
            placeholder="Type to search"
            onSearch={onSearch}
            style={{ width: 300 }}
          />

          <Menu theme="dark" mode="horizontal" style={{ lineHeight: '64px' }}>
            {navbarList}
          </Menu>
          {user ? (
            <div className="buttons">
              <Link to="/profile">
                <Button type="primary">Profile</Button>
              </Link>
              <Link to="/">
                <Button type="danger" onClick={Logout}>
                  Logout
                </Button>
              </Link>
            </div>
          ) : (
            <Link to="/login">
              <Button type="primary">LOG IN / REGISTER</Button>
            </Link>
          )}
        </Header>
      </Layout>
    </div>
  );
};

export default Navbar;
