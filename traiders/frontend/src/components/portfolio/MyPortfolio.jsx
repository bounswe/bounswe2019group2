import React, { Component } from 'react';
import { Tabs, Button, Modal, Select, Input, Icon } from 'antd';

import Page from '../page/Page';
import { API } from '../../redux/apiConfig';
import {
  PostWithAuthorization,
  DeleteWithAuthorization,
  PatchWithAuthorization
} from '../../common/http/httpUtil';
import history from '../../common/history';
import './myportfolio.scss';

const { Option } = Select;

class Portfolio extends Component {
  constructor(props) {
    super(props);
    this.newTabIndex = 0;
    const panes = [];
    this.state = {
      activeKey: null,
      panes,
      portfoliBaseCurrency: 'TRY',
      portfolioTargetCurrency: 'TRY',
      visiblePortfolioEquipment: false,
      visiblePortfolio: false,
      visibleDeletePortfolio: false,
      portfolioName: null,
      isFollowing: false
    };
  }
  componentDidMount() {
    const {
      getCurrencyList,
      user,
      getPortfoliosUserOwnsWithAuthorization
    } = this.props;
    const { panes } = this.state;

    if (user) {
      const array = user.user.url.split('/');
      const userId = array[array.length - 2];
      getPortfoliosUserOwnsWithAuthorization(userId, user.key);
      this.addToPanes();
    }

    getCurrencyList();
  }

  handleRoute = (event, baseSymbol, targetSymbol) => {
    event.stopPropagation();
    const url = `/parity/${baseSymbol}/${targetSymbol}`;
    history.push(url);
  };

  addToPanes = () => {
    const { portfolioList, user } = this.props;
    const { panes } = this.state;
    //this.clearPanes();
    if (portfolioList) {
      portfolioList.map((portfolio) =>
        panes.push({
          name: portfolio.name,
          id: portfolio.id,
          url: portfolio.url,
          isFollowing: portfolio.is_following,
          userOwns: portfolio.user.url,
          content: portfolio.portfolio_items
        })
      );
    }
  };
  clearPanes = () => {
    this.setState({
      panes: []
    });
  };
  menu = (list) => {
    return list.map((element, index) => (
      // eslint-disable-next-line react/no-array-index-key
      <Option key={index} value={element}>
        {element}
      </Option>
    ));
  };
  handleAddPortfolio = () => {
    this.setState({
      visiblePortfolio: true
    });
  };

  handleAddItem = (id) => {
    this.setState({
      visiblePortfolioEquipment: true
    });
    console.log(id + ' ');
  };
  handleOkPortfolio = () => {
    const { user, getPortfoliosUserOwnsWithAuthorization } = this.props;
    const { portfolioName } = this.state;
    const url = `${API}/portfolio/`;
    const array = user.user.url.split('/');
    const userId = array[array.length - 2];

    const body = {
      name: portfolioName
    };
    if (user) {
      PostWithAuthorization(url, body, user.key)
        .then((response) => {
          if (response.status !== 201) {
            response.json().then((res) => alert(res));
          } else {
            alert('Success');
          }
        })
        .catch(() => alert('error while adding portfolio'));

      window.location.reload();
    }
  };
  handleOkEquipment = (portfolioUrl) => {
    const { portfoliBaseCurrency, portfolioTargetCurrency } = this.state;
    const { user, getPortfoliosUserOwnsWithAuthorization } = this.props;
    const url = `${API}/portfolioitem/`;
    const body = {
      base_equipment: portfoliBaseCurrency,
      target_equipment: portfolioTargetCurrency,
      portfolio: portfolioUrl
    };
    const array = user.user.url.split('/');
    const userId = array[array.length - 2];
    PostWithAuthorization(url, body, user.key)
      .then((response) => {
        if (response.status !== 201) {
          response.json().then((res) => alert(res));
        } else {
          alert('Success');
        }
      })
      .catch(() => alert('error while adding portfolio equipment'));
    this.clearPanes();
    window.location.reload();
  };

