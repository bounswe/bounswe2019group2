import React, { Component } from 'react';
import { Tabs, Button, Modal, Select, Input, Icon } from 'antd';

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
    this.state = {
      activeKey: null,
      portfoliBaseCurrency: 'TRY',
      portfolioTargetCurrency: 'TRY',
      visiblePortfolioEquipment: false,
      visiblePortfolio: false,

      portfolioName: null
    };
  }

  componentDidMount() {
    const {
      getCurrencyList,
      user,
      getPortfoliosUserOwnsWithAuthorization,
      otherUserId,
      other
    } = this.props;
    if (other) {
      getPortfoliosUserOwnsWithAuthorization(otherUserId, user && user.key);
    } else {
      if (user) {
        const array = user.user.url.split('/');
        const userId = array[array.length - 2];
        getPortfoliosUserOwnsWithAuthorization(userId, user.key);
      }

      getCurrencyList();
    }
  }

  handleRoute = (event, baseSymbol, targetSymbol) => {
    event.stopPropagation();
    const url = `/parity/${baseSymbol}/${targetSymbol}`;
    history.push(url);
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

  handleAddItem = () => {
    this.setState({
      visiblePortfolioEquipment: true
    });
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
      this.setState({
        visiblePortfolio: false
      });
      setTimeout(
        () => getPortfoliosUserOwnsWithAuthorization(userId, user.key),
        1000
      );
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
    this.setState({
      visiblePortfolioEquipment: false
    });
    setTimeout(
      () => getPortfoliosUserOwnsWithAuthorization(userId, user.key),
      1000
    );
  };

  handleCancelEquipment = () => {
    this.setState({
      visiblePortfolioEquipment: false
    });
  };

  handleDeletePortfolio = (id) => {
    const { user, getPortfoliosUserOwnsWithAuthorization, other } = this.props;
    if (!other) {
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
        });
      }
    } else {
      // eslint-disable-next-line
      alert("You don't have privileges to delete this portfolio!");
    }
  };

  deletePortfolioItem = (e) => {
    const { id } = e.target;
    // eslint-disable-next-line

    const { user, getPortfoliosUserOwnsWithAuthorization } = this.props;

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
          1000
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
    const {
      user,
      getPortfoliosUserOwnsWithAuthorization,
      other,
      otherUserId
    } = this.props;
    if (!other) {
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

            setTimeout(
              () => getPortfoliosUserOwnsWithAuthorization(userId, user.key),
              1000
            );
            // window.location.reload();
          });
        }
      }
    } else if (user) {
      if (!isFollowing) {
        const url = `${API}/portfolio/${id}`;
        const body = {
          is_following: true
        };
        PatchWithAuthorization(url, body, user.key).then((response) => {
          if (response.status === 204) {
            // eslint-disable-next-line
          }

          setTimeout(
            () => getPortfoliosUserOwnsWithAuthorization(otherUserId, user.key),
            1000
          );
          // window.location.reload();
        });
      }
    }
  };

  handleUnfollow = (id, isFollowing) => {
    const {
      user,
      getPortfoliosUserOwnsWithAuthorization,
      other,
      otherUserId
    } = this.props;
    if (!other) {
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

            setTimeout(
              () => getPortfoliosUserOwnsWithAuthorization(userId, user.key),
              1000
            );
            // window.location.reload();
          });
        }
      }
    } else if (user) {
      if (isFollowing) {
        const url = `${API}/portfolio/${id}`;
        const body = {
          is_following: false
        };
        PatchWithAuthorization(url, body, user.key).then((response) => {
          if (response.status === 204) {
            // eslint-disable-next-line
          }

          setTimeout(
            () => getPortfoliosUserOwnsWithAuthorization(otherUserId, user.key),
            1000
          );
          // window.location.reload();
        });
      }
    }
  };

  render() {
    const { TabPane } = Tabs;
    const { user, currencyList, portfolioList, other } = this.props;
    const {
      visiblePortfolioEquipment,
      visiblePortfolio,
      portfolioName,
      activeKey
    } = this.state;
    // eslint-disable-next-line

    // this.addToPanes();
    const filteredList = [];
    if (currencyList) {
      currencyList.forEach((element) => filteredList.push(element.symbol));
    }

    return (
      <div>
        <div className="main-div">
          <div className="portfolio-header-div">
            {other}
            <h2 className="portfolio-header">PORTFOLIOS</h2>
          </div>
          {!other && (
            <div style={{ marginBottom: 16 }}>
              <Button type="primary" onClick={this.handleAddPortfolio}>
                Add New Portfolio
              </Button>
            </div>
          )}

          <Tabs
            hideAdd
            onChange={this.onChange}
            activeKey={activeKey}
            type="editable-card"
            onEdit={this.handleDeletePortfolio}
          >
            {portfolioList &&
              portfolioList.map((pane) => {
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
                      {pane.portfolio_items &&
                        pane.portfolio_items.map((item) => {
                          return (
                            <div className="item-container" key={item}>
                              <div className="left">
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
                                  {`${item.base_equipment}/${item.target_equipment}`}
                                </li>
                              </div>
                              {user && pane.user.url === user.user.url && (
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
                                    />
                                  </Button>
                                </div>
                              )}
                            </div>
                          );
                        })}
                      {user && pane.user.url !== user.user.url && (
                        <div>
                          {!pane.is_following ? (
                            <Button
                              type="default"
                              icon="plus"
                              onClick={() =>
                                this.handleFollow(pane.id, pane.is_following)
                              }
                            >
                              Follow
                            </Button>
                          ) : (
                            <Button
                              type="default"
                              icon="plus"
                              onClick={() =>
                                this.handleUnfollow(pane.id, pane.is_following)
                              }
                            >
                              Unfollow
                            </Button>
                          )}
                        </div>
                      )}
                      {user && pane.user.url === user.user.url && (
                        <Button
                          className="item-add-button"
                          type="primary"
                          onClick={() => this.handleAddItem(pane.id)}
                        >
                          Add Equipment
                        </Button>
                      )}
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
                />
              </div>
            </div>
          </Modal>
        </div>
      </div>
    );
  }
}
export default Portfolio;
