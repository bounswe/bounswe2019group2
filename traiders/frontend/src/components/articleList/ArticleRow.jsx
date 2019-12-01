import React from 'react';

import './article-list.scss';

const ArticleRow = (props) => {
  const handleClick = (e) => {
    e.preventDefault();
    const { article, history } = props;
    const { author } = article;

    if (author) {
      history.push(`articles/${article.id}`);
    }
  };

  const { article } = props;
  const { author } = article;

  return (
    // eslint-disable-next-line
    <div className="single-article" onClick={handleClick} role="button">
      {author ? (
        <div className="article-container">
          <img
            className="article-image"
            src={article.image}
            alt={article.image}
          />
          <div className="article">
            <div className="article-title">{article.title}</div>
            <div className="article-first-part">
              {article.content.substring(0, 50)}...
            </div>
            <div className="author-related">
              <div className="author-name">{`${author.first_name} ${author.last_name}`}</div>
              <div className="date-created">
                {article.created_at.substring(0, 10)}
              </div>
            </div>
          </div>
        </div>
      ) : (
        ''
      )}
    </div>
  );
};

export default ArticleRow;
