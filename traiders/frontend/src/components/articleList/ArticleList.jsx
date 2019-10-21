import React, { Component } from 'react';

import './article-list.scss';

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
          <div>
            <img
              className="article-image"
              src={article.image}
              alt={article.image}
            />
            <div className="article-title">{article.title}</div>
            <div className="article-content">{article.content}</div>
          </div>
        ))}
      </div>
    );
  }
}

export default ArticleList;
