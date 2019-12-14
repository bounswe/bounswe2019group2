import React, { Component } from 'react';
import { Button } from 'antd';

import Page from '../../components/page/Page';
import MyPortfolios from '../../components/portfolio/MyPortfolioContainer';
import FollowedPortfolios from '../../components/portfolio/FollowedPortfolioContainer';
import './portfolios.scss';
class Portfolios extends Component {
  constructor(props) {
    super(props);
    this.state = {
      showMyPortfolios: true
    };
  }

  handleClick = (buttonType) => {
    let showMyPortfolios;

    if (buttonType === 'myportfolio') {
      showMyPortfolios = true;
    } else {
      showMyPortfolios = false;
    }
    this.setState({
      showMyPortfolios
    });
  };

  render() {
    const { showMyPortfolios } = this.state;
    return (
      <Page>
        <div className="portfolio-container">
          <div className="tab-buttons">
            <Button
              type="secondary"
              name="myportfolio"
              onClick={() => this.handleClick('myportfolio')}
            >
              My Portfolios
            </Button>
            <Button
              type="secondary"
              name="followedportfolio"
              onClick={() => this.handleClick('followedportfolio')}
            >
              Followed Portfolios
            </Button>
          </div>
          <div className="content">
            {showMyPortfolios ? (
              <div className="my-portfolio">
                <MyPortfolios />
              </div>
            ) : (
              <div className="followed-portfolio">
                <FollowedPortfolios />
              </div>
            )}
          </div>
        </div>
      </Page>
    );
  }
}

export default Portfolios;
