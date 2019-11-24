import React, { Component } from 'react';

import Page from '../page/Page';
import UserHeader from '../userHeader/UserHeaderContainer';
import UserSuccess from '../userSuccess/UserSuccessContainer';
import './other-user.scss';

class OtherUser extends Component {
  constructor(props) {
    super(props);
    this.state = {
      followingNumber: null
    };
  }
  componentDidMount() {
    const { match, getOtherUser, getFollowings, followings } = this.props;
    const { id } = match.params;
    getOtherUser(id);
    getFollowings(id);
    if (followings) {
      const number = followings.length;
      this.setState({
        followingNumber: number
      });
    }
    console.log(followings);
  }

  render() {
    const { otherUser, user } = this.props;
    if (otherUser) {
      return (
        <Page>
          <div className="other-profile-container">
            <div>
              <UserHeader
                user={otherUser}
                other={true}
                followingN={this.state.followingNumber}
                handleFollow={this.handleFollow}
                handleUnfollow={this.handleUnfollow}
                otherUser={user}
              />
            </div>
            <div>
              <UserSuccess user={otherUser} />
            </div>
          </div>
        </Page>
      );
    } else {
      return null;
    }
  }
}

export default OtherUser;
