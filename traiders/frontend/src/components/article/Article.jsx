import React, { Component } from 'react';
import { Button } from 'antd';
import './article.scss';

import Comment from '../comment/Comment';

class Article extends Component {
  componentDidMount() {
    const { id, getArticle, getArticleComments } = this.props;
    getArticle(id);
    getArticleComments(id);
  }

  getAuthor = (url) => {
    const { getArticleAuthor } = this.props;
    getArticleAuthor(url);
  };

  render() {
    const { article, author, comments } = this.props;
    if (article && (!author || article.author !== author.url)) {
      this.getAuthor(article.author);
    }

    return (
      <div>
        {article && author ? (
          <div className="article-container">
            <div className="article-title">{article.title}</div>
            <div className="article-author">
              <div className="user-related">
                <div className="author-name">{`${author.first_name} ${author.last_name}`}</div>
                <div className="author-username">({author.username})</div>
              </div>
              <div className="article-related">
                {article.created_at.substring(0, 10)}
                <Button>Follow</Button>
              </div>
            </div>

            <div className="article-image-container">
              <img
                className="article-image"
                src={article.image}
                alt={article.iamage}
              />
            </div>
            <div className="article-content">{article.content}</div>
            <div className="written-by" />
            <div className="article-comment">
              {comments.map((comment) => (
                <Comment
                  author={comment.user.username}
                  content={comment.content}
                  createdAt={comment.createdAt.substring(0, 10)}
                  image={comment.image}
                />
              ))}
            </div>
          </div>
        ) : (
          'Loading'
        )}
      </div>
    );
  }
}
export default Article;
