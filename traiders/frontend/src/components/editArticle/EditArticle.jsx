import React, { Component } from 'react';

import './edit-article.scss';
import { Input, Button } from 'antd';
import history from '../../common/history';

import { PutWithAuthorization } from '../../common/http/httpUtil';

class EditArticle extends Component {
  constructor(props) {
    super(props);
    const { article } = props;
    this.state = {
      content: article && article.content,
      title: article && article.title,
      id: article && article.id
    };
  }

  componentDidMount() {
    const { id, getArticle } = this.props;
    getArticle(id);
  }
  /*
  handleFileUpload = (event) => {
    const image = event.target.files && event.target.files[0];
    this.setState({
      image
    });
  };
  */

  handleArticleChange = (event) => {
    const content = event.target.value;
    this.setState({
      content
    });
  };

  handleTitleChange = (event) => {
    const title = event.target.value;
    this.setState({
      title
    });
  };

  handleSubmit = () => {
    const { content, title, id } = this.state;
    const { user } = this.props;
    const token = user.key;
    const url = `https://api.traiders.tk/articles/${id}/`;
    if (content && title) {
      PutWithAuthorization(url, { content, title }, token)
        .then((response) => {
          if (response.status === 200) {
            history.push(`/articles/${id}`);
          }
        })
        // eslint-disable-next-line no-console
        .catch((error) => console.log('Smt wrong \n', error));
    }
  };

  // TODO add image update field
  render() {
    const { user, article } = this.props;
    const { content, title } = this.state;
    if (!user) {
      history.push('/login');
    } else if (article && user.user.url !== article.author.url) {
      history.push('/');
    }
    return (
      <div className="add-article-container">
        <div className="header">
          <div className="learn">LEARN & SHARE & GROW</div>
        </div>
        <div className="article-title">
          <Input
            placeholder="TITLE"
            onChange={this.handleTitleChange}
            value={title}
          />
        </div>
        <div className="article-content">
          <Input.TextArea
            rows={25}
            onChange={this.handleArticleChange}
            value={content}
          />
        </div>
        <div className="submit-button">
          <Button type="primary" onClick={this.handleSubmit}>
            Edit Article
          </Button>
        </div>
      </div>
    );
  }
}

export default EditArticle;
