import React, { Component } from 'react';

import './article-list.scss';
import ArticleRow from './ArticleRow';
import history from '../../common/history';

class ArticleList extends Component {
  componentDidMount() {
    const { getArticles } = this.props;
    getArticles();
  }

  render() {
    const { articleList } = this.props;

    return (
      <div className="article-list-container">
        {articleList.map((article) => (
          <ArticleRow article={article} history={history} key={article.id} />
        ))}
      </div>
    );
  }
}

export default ArticleList;
