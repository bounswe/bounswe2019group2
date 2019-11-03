import React, { Component } from 'react';
import { Button } from 'antd';

import './article.scss';
import { PostWithAuthorization } from '../../common/http/httpUtil';

class Article extends Component {
  componentDidMount() {
    const { id, getArticle } = this.props;
    getArticle(id);
  }

  handleFollow = () => {
    const { user, article } = this.props;
    const user_followed = article.author.url;
    const url = 'https://api.traiders.tk/following/';
    PostWithAuthorization(url, user_followed, user.key)
      .then((response) => console.log(response))
      .catch((error) => console.log('Errow while following\n', error));
  };

  render() {
    const { article } = this.props;
    console.log(article);

    return (
      <div>
        {(article && (
          <div className="article-container">
            <div className="article-title">{article.title}</div>
            <div className="article-author">
              <div className="user-related">
                <div className="author-name">{`${article.author.first_name} ${article.author.last_name}`}</div>
                <div className="author-username">
                  ({article.author.username})
                </div>
              </div>
              <div className="article-related">
                {article.created_at.substring(0, 10)}
                <Button onClick={this.handleFollow}>Follow</Button>
              </div>
            </div>

            <div className="article-image-container">
              <img
                className="article-image"
                src={article.image}
                alt={article.iamage}
              />
            </div>
            <pre className="article-content">{article.content}</pre>
            <div className="written-by" />
          </div>
        )) ||
          'Loading'}
      </div>
    );
  }
}
export default Article;
