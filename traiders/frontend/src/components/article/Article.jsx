import React, { Component } from 'react';
import { Button, Modal, Icon, Input } from 'antd';

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
      visible: false,
      action: null,
      showAnnotationTab: false,
      annotationContent: null,
      firstIndex: null,
      lastIndex: null
    };
  }

  componentDidMount() {
    const {
      id,
      getArticle,
      getArticleWithAuthorization,
      getArticleComments,
      getArticleCommentsWithAuthorization,
      getFollowings,
      getFollowers,
      user
    } = this.props;

    if (user) {
      const array = user.user.url.split('/');
      const userId = array[array.length - 2];
      getFollowings(userId);
      getFollowers(userId);
      getArticleWithAuthorization(id, user.key);
      getArticleCommentsWithAuthorization(id, user.key);
    } else {
      getArticle(id);
      getArticleComments(id);
    }
  }

  handleLike = () => {
    const { user, id, getArticleWithAuthorization } = this.props;
    const url = `${API}/likes/`;
    // eslint-disable-next-line
    const article = this.props.article.url;
    // eslint-disable-next-line
    const articleLike = this.props.article.like;
    if (user) {
      if (!articleLike) {
        PostWithAuthorization(url, { article }, user.key)
          // eslint-disable-next-line no-console
          .then((response) => console.log(response))
          // eslint-disable-next-line no-console
          .catch((error) => console.log('Errow while like operation\n', error));
        setTimeout(() => getArticleWithAuthorization(id, user.key), 500);
      } else {
        // eslint-disable-next-line
        alert("You've already liked this article!");
      }
      getArticleWithAuthorization(id, user.key);
    } else {
      history.push('/login');
    }
  };

  handleDislike = () => {
    const { user, id, getArticleWithAuthorization } = this.props;
    // eslint-disable-next-line
    const articleLike = this.props.article.like;

    if (user) {
      if (articleLike && articleLike.user === user.user.url) {
        const likeArray = articleLike.url.split('/');
        const likeId = likeArray[likeArray.length - 2];
        const url = `${API}/likes/${likeId}/`;
        DeleteWithAuthorization(url, user.key)
          // eslint-disable-next-line no-console
          .then((response) => console.log(response.url))

          .catch((error) =>
            // eslint-disable-next-line no-console
            console.log('Errow while unlike operation\n', error)
          );
        setTimeout(() => getArticleWithAuthorization(id, user.key), 500);
      } else {
        alert('There is no like for this user.');
      }
    } else {
      history.push('/login');
    }
  };

  handleFollow = () => {
    const { user, article, getFollowings } = this.props;
    if (user) {
      // eslint-disable-next-line camelcase
      const user_followed = article.author.url;
      const url = `${API}/following/`;
      const array = user.user.url.split('/');
      const userId = array[array.length - 2];

      PostWithAuthorization(url, { user_followed }, user.key)
        // eslint-disable-next-line no-console
        .then((response) => console.log(response))
        // eslint-disable-next-line no-console
        .catch((error) => console.log('Errow while following\n', error));
      setTimeout(() => getFollowings(userId), 500);
    } else {
      history.push('/login');
    }
  };

  handleUnfollow = () => {
    const {
      user,
      article,
      deleteFollowing,
      followings,
      getFollowings
    } = this.props;
    const { author } = article;
    const array = user.user.url.split('/');
    const userId = array[array.length - 2];
    const followDetails =
      article &&
      followings &&
      followings.filter((element) => element.user_followed === author.url);

    deleteFollowing(followDetails[0].id, user.key);
    setTimeout(() => getFollowings(userId), 500);
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

  handleRoute = (event, authorURL) => {
    const array = authorURL.split('/');
    const userId = array[array.length - 2];
    event.stopPropagation();
    const url = `/profile/${userId}`;
    history.push(url);
  };

  handleAnnotationInput = (event) => {
    this.setState({
      annotationContent: event.target.value
    });
  };

  handleAnnotation = () => {
    const selected = window.getSelection();
    if (selected.baseNode.data === selected.extentNode.data) {
      this.setState({
        showAnnotationTab: true,
        firstIndex: selected.baseOffset,
        lastIndex: selected.extentOffset
      });
    }
  };

  submitAnnotation = () => {
    const { firstIndex, lastIndex } = this.state;

    console.log('Annotating from index ' + firstIndex + ' to ' + lastIndex);
    console.log(this.state.annotationContent);
  };

  render() {
    const { article, comments, user, followings } = this.props;
    const { visible, action, showAnnotationTab } = this.state;

    const ownArticle = user && article && user.user.url === article.author.url;

    const isFollowing =
      user &&
      article &&
      followings &&
      followings.filter(
        (element) => element.user_followed === article.author.url
      );

    const following = isFollowing ? isFollowing.length !== 0 : false;

    return (
      <div className="main-div">
        {(article && (
          <div className="article-page-container">
            <div className="article-container">
              <div className="article-title">{article.title}</div>
              <div className="article-header">
                <div className="header-left-part">
                  <div className="user-related">
                    <div className="author-name">{`${article.author.first_name} ${article.author.last_name}`}</div>
                    <div
                      className="author-username"
                      onClick={(event) =>
                        this.handleRoute(event, article.author.url)
                      }
                    >
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
              <pre
                className="article-content"
                onMouseUp={this.handleAnnotation}
              >
                {article.content}
              </pre>
              <div className="article-like">
                <h4>Number of Likes: {article.num_likes}</h4>

                <Button
                  style={{ paddingLeft: 12, cursor: 'auto' }}
                  onClick={this.handleLike}
                >
                  <Icon
                    type="like"
                    theme={action === 'liked' ? 'filled' : 'outlined'}
                    onClick={this.handleLike}
                  />
                </Button>
                <Button
                  onClick={this.handleDislike}
                  style={{ paddingLeft: 12, cursor: 'auto' }}
                >
                  <Icon
                    type="dislike"
                    theme={action === 'disliked' ? 'filled' : 'outlined'}
                    onClick={this.handleDislike}
                  />
                </Button>
              </div>
              <div className="written-by" />
              <div className="article-comment">
                <div className="comment-header-div">
                  <h2 className="comment-header">COMMENTS</h2>
                </div>

                {comments &&
                  comments.map((comment) => (
                    <Comment
                      submitUrl="https://api.traiders.tk/comments/article/"
                      author={comment.user.username}
                      content={comment.content}
                      createdAt={comment.created_at.substring(0, 10)}
                      image={comment.image}
                      commentId={comment.id}
                      articleId={comment.article}
                      authorURL={comment.user.url}
                      avatarValue={comment.user.avatar}
                      numberofLikes={comment.num_likes}
                      key={comment.user.username}
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
            {showAnnotationTab && (
              <div className="annotation-container">
                {!user ? (
                  <div className="signin-warning">
                    <div className="warning-text">
                      Sign in to start annotating
                    </div>
                    <Button
                      type="primary"
                      onClick={() => history.push('/login')}
                    >
                      LOGIN
                    </Button>
                  </div>
                ) : (
                  <div className="add-annotation-container">
                    <div className="add-annotate-title">ANNOTATE</div>
                    <Input.TextArea
                      placeholder="Type here to annotate"
                      onChange={this.handleAnnotationInput}
                    />
                    <div className="annotation-submit-button">
                      <Button type="primary" onClick={this.submitAnnotation}>
                        Submit
                      </Button>
                    </div>
                  </div>
                )}
              </div>
            )}
          </div>
        )) ||
          'Loading'}
      </div>
    );
  }
}
export default Article;
