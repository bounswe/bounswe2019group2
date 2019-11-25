import React, { Component } from 'react';
import { Avatar, Icon, Button, Modal, Radio } from 'antd';
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
      followingNumber: null,
      followerNumber: null,
      isFollowing: null,
      visible: false,
      value: 1
    };
  }

  componentWillMount() {
    const {
      getFollowers,
      getFollowings,
      userId,
      followings,
      otherUserId,
      getOtherUser,
      otherUser,
      followers,
      followingN
    } = this.props;
    getFollowers(otherUserId);
    // eslint-disable-next-line no-console
    if (followers) {
      const followersN = followers.length;
      this.setState({
        followingNumber: followingN,
        followerNumber: followersN
      });
    }
    if (otherUserId) {
      getOtherUser(otherUserId);
      getFollowings(userId);
    }
    this.setState({
      value: otherUser.avatar
    });

    let Following =
      followings &&
      followings.filter((element) => element.user_followed === otherUser.url);
    Following = Following.length !== 0;
    this.setState({
      isFollowing: Following
    });
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
      userId,
      getFollowers,
      otherUserId
    } = this.props;
    // eslint-disable-next-line camelcase
    const user_followed = otherUser.url;
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
    setTimeout(() => getFollowings(userId), 500);
    setTimeout(() => getFollowers(otherUserId), 500);
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
      userId,
      getFollowers,
      otherUserId
    } = this.props;
    if (followings) {
      let followDetails;
      followings.forEach((element) => {
        if (element.user_followed === otherUser.url) followDetails = element;
      });
      deleteFollowing(followDetails.id, user.key);

      this.setState((prevState) => ({
        isFollowing: !prevState.isFollowing,
        followerNumber: prevState.followerNumber - 1
      }));
    }
    setTimeout(() => getFollowings(userId), 500);
    setTimeout(() => getFollowers(otherUserId), 500);
  };

  handleOk = () => {
    const { updateUser, user, userId, otherUser } = this.props;
    const { value } = this.state;
    const body = { avatar: value };
    updateUser(userId, body, user.key);
    user.user.avatar = value;
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
    const { user, other, otherUser, followingN } = this.props;
    const {
      followerNumber,
      followingNumber,
      isFollowing,
      visible,
      value
    } = this.state;
    if (followingNumber !== followingN) {
      this.setState({
        followingNumber: followingN
      });
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
            <h1>{otherUser.username}</h1>
            <h3>{followerNumber} Followers</h3>
            <h3>{followingNumber} Followings</h3>
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
          {user.is_private ? (
            <div className="right-up">
              <Icon type="lock" style={{ fontSize: '26px' }} />
              Private
            </div>
          ) : (
            <div className="right-up">
              <Icon type="unlock" style={{ fontSize: '26px' }} />
              Public
            </div>
          )}
          {other ? null : (
            <div className="right-down">
              <Icon type="edit" style={{ fontSize: '26px' }} />
              <Link
                className="update-link"
                to={{ pathname: '/updateprofile', state: { user } }}
              >
                Edit
              </Link>
            </div>
          )}
        </div>
      </div>
    );
  }
}

export default UserHeader;
