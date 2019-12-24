import React, { Component } from 'react';
import { Button } from 'antd';
import { connect } from 'react-redux';

import history from '../../common/history';
import Page from '../page/Page';
import MyPortfolios from './MyPortfolioContainer';
import FollowedPortfolios from './FollowedPortfolioContainer';
import './portfolios.scss';

class Portfolios extends Component {
  constructor(props) {
    super(props);
    this.state = {
      showMyPortfolios: true
    };
  }

  componentDidMount() {
    const { user } = this.props;
    if (!user) {
      history.push('/login');
    }
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
    const { user } = this.props;
    const { showMyPortfolios } = this.state;
    return (
      <>
        {user && (
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
        )}
      </>
    );
  }
}

const mapStateToProps = (state) => {
  return {
    user: state.user.currentUser
  };
};

export default connect(mapStateToProps)(Portfolios);
