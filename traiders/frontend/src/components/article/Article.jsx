import React, { Component } from 'react';
import { Button, Modal } from 'antd';

import { API } from '../../redux/apiConfig';
import './article.scss';
import {
  PostWithAuthorization,
  DeleteWithAuthorization
} from '../../common/http/httpUtil';
import history from '../../common/history';

import Comment from '../comment/CommentContainer';
import AddComment from '../addComment/AddCommentContainer';

class Article extends Component {
  constructor(props) {
    super(props);
    this.state = {
      visible: false
    };
  }

  componentDidMount() {
    const {
      id,
      getArticle,
      getArticleComments,
      getFollowings,
      getFollowers,
      user
    } = this.props;
    getArticle(id);
    getArticleComments(id);
    if (user) {
      const array = user.user.url.split('/');
      const userId = array[array.length - 2];
      getFollowings(userId);
      getFollowers(userId);
    }
  }

  handleFollow = () => {
    const { user, article } = this.props;
    // eslint-disable-next-line camelcase
    const user_followed = article.author.url;
    const url = `${API}/following/`;

    if (user) {
      PostWithAuthorization(url, { user_followed }, user.key)
        // eslint-disable-next-line no-console
        .then((response) => console.log(response))
        // eslint-disable-next-line no-console
        .catch((error) => console.log('Errow while following\n', error));
    } else {
      history.push('/login');
    }
  };

  handleUnfollow = () => {
    const { user, article, deleteFollowing, followings } = this.props;
    const { author } = article;

    const followDetails =
      article &&
      followings &&
      followings.filter((element) => element.user_followed === author.url);

    deleteFollowing(followDetails[0].id, user.key);
  };

  editArticle = () => {
    const { article } = this.props;
    const { id } = article;
    history.push(`/article/edit/${id}`);
  };

  deleteArticle = () => {
    this.setState({
      visible: true
    });
  };

  handleOk = () => {
    const { article, user } = this.props;
    const { id } = article;
    const url = `${API}/articles/${id}/`;

    DeleteWithAuthorization(url, user.key).then((response) => {
      if (response.status === 204) {
        // eslint-disable-next-line
        alert('Succesfully deleted');
        this.setState({
          visible: false
        });
        history.push('/');
      }
    });
  };

  handleCancel = () => {
    this.setState({
      visible: false
    });
  };

  render() {
    const { article, comments, user, followings } = this.props;
    const { visible } = this.state;

    const ownArticle = user && article && user.user.url === article.author.url;

    const isFollowing =
      article &&
      followings &&
      followings.filter(
        (element) => element.user_followed === article.author.url
      );

    const following = isFollowing ? isFollowing.length !== 0 : false;

    return (
      <div>
        {(article && (
          <div className="article-container">
            <div className="article-title">{article.title}</div>
            <div className="article-header">
              <div className="header-left-part">
                <div className="user-related">
                  <div className="author-name">{`${article.author.first_name} ${article.author.last_name}`}</div>
                  <div className="author-username">
                    ({article.author.username})
                  </div>
                </div>
                <div className="article-related">
                  {article.created_at.substring(0, 10)}
                  {!following ? (
                    <Button onClick={this.handleFollow} disabled={ownArticle}>
                      Follow
                    </Button>
                  ) : (
                    <Button onClick={this.handleUnfollow}>Unfollow</Button>
                  )}
                </div>
              </div>
              {ownArticle && (
                <div className="header-right-part">
                  <Button type="primary" onClick={this.editArticle}>
                    Edit
                  </Button>
                  <Button type="danger" onClick={this.deleteArticle}>
                    Delete
                  </Button>
                </div>
              )}
            </div>

            <div className="article-image-container">
              <img
                className="article-image"
                src={article.image}
                alt={article.image}
              />
            </div>
            <pre className="article-content">{article.content}</pre>
            <div className="written-by" />
            <div className="article-comment">
              <div className="comment-header-div">
                <h2 className="comment-header">COMMENTS</h2>
              </div>

              {comments &&
                comments.map((comment) => (
                  <Comment
                    author={comment.user.username}
                    content={comment.content}
                    createdAt={comment.created_at.substring(0, 10)}
                    image={comment.image}
                    commentId={comment.id}
                    articleId={comment.article}
                    authorURL={comment.user.url}
                  />
                ))}
            </div>
            <div className="create-comment">
              <AddComment submitUrl="https://api.traiders.tk/comments/article/" />
            </div>
            <Modal
              title="DELETE"
              visible={visible}
              onOk={this.handleOk}
              onCancel={this.handleCancel}
            >
              <div>
                Are you sure? There is no way you to recover this action!
              </div>
            </Modal>
          </div>
        )) ||
          'Loading'}
      </div>
    );
  }
}
export default Article;
