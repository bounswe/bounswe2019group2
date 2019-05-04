import React, { Component } from "react";
import { Layout, Popover, Menu } from "antd";

import "./styles.less";
import { connect } from "react-redux";
import noUserJSON from "../../utils/sidebars/noUserMenu.json";
import userJSON from "../../utils/sidebars/userMenu.json";

const { Sider, Content } = Layout;
const sidebarWidth = 250;

class BaseLayout extends Component {
  render() {
    return (
      <Layout className="container">
        <Sider className="sider-container" width={sidebarWidth}>
          <div className="sider-curtain" />
          <div className="absolute-fill flex-column">
            <div className="logo-container" style={{ height: 150 }} />
            <div className="sider-links-container">
              <Menu
                onClick={() => null}
                className="main-menu"
                theme="dark"
                style={{ width: sidebarWidth }}
                mode="inline"
              >
                {this.getUserMenu()}
              </Menu>
            </div>
          </div>
        </Sider>
        <Layout>
          <Content className="content-container">{this.props.children}</Content>
        </Layout>
      </Layout>
    );
  }

  getUserMenu(role) {
    console.log(this.props.user);
    console.log();
    let menuData;
    if (this.props.user === null) {
      menuData = noUserJSON;
    } else {
      menuData = userJSON;
    }

    return menuData.map(el => {
      return (
        <Menu.Item key={el.key}>
          <a href={el.url}>{el.text}</a>
        </Menu.Item>
      );
    });
  }
}

const mapStateToProps = state => ({
  user: state.auth.user
});

export default connect(
  mapStateToProps,
  null
)(BaseLayout);
