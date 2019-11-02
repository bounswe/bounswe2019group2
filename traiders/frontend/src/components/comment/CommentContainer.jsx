import { Comment, Icon, Tooltip, Avatar } from 'antd';
import moment from 'moment';
import React from 'react';

class CommentContainer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
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

  render() {
    const { likes, dislikes, action } = this.state;

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
      </span>,
      <span key="comment-basic-reply-to">Reply to</span>
    ];

    return (
      <div>
        <Comment
          actions={actions}
          author={<p>Mark Gibson</p>}
          avatar={
            <Avatar
              src="https://zos.alipayobjects.com/rmsportal/ODTLcjxAfvqbxHnVXCYX.png"
              alt="Mark Gibson"
            />
          }
          content={
            <p>
              It&apos;s been a long time to see the current USD/TL ratio stopped
              increasing.I am not a fortuneteller but I think this article
              suggest to invest TL which will result in humongous profit.
            </p>
          }
          datetime={
            <Tooltip title={moment().format('YYYY-MM-DD HH:mm:ss')}>
              <span>{moment().fromNow()}</span>
            </Tooltip>
          }
        />
      </div>
    );
  }
}

export default CommentContainer;
