import React, { Component } from 'react';
import { Tabs, Select } from 'antd';

import history from '../../common/history';
import './followedportfolio.scss';

class Portfolio extends Component {
  constructor(props) {
    super(props);
    this.newTabIndex = 0;
    const panes = [];
    this.state = {
      activeKey: null,
      panes
    };
  }
  componentDidMount() {
    const {
      user,
      portfolioList,
      getPortfoliosUserFollowedWithAuthorization
    } = this.props;
    const { panes } = this.state;

    if (user) {
      const array = user.user.url.split('/');
      const userId = array[array.length - 2];
      getPortfoliosUserFollowedWithAuthorization(userId, user.key);
      this.addToPanes();
    }
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

  onChange = (activeKey) => {
    this.setState({ activeKey });
  };

  onEdit = (targetKey, action) => {
    this[action](targetKey);
  };

  changeValue = (event) => {
    const { name, value } = event.target;
    this.setState({
      [name]: value
    });
  };

  render() {
    const { TabPane } = Tabs;
    const { user } = this.props;
    const { panes } = this.state;
    console.log(panes);

    if (!user) {
      history.push('/login');
    }

    return (
      <div>
        <div className="main-div">
          <div className="portfolio-header-div">
            <h2 className="portfolio-header">FOLLOWED PORTFOLIOS</h2>
          </div>
          <Tabs
            hideAdd
            onChange={this.onChange}
            activeKey={this.state.activeKey}
            type="editable-card"
          >
            {this.state.panes.map((pane) => {
              return (
                <TabPane tab={pane.name} key={pane.id}>
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
                          </div>
                        );
                      })}
                  </div>
                </TabPane>
              );
            })}
          </Tabs>
        </div>
      </div>
    );
  }
}
export default Portfolio;
