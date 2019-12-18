import React, { Component } from 'react';
import { Tabs } from 'antd';

import history from '../../common/history';
import './followedportfolio.scss';

class Portfolio extends Component {
  constructor(props) {
    super(props);
    this.newTabIndex = 0;

    this.state = {
      activeKey: null
    };
  }

  componentDidMount() {
    const { user, getPortfoliosUserFollowedWithAuthorization } = this.props;

    if (user) {
      const array = user.user.url.split('/');
      const userId = array[array.length - 2];
      getPortfoliosUserFollowedWithAuthorization(userId, user.key);
    }
  }

  handleRoute = (event, baseSymbol, targetSymbol) => {
    event.stopPropagation();
    const url = `/parity/${baseSymbol}/${targetSymbol}`;
    history.push(url);
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
    const { user, portfolioList } = this.props;
    const { activeKey } = this.state;

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
            activeKey={activeKey}
            type="editable-card"
          >
            {portfolioList &&
              portfolioList.map((pane) => {
                return (
                  <TabPane tab={pane.name} key={pane.id}>
                    <div className="tab-content">
                      {' '}
                      {pane.portfolio_items &&
                        pane.portfolio_items.map((item) => {
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
                                  {`${item.base_equipment}/${item.target_equipment}`}
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
