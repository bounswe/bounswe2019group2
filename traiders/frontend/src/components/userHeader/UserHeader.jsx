import React, { Component } from 'react';
import { Avatar, Button, Modal, Radio } from 'antd';
import { Link } from 'react-router-dom';

import { API } from '../../redux/apiConfig';
import { PostWithAuthorization } from '../../common/http/httpUtil';
import history from '../../common/history';
import images from '../../common/images';

import './user-header.scss';

class UserHeader extends Component {
  constructor(props) {
    super(props);
    this.state = {
      followingNumber: 0,
      followerNumber: 0,
      isFollowing: null,
      visible: false,
      value: 1,
      isPrivate: null
    };
  }

  componentDidMount() {
    const {
      getFollowings,
      user,
      followings,
      otherUser,
      followingN,
      followerN
    } = this.props;

    this.setState({
      followingNumber: followingN,
      followerNumber: followerN
    });
    if (user) {
      getFollowings(user.id);
    }
    let Following;
    if (otherUser) {
      this.setState({
        value: otherUser.avatar,
        isPrivate: otherUser.is_private
      });
      Following =
        followings &&
        followings.filter((element) => element.user_followed === otherUser.url);
    }
    if (Following) {
      Following = Following.length !== 0;
      this.setState({
        isFollowing: Following
      });
    } else {
      this.setState({
        isFollowing: false
      });
    }
  }

  onChange = (e) => {
    const v = e.target.value;
    this.setState({
      value: v
    });
  };

  handleFollow = () => {
    const {
      user,
      otherUser,
      getFollowings,
      getFollowers,
      userKey
    } = this.props;
    // eslint-disable-next-line camelcase
    const user_followed = otherUser.url;
    const url = `${API}/following/`;
    if (user) {
      PostWithAuthorization(url, { user_followed }, userKey)
        // eslint-disable-next-line no-console
        .then((response) => console.log(response))
        // eslint-disable-next-line no-console
        .catch((error) => console.log('Errow while following\n', error));
    } else {
      history.push('/login');
    }
    if (user) {
      setTimeout(() => getFollowings(user.id), 500);
    }
    setTimeout(() => getFollowers(otherUser.id), 500);
    this.setState((prevState) => ({
      isFollowing: !prevState.isFollowing,
      followerNumber: prevState.followerNumber + 1
    }));
  };

  handleUnfollow = () => {
    const {
      user,
      otherUser,
      deleteFollowing,
      getFollowings,
      followings,
      getFollowers,
      userKey
    } = this.props;
    if (followings) {
      let followDetails;
      followings.forEach((element) => {
        if (element.user_followed === otherUser.url) followDetails = element;
      });
      deleteFollowing(followDetails.id, userKey);

      this.setState((prevState) => ({
        isFollowing: !prevState.isFollowing,
        followerNumber: prevState.followerNumber - 1
      }));
    }
    if (user) {
      setTimeout(() => getFollowings(user.id), 500);
    }
    setTimeout(() => getFollowers(otherUser.id), 500);
  };

  handlePrivacy = () => {
    const { updateUser, user, userKey, otherUser } = this.props;
    const body = { is_private: !user.is_private };
    otherUser.is_private = !otherUser.is_private;
    this.setState({
      isPrivate: otherUser.is_private
    });
    updateUser(user.id, body, userKey);
  };

  handleOk = () => {
    const { updateUser, user, userKey, otherUser } = this.props;
    const { value } = this.state;
    const body = { avatar: value };
    updateUser(user.id, body, userKey);
    user.avatar = value;
    otherUser.avatar = value;
    this.setState({
      visible: false,
      value
    });
  };

  handleCancel = () => {
    const { otherUser } = this.props;
    this.setState({
      visible: false,
      value: otherUser.avatar
    });
  };

  handleAvatar = () => {
    this.setState({
      visible: true
    });
  };

  render() {
    const { user, other, otherUser } = this.props;
    const {
      followerNumber,
      followingNumber,
      isFollowing,
      visible,
      value,
      isPrivate
    } = this.state;
    let style = null;
    if (other) {
      style = { cursor: 'default', pointerEvents: 'none' };
    }
    if (!otherUser) {
      history.push('/login');
      return <div />;
    }

    return (
      <div className="user-header-container">
        <div className="left">
          <div className="left-up">
            <Avatar
              src={images[value - 1].src}
              className={!other && 'avatar'}
              onClick={!other && this.handleAvatar}
              size={80}
            />
            <Modal
              title="AVATARS"
              visible={visible}
              onOk={this.handleOk}
              onCancel={this.handleCancel}
            >
              <div>
                <Radio.Group onChange={this.onChange} value={value}>
                  {images.map(({ id, src, title }) => (
                    <Radio value={id}>
                      <img
                        key={id}
                        src={src}
                        title={title}
                        alt=""
                        width="100"
                        height="100"
                      />
                    </Radio>
                  ))}
                </Radio.Group>
              </div>
            </Modal>
            <div className="info">
              <h2>{otherUser.username}</h2>
              <h4>{followerNumber} Followers</h4>
              <h4>{followingNumber} Followings</h4>
            </div>
          </div>
          {isFollowing ? (
            <div className="left-down">
              {other && (
                <Button
                  onClick={this.handleUnfollow}
                  type="primary"
                  icon="user-delete"
                  size={14}
                >
                  Unfollow
                </Button>
              )}
            </div>
          ) : (
            <div className="left-down">
              {other && (
                <Button
                  onClick={this.handleFollow}
                  type="primary"
                  icon="user-add"
                  size={14}
                >
                  Follow
                </Button>
              )}
            </div>
          )}
        </div>
        <div className="right">
          {isPrivate ? (
            <div className="right-up">
              <Button
                ghost
                onClick={!other && this.handlePrivacy}
                type="default"
                icon="lock"
                size={14}
                style={style}
              >
                Private
              </Button>
            </div>
          ) : (
            <div className="right-up">
              <Button
                ghost
                onClick={!other && this.handlePrivacy}
                type="default"
                icon="unlock"
                size={14}
                style={style}
              >
                Public
              </Button>
            </div>
          )}

          {other ? null : (
            <div className="right-down">
              <Link
                className="update-link"
                to={{ pathname: '/updateprofile', state: { user } }}
              >
                <Button ghost type="default" icon="edit" size={14}>
                  Edit
                </Button>
              </Link>
            </div>
          )}
        </div>
      </div>
    );
  }
}

export default UserHeader;