  handleCancelEquipment = () => {
    this.setState({
      visiblePortfolioEquipment: false
    });
  };
  handleDeletePortfolio = (id) => {
    const { user, getPortfoliosUserOwnsWithAuthorization } = this.props;
    const { panes } = this.state;
    if (user) {
      const url = `${API}/portfolio/${id}`;
      const array = user.user.url.split('/');
      const userId = array[array.length - 2];

      DeleteWithAuthorization(url, user.key).then((response) => {
        if (response.status === 204) {
          // eslint-disable-next-line
          alert('Succesfully deleted.');
          // eslint-disable-next-line
        }
        setTimeout(
          () => getPortfoliosUserOwnsWithAuthorization(userId, user.key),
          1000
        );
        window.location.reload();
      });
    }
    console.log(id);
  };
  deletePortfolioItem = (e) => {
    const id = e.target.id;
    console.log(id);
    const { user, getPortfoliosUserOwnsWithAuthorization } = this.props;
    const { panes } = this.state;
    if (user) {
      const url = `${API}/portfolioitem/${id}`;
      const array = user.user.url.split('/');
      const userId = array[array.length - 2];

      DeleteWithAuthorization(url, user.key).then((response) => {
        if (response.status === 204) {
          // eslint-disable-next-line
          alert('Succesfully deleted.');
          // eslint-disable-next-line
        }
        setTimeout(
          () => getPortfoliosUserOwnsWithAuthorization(userId, user.key),
          4000
        );
      });
    }
  };
  handleCancelPortfolio = () => {
    this.setState({
      visiblePortfolio: false
    });
  };
  changeValue = (event) => {
    const { name, value } = event.target;
    this.setState({
      [name]: value
    });
  };

  handleSelectCurrency = (name, value) => {
    this.setState({
      [name]: value
    });
  };

  onChange = (activeKey) => {
    this.setState({ activeKey });
  };

  onEdit = (targetKey, action) => {
    this[action](targetKey);
  };

  mergeArrays = (arr1, arr2) => {
    const newList = [];
    arr1.forEach((element, index) =>
      newList.push({ ...element, ...arr2[index] })
    );

    return newList;
  };
  changeValue = (event) => {
    const { name, value } = event.target;
    this.setState({
      [name]: value
    });
  };

