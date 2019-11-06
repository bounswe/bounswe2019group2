/* eslint-disable */
// disabling eslint-temporarily

import React, { Component } from 'react';
import { Input, Button } from 'antd';

import { PostWithAuthorization, PatchUploadImage } from '../../common/http/httpUtil';
import history from '../../common/history';
import './add-article.scss';

class AddArticle extends Component {
  constructor(props) {
    super(props);
    this.state = {
      image: null,
      content: null,
      title: null
    };
  }

  handleFileUpload = (event) => {
    const image = event.target.files && event.target.files[0];
    this.setState({
      image
    });
  };

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
    const { content, title, image } = this.state;
    const { user } = this.props;
    const token = user.key;
    const url = 'https://api.traiders.tk/articles/';
    if (content && title) {
      PostWithAuthorization(url, { content, title }, token)
        .then((response) => {
          if (response.status===201) {
            response.json().then((res) => {
              PatchUploadImage(res.url, image, token).then((response) => {
                console.log(response);
              }).catch((error) => {
                console.log('Smt wrong \n', error);
              });
            });
          }
        })
        .catch((error) => console.log('Smt wrong \n', error));

    } else {
      console.log('smt-wrong');
    }
  };

  render() {
    const { user } = this.props;
    if (!user) {
      history.push('/login');
    }

    return (
      <div className="add-article-container">
        <div className="header">
          <div className="learn">LEARN & SHARE & GROW</div>
        </div>
        <div className="article-title">
          <Input placeholder="TITLE" onChange={this.handleTitleChange}></Input>
        </div>
        <div className="article-image">
          <label htmlFor="product">Image</label>
          <div className="input-group">
            <input
              type="file"
              className="form-control"
              aria-describedby="basic-addon1"
              accept="image/png, image/jpeg"
              onChange={(event) => this.handleFileUpload(event)}
            />
          </div>
        </div>
        <div className="article-content">
          <Input.TextArea
            rows={25}
            onChange={this.handleArticleChange}
          ></Input.TextArea>
        </div>
        <div className="submit-button">
          <Button type="primary" onClick={this.handleSubmit}>
            Save Article
          </Button>
        </div>
      </div>
    );
  }
}

export default AddArticle;
