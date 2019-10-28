import React, { Component } from 'react';

import './article-list.scss';
import ArticleRow from './ArticleRow';

class ArticleList extends Component {
  componentDidMount() {
    const { getArticles } = this.props;
    getArticles();
  }

  render() {
    const { articleList, history } = this.props;

    return (
      <div className="article-list-container">
        {articleList.map((article) => (
          <ArticleRow article={article} history={history} />
        ))}
      </div>
    );
  }
}

export default ArticleList;
