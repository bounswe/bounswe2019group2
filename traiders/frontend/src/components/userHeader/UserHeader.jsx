import React, { Component } from 'react';
import { Avatar, Icon, Button } from 'antd';
import { Link } from 'react-router-dom';

import { API } from '../../redux/apiConfig';
import { PostWithAuthorization } from '../../common/http/httpUtil';
import history from '../../common/history';

import './user-header.scss';

class UserHeader extends Component {
  constructor(props) {
    super(props);
    this.state = {
      followingNumber: null,
      followerNumber: null,
      isFollowing: null
    };
  }
  componentDidMount() {
    const {
      getFollowers,
      getFollowings,
      user,
      followings,
      otherUser
    } = this.props;
    if (user) {
      const array = user.url.split('/');
      const userId = array[array.length - 2];
      getFollowers(userId);
    }
    const { followers, followingN } = this.props;
    console.log(followingN);
    if (followers) {
      const followersN = followers.length;
      this.setState({
        followingNumber: followingN,
        followerNumber: followersN
      });
    }
    if (otherUser) {
      const array = otherUser.user.url.split('/');
      const userId = array[array.length - 2];
      getFollowings(userId);
    }

    let Following =
      followings &&
      followings.filter((element) => element.user_followed === user.url);
    Following = Following.length !== 0 ? true : false;

    this.setState({
      isFollowing: Following
    });

    console.log(followings, followers);
  }

  handleFollow = () => {
    const { user, otherUser, getFollowings } = this.props;
    // eslint-disable-next-line camelcase
    const user_followed = user.url;
    const url = `${API}/following/`;
    const array = otherUser.user.url.split('/');
    const userId = array[array.length - 2];
    if (user) {
      PostWithAuthorization(url, { user_followed }, otherUser.key)
        // eslint-disable-next-line no-console
        .then((response) => console.log(response))
        // eslint-disable-next-line no-console
        .catch((error) => console.log('Errow while following\n', error));
    } else {
      history.push('/login');
    }
    setTimeout(getFollowings(userId), 1000);
    this.setState({
      isFollowing: !this.state.isFollowing,
      followerNumber: this.state.followerNumber + 1
    });
  };

  handleUnfollow = () => {
    const {
      user,
      otherUser,
      deleteFollowing,
      getFollowings,
      followings
    } = this.props;
    const array = otherUser.user.url.split('/');
    const userId = array[array.length - 2];
    if (followings) {
      let followDetails;
      followings.forEach((element) => {
        if (element.user_followed === user.url) followDetails = element;
      });
      deleteFollowing(followDetails.id, otherUser.key);

      this.setState({
        isFollowing: !this.state.isFollowing,
        followerNumber: this.state.followerNumber - 1
      });
    }
    setTimeout(getFollowings(userId), 1000);
  };

  render() {
    const { user, other } = this.props;

    return (
      <div className="user-header-container">
        <div className="left">
          <div className="left-up">
            <Avatar size={80}>{user.username.charAt(0).toUpperCase()}</Avatar>
            <h1>{user.username}</h1>
            <h3>{this.state.followerNumber} Followers</h3>
            <h3>{this.state.followingNumber} Followings</h3>
          </div>
          {this.state.isFollowing ? (
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
