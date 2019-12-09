import {
  Comment as CommentAntd,
  Icon,
  Tooltip,
  Avatar,
  Modal,
  Button
} from 'antd';
import React from 'react';
import {
  DeleteWithAuthorization,
  PatchWithAuthorization
} from '../../common/http/httpUtil';
import history from '../../common/history';
import { API } from '../../redux/apiConfig';
import images from '../../common/images';
import './comment.scss';

class Comment extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      visible: false,
      likes: 0,
      dislikes: 0,
      action: null
    };
  }

  like = () => {
    this.setState({
      likes: 1,
      dislikes: 0,
      action: 'liked'
    });
    this.handleLike();
  };

  dislike = () => {
    this.setState({
      likes: 0,
      dislikes: 1,
      action: 'disliked'
    });
    this.handleDislike();
  };

  handleCancel = () => {
    this.setState({
      visible: false
    });
  };

  deleteComment = () => {
    this.setState({ visible: true });
  };

  handleDislike = () => {
    const {
      user,
      getEquipmentComments,
      getArticleComments,
      isLiked,
      numberofLikes,
      submitUrl,
      articleId,
      commentId,
      equipment
    } = this.props;
    const { dislikes } = this.state;

    if (user) {
      if (submitUrl.includes('equipment')) {
        const url = `${API}/comments/equipment/${commentId}/?equipment=${equipment}`;
        if (!isLiked) {
          const likeCount = numberofLikes - dislikes;
          const body = {
            id: commentId,
            equipment,
            num_likes: likeCount,
            is_liked: false
          };
          PatchWithAuthorization(url, body, user.key)
            // eslint-disable-next-line no-console
            .then((response) => console.log(response))
            // eslint-disable-next-line no-console
            .catch((error) => console.log('Errow while following\n', error));
        } else {
          alert("You'didnt like this comment!");
        }
        setTimeout(() => getEquipmentComments(equipment), 1000);
      } else if (submitUrl.includes('article')) {
        const splittedArticle = articleId.split('/', 5)[4];
        const url = `${API}/comments/article/${commentId}/?article=${splittedArticle}`;
        if (!isLiked) {
          const likeCount = numberofLikes - dislikes;

          const body = {
            id: commentId,
            article: articleId,
            num_likes: likeCount,
            is_liked: false
          };
          PatchWithAuthorization(url, body, user.key)
            // eslint-disable-next-line no-console
            .then((response) => console.log(response))
            // eslint-disable-next-line no-console
            .catch((error) => console.log('Errow while following\n', error));
        } else {
          alert("You'didnt like this comment!");
        }
        setTimeout(() => getArticleComments(splittedArticle), 1000);
      }
    } else {
      history.push('/login');
    }
  };

  handleLike = () => {
    const {
      user,
      getEquipmentComments,
      isLiked,
      numberofLikes,
      submitUrl,
      articleId,
      getArticleComments,
      commentId,
      equipment
    } = this.props;
    const { likes } = this.state;

    if (user) {
      if (submitUrl.includes('equipment')) {
        const url = `${API}/comments/equipment/${commentId}/?equipment=${equipment}`;
        if (!isLiked) {
          const likeCount = numberofLikes + likes;
          const body = {
            id: commentId,
            equipment,
            num_likes: likeCount,
            is_liked: true
          };
          PatchWithAuthorization(url, body, user.key)
            // eslint-disable-next-line no-console
            .then((response) => console.log(response))
            // eslint-disable-next-line no-console
            .catch((error) => console.log('Errow while following\n', error));
        } else {
          alert("You've already liked this comment!");
        }
        setTimeout(() => getEquipmentComments(equipment), 500);
      } else if (submitUrl.includes('article')) {
        const splittedArticle = articleId.split('/', 5)[4];
        const url = `${API}/comments/article/${commentId}/?article=${splittedArticle}`;
        if (!isLiked) {
          const likeCount = numberofLikes + likes;
          const body = {
            id: commentId,
            article: articleId,
            num_likes: likeCount,
            is_liked: true
          };
          PatchWithAuthorization(url, body, user.key)
            // eslint-disable-next-line no-console
            .then((response) => console.log(response))
            // eslint-disable-next-line no-console
            .catch((error) => console.log('Errow while following\n', error));
        } else {
          alert("You've already liked this comment!");
        }
        setTimeout(() => getArticleComments(splittedArticle), 500);
      }
    } else {
      history.push('/login');
    }
  };

  handleOk = () => {
    const {
      user,
      commentId,
      articleId,
      submitUrl,
      equipment,
      getArticleComments,
      getEquipmentComments
    } = this.props;

    if (submitUrl.includes('equipment')) {
      const url = `${API}/comments/equipment/${commentId}/?equipment=${equipment}`;
      DeleteWithAuthorization(url, user.key).then((response) => {
        if (response.status === 204) {
          // eslint-disable-next-line
          alert('Succesfully deleted.');
          this.setState({
            visible: false
          });
          // eslint-disable-next-line
        }
        setTimeout(() => getEquipmentComments(equipment), 500);
      });
    } else if (submitUrl.includes('article')) {
      const splittedArticle = articleId.split('/', 5)[4];
      const url = `${API}/comments/article/${commentId}/?article=${splittedArticle}`;
      DeleteWithAuthorization(url, user.key).then((response) => {
        if (response.status === 204) {
          // eslint-disable-next-line
          alert('Succesfully deleted.');
          this.setState({
            visible: false
          });
          // eslint-disable-next-line
        }
      });
      setTimeout(() => getArticleComments(splittedArticle), 500);
    }
  };

  handleRoute = (event, authorURL) => {
    const array = authorURL.split('/');
    const userId = array[array.length - 2];
    event.stopPropagation();
    const url = `/profile/${userId}`;
    history.push(url);
  };

  handleCancel = () => {
    this.setState({
      visible: false
    });
  };

  render() {
    const { action } = this.state;
    const {
      author,
      createdAt,
      content,
      image,
      user,
      authorURL,
      avatarValue,
      numberofLikes
    } = this.props;

    const { visible } = this.state;
    const ownComment = user && authorURL ? user.user.url === authorURL : false;
    const actions = [
      <span key="comment-basic-like">
        {numberofLikes}
        <Tooltip title="Like">
          <Icon
            type="like"
            theme={action === 'liked' ? 'filled' : 'outlined'}
            onClick={this.like}
          />
        </Tooltip>
        <span style={{ paddingLeft: 8, cursor: 'auto' }} />
      </span>,
      <span key=' key="comment-basic-dislike"'>
        <Tooltip title="Dislike">
          <Icon
            type="dislike"
            theme={action === 'disliked' ? 'filled' : 'outlined'}
            onClick={this.dislike}
          />
        </Tooltip>
      </span>
    ];

    return (
      <div className="comment-container">
        {ownComment && (
          <div className="own-part">
            <Button
              type="danger"
              onClick={this.deleteComment}
              className="button-style"
            >
              <Icon type="delete" className="icon-style" />
            </Button>
          </div>
        )}
        {images[avatarValue - 1] && (
          <div className="main-comment">
            <CommentAntd
              actions={actions}
              author={author}
              avatar={
                <Avatar
                  onClick={(event) => this.handleRoute(event, authorURL)}
                  src={images[avatarValue - 1].src}
                  alt={author}
                />
              }
              content={content}
              datetime={createdAt}
            />
            <div className="comment-image">
              <img className="image" src={image} alt={image} width="200px" />
            </div>
          </div>
        )}
        <Modal
          title="DELETE"
          visible={visible}
          onOk={this.handleOk}
          onCancel={this.handleCancel}
        >
          <div className="alert-container">
            Are you sure? There is no way to recover this action!
          </div>
        </Modal>
      </div>
    );
  }
}

export default Comment;
