import {
  Comment as CommentAntd,
  Icon,
  Tooltip,
  Avatar,
  Modal,
  Button
} from 'antd';
import React from 'react';
import { DeleteWithAuthorization } from '../../common/http/httpUtil';
import history from '../../common/history';
import { API } from '../../redux/apiConfig';
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
  };

  dislike = () => {
    this.setState({
      likes: 0,
      dislikes: 1,
      action: 'disliked'
    });
  };

  handleCancel = () => {
    this.setState({
      visible: false
    });
  };

  deleteComment = () => {
    this.setState({ visible: true });
  };

  handleOk = () => {
    const { user, commentId, articleId } = this.props;

    const splittedArticle = articleId.split('/', 5)[4];

    const url = `${API}/comments/article/${commentId}/?article=${splittedArticle}`;

    DeleteWithAuthorization(url, user.key).then((response) => {
      if (response.status === 204) {
        // eslint-disable-next-line
        alert('Succesfully deleted');
        this.setState({
          visible: false
        });
        // eslint-disable-next-line
        window.location.reload();
      }
    });
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
    const { likes, dislikes, action } = this.state;
    const { author, createdAt, content, image, user, authorURL } = this.props;

    const { visible } = this.state;
    const ownComment = user && authorURL ? user.user.url === authorURL : false;
    const actions = [
      <span key="comment-basic-like">
        <Tooltip title="Like">
          <Icon
            type="like"
            theme={action === 'liked' ? 'filled' : 'outlined'}
            onClick={this.like}
          />
        </Tooltip>
        <span style={{ paddingLeft: 8, cursor: 'auto' }}>{likes}</span>
      </span>,
      <span key=' key="comment-basic-dislike"'>
        <Tooltip title="Dislike">
          <Icon
            type="dislike"
            theme={action === 'disliked' ? 'filled' : 'outlined'}
            onClick={this.dislike}
          />
        </Tooltip>
        <span style={{ paddingLeft: 8, cursor: 'auto' }}>{dislikes}</span>
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
        <div className="main-comment">
          <CommentAntd
            actions={actions}
            author={author}
            avatar={
              <Avatar
                onClick={(event) => this.handleRoute(event, authorURL)}
                src="https://img.pngio.com/avatar-user-computer-icons-software-developer-avatar-png-png-computer-user-900_540.jpg"
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
