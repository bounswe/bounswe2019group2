import React from 'react';
import { Layout, Menu, Button } from 'antd';
import { Link } from 'react-router-dom';

import './navbar.scss';
import { navbarOptions } from '../../common/constants/generalConstants';

const { Header } = Layout;

const Navbar = () => {
  const navbarList = navbarOptions.map((element) => {
    return (
      <Menu.Item key={element.id}>
        <Link to={element.url}>{element.name}</Link>
      </Menu.Item>
    );
  });

  return (
    <div className="navbar-container">
      <Layout className="layout">
        <Header>
          <Menu theme="dark" mode="horizontal" style={{ lineHeight: '64px' }}>
            {navbarList}
          </Menu>
          <Link to="/login">
            <Button type="primary">LOG IN</Button>
          </Link>
        </Header>
      </Layout>
    </div>
  );
};

export default Navbar;
