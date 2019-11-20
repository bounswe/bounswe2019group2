import React, { Component } from 'react';
import { Button } from 'antd';

import './article-list.scss';
import ArticleRow from './ArticleRow';
import history from '../../common/history';

class ArticleList extends Component {
  componentDidMount() {
    const { getArticles } = this.props;
    getArticles();
  }

  handleClick = () => {
    history.push('/create-article');
  };

  render() {
    const { articleList, limit } = this.props;
    let filteredList = articleList;

    if (limit) {
      filteredList = filteredList
        .filter((article) => article.image)
        .slice(0, 7);
    }

    return (
      <div className="article-list-container">
        {filteredList.map((article) => (
          <ArticleRow article={article} history={history} key={article.id} />
        ))}
        <div className="create-article">
          Would you like to share your knowledge with others?
          <Button onClick={this.handleClick} type="primary">
            Create Article
          </Button>
        </div>
      </div>
    );
  }
}

export default ArticleList;
