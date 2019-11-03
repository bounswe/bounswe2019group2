import React, { Component } from 'react';
import { Button } from 'antd';

import './social.scss';
import Page from '../../components/page/Page';
import ArticleList from '../../components/articleList/ArticleListContainer';
import EventsList from '../../components/eventsList/eventsListContainer';
class Social extends Component {
  constructor(props) {
    super(props);
    this.state = {
      showArticles: true
    };
  }

  handleClick = (prevState, buttonType) => {
    let showArticles;
    if (buttonType === 'article') {
      showArticles = true;
    } else {
      showArticles = false;
    }
    this.setState({
      showArticles
    });
  };

  render() {
    const { showArticles } = this.state;
    return (
      <Page>
        <div className="social-container">
          <div className="tab-buttons">
            <Button
              type="secondary"
              name="article"
              onClick={() => this.handleClick(this.state, 'article')}
            >
              Articles
            </Button>
            <Button
              type="secondary"
              name="events"
              onClick={() => this.handleClick(this.state, 'event')}
            >
              Events
            </Button>
          </div>
          <div className="content">
            {showArticles ? (
              <div className="articles">
                <ArticleList />
              </div>
            ) : (
              <div className="events">
                <EventsList />
              </div>
            )}
          </div>
        </div>
      </Page>
    );
  }
}

export default Social;
