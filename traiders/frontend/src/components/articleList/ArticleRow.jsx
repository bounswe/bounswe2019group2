import React, { Component } from 'react';

import './article-list.scss';

class ArticleRow extends Component {
  constructor(props) {
    super(props);
    this.state = {
      author: null
    };
  }

  componentDidMount() {
    const { article } = this.props;
    if (article && article.author) {
      // eslint-disable-next-line no-undef
      fetch(article.author)
        .then((response) => {
          if (response.status === 200) {
            response.json().then((res) =>
              this.setState({
                author: res
              })
            );
          }
        })
        // eslint-disable-next-line no-console
        .catch((error) => console.log('Error while fetching author\n', error));
    }
  }

  handleClick = () => {
    const { author } = this.state;
    const { article, history } = this.props;

    if (author) {
      history.push(`articles/${article.id}`);
    }
  };

  render() {
    const { article } = this.props;
    const { author } = this.state;
    return (
      // eslint-disable-next-line
      <div className="single-article" onClick={this.handleClick} role="button">
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
  }
}

export default ArticleRow;
