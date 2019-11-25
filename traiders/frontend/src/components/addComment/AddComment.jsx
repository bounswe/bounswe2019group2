import React, { Component } from 'react';
import { Input, Button } from 'antd';

import {
  PostWithAuthorization,
  PatchUploadImage
} from '../../common/http/httpUtil';
import history from '../../common/history';
import './add-comment.scss';

class AddComment extends Component {
  constructor(props) {
    super(props);
    this.state = {
      content: null,
      image: null
    };
  }

  handleContentChange = (event) => {
    const content = event.target.value;
    this.setState({
      content
    });
  };

  handleFileUpload = (event) => {
    const image = event.target.files && event.target.files[0];
    this.setState({
      image
    });
  };

  handleSubmit = () => {
    const { content, image } = this.state;
    const {
      user,
      submitUrl,
      equipment,
      article,
      getArticleComments,
      getEquipmentComments
    } = this.props;
    if (!user) {
      history.push('/login');
    } else {
      const token = user.key;
      // eslint-disable-next-line one-var
      let body;
      if (submitUrl.includes('equipment')) {
        body = { content, equipment };
      } else {
        // eslint-disable-next-line

        body = { content, article: article.url };
      }

      if (body) {
        PostWithAuthorization(submitUrl, body, token)
          .then((response) => {
            if (response.status === 201 && image) {
              response.json().then((res) => {
                PatchUploadImage(res.url, image, token)
                  // eslint-disable-next-line
                  .then((response) => {
                    // eslint-disable-next-line no-console
                    console.log(response);
                  })
                  .catch((error) => {
                    // eslint-disable-next-line no-console
                    console.log('Smt wrong \n', error);
                  });
              });
            }
          })
          // eslint-disable-next-line no-console
          .catch((error) => console.log('Smt wrong \n', error));
      } else {
        // eslint-disable-next-line no-console
        console.log('smt-wrong');
      }
      setTimeout(() => getArticleComments(article.id), 1000);
      setTimeout(() => getEquipmentComments(equipment), 1000);
    }
  };

  render() {
    return (
      <div className="add-comment-container">
        <div className="add-comment-header">
          <h2 className="header">Share Your Idea</h2>
        </div>
        <div className="comment-content">
          <Input.TextArea
            placeholder="Write your comment here"
            rows={2}
            // eslint-disable-next-line
            onChange={this.handleContentChange}
          />

          <div className="image-container">
            <Input
              className="file-input"
              type="file"
              accept="image/png, image/jpeg"
              onChange={(event) => this.handleFileUpload(event)}
            />
          </div>
        </div>
        <div className="submit-button">
          <Button type="primary" onClick={this.handleSubmit}>
            Post
          </Button>
        </div>
      </div>
    );
  }
}
export default AddComment;