  handleFollow = (id, isFollowing) => {
    const { user, getPortfoliosUserOwnsWithAuthorization } = this.props;

    if (user) {
      if (!isFollowing) {
        const url = `${API}/portfolio/${id}`;
        const array = user.user.url.split('/');
        const userId = array[array.length - 2];
        const body = {
          is_following: true
        };
        PatchWithAuthorization(url, body, user.key).then((response) => {
          if (response.status === 204) {
            // eslint-disable-next-line
          }
          this.setState({ isFollowing: true });
          setTimeout(
            () => getPortfoliosUserOwnsWithAuthorization(userId, user.key),
            1000
          );
          // window.location.reload();
        });
      } else {
        alert();
      }
    }
  };
  handleUnfollow = (id, isFollowing) => {
    const { user, getPortfoliosUserOwnsWithAuthorization } = this.props;

    if (user) {
      if (isFollowing) {
        const url = `${API}/portfolio/${id}`;
        const array = user.user.url.split('/');
        const userId = array[array.length - 2];
        const body = {
          is_following: false
        };
        PatchWithAuthorization(url, body, user.key).then((response) => {
          if (response.status === 204) {
            // eslint-disable-next-line
          }
          this.setState({ isFollowing: true });
          setTimeout(
            () => getPortfoliosUserOwnsWithAuthorization(userId, user.key),
            1000
          );
          // window.location.reload();
        });
      }
    }
  };
  render() {
    const { TabPane } = Tabs;
    const { user, currencyList, portfolios } = this.props;
    const {
      visiblePortfolioEquipment,
      visiblePortfolio,
      portfolioName,
      panes,
      isFollowing
    } = this.state;
    console.log(panes);

    let newPortfolioList = [];
    if (user && portfolios) {
      newPortfolioList = this.mergeArrays(portfolios, newPortfolioList);
    }
    if (!user) {
      history.push('/login');
    }
    // this.addToPanes();
    const filteredList = [];
    if (currencyList) {
      currencyList.forEach((element) => filteredList.push(element.symbol));
    }

    return (
      <div>
        <div className="main-div">
          <div className="portfolio-header-div">
            <h2 className="portfolio-header">MY PORTFOLIOS</h2>
          </div>
          <div style={{ marginBottom: 16 }}>
            <Button type="primary" onClick={this.handleAddPortfolio}>
              Add New Portfolio
            </Button>
          </div>
          <Tabs
            hideAdd
            onChange={this.onChange}
            activeKey={this.state.activeKey}
            type="editable-card"
            onEdit={this.handleDeletePortfolio}
          >
            {this.state.panes.map((pane) => {
              return (
                <TabPane tab={pane.name} key={pane.id}>
                  <Modal
                    title="ADD PORTFOLIO ITEM"
                    visible={visiblePortfolioEquipment}
                    onOk={() => this.handleOkEquipment(pane.url)}
                    onCancel={this.handleCancelEquipment}
                    destroyOnClose="true"
                  >
                    <div className="modal">
                      <div className="base-equipment">
                        Base Equipment
                        <Select
                          defaultValue="TRY"
                          onChange={(value) =>
                            this.handleSelectCurrency(
                              'portfoliBaseCurrency',
                              value
                            )
                          }
                          style={{ width: 120 }}
                        >
                          {/* eslint-disable-next-line no-use-before-define */}
                          {this.menu(filteredList)}
                        </Select>
                      </div>
                      <div className="target-equipment">
                        Target Equipment
                        <Select
                          defaultValue="TRY"
                          onChange={(value) =>
                            this.handleSelectCurrency(
                              'portfolioTargetCurrency',
                              value
                            )
                          }
                          style={{ width: 120 }}
                        >
                          {/* eslint-disable-next-line no-use-before-define */}
                          {this.menu(filteredList)}
                        </Select>
                      </div>
                    </div>
                  </Modal>
                  <div className="tab-content">
                    {' '}
                    {pane.content &&
                      pane.content.map((item) => {
                        return (
                          <div className="item-container">
                            <div className="left">
                              {' '}
                              <li
                                id={item.id}
                                className="list-content"
                                onClick={(event) =>
                                  this.handleRoute(
                                    event,
                                    item.base_equipment,
                                    item.target_equipment
                                  )
                                }
                              >
                                {item.base_equipment +
                                  '/' +
                                  item.target_equipment}
                              </li>
                            </div>
                            {pane.userOwns === user.user.url && (
                              <div>
                                <div className="right">
                                  <Button
                                    id={item.id}
                                    type="danger"
                                    className="button-style"
                                    onClick={this.deletePortfolioItem}
                                  >
                                    <Icon
                                      className="icon-style"
                                      type="delete"
                                    ></Icon>
                                  </Button>
                                </div>
                                {pane.userOwns !== user.user.url && (
                                  <div>
                                    {!pane.isFollowing ? (
                                      <Button
                                        type="default"
                                        icon="plus"
                                        onClick={() =>
                                          this.handleFollow(
                                            pane.id,
                                            pane.isFollowing
                                          )
                                        }
                                      >
                                        Follow
                                      </Button>
                                    ) : (
                                      <Button
                                        type="default"
                                        icon="plus"
                                        onClick={() =>
                                          this.handleUnfollow(
                                            pane.id,
                                            pane.isFollowing
                                          )
                                        }
                                      >
                                        Unfollow
                                      </Button>
                                    )}
                                  </div>
                                )}
                                <Button
                                  className="item-add-button"
                                  type="primary"
                                  onClick={() => this.handleAddItem(pane.id)}
                                >
                                  Add Equipment
                                </Button>
                              </div>
                            )}
                          </div>
                        );
                      })}
                  </div>
                </TabPane>
              );
            })}
          </Tabs>
        </div>
        <div>
          <Modal
            title="ADD PORTFOLIO"
            visible={visiblePortfolio}
            onOk={this.handleOkPortfolio}
            onCancel={this.handleCancelPortfolio}
          >
            <div className="modal">
              <div className="name">
                Portfolio Name:
                <Input
                  placeholder="Name"
                  type="text"
                  name="portfolioName"
                  value={portfolioName}
                  onChange={this.changeValue}
                ></Input>
              </div>
            </div>
          </Modal>
        </div>
      </div>
    );
  }
}
export default Portfolio;
