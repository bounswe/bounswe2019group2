import React, { Component } from 'react';

import { API } from '../../redux/apiConfig';
import Page from '../page/Page';
import UserHeader from '../userHeader/UserHeaderContainer';
import UserSuccess from '../userSuccess/UserSuccessContainer';
import './other-user.scss';
import Portfolios from '../portfolio/MyPortfolioContainer';

class OtherUser extends Component {
  constructor(props) {
    super(props);
    this.state = {
      followings: [],
      followingNumber: 0,
      followers: [],
      followerNumber: 0
    };
  }

  componentDidMount() {
    const { match, getOtherUser } = this.props;
    const { id } = match.params;
    getOtherUser(id);
    fetch(`${API}/following/?user_following=${id}&status=1`)
      .then((res) => res.json())
      .then((data) => {
        this.setState({ followings: data });
        // eslint-disable-next-line no-console
        this.setState((prevState) => ({
          followingNumber: prevState.followings.length
        }));
      })
      // eslint-disable-next-line no-console
      .catch(console.log);
    fetch(`${API}/following/?user_followed=${id}&status=1`)
      .then((res) => res.json())
      .then((data) => {
        this.setState({ followers: data });
        // eslint-disable-next-line no-console
        this.setState((prevState) => ({
          followerNumber: prevState.followers.length
        }));
      })
      // eslint-disable-next-line no-console
      .catch(console.log);
  }

  render() {
    const { otherUser, user } = this.props;
    const { match } = this.props;
    const { id } = match.params;
    const { followingNumber, followerNumber } = this.state;
    let User;
    let Key;
    if (user) {
      User = user.user;
      Key = user.key;
    } else {
      User = null;
      Key = null;
    }
    if (otherUser) {
      return (
        <Page>
          <div className="other-profile-container">
            <div>
              <UserHeader
                user={User}
                userKey={Key}
                other
                followingN={followingNumber}
                followerN={followerNumber}
                otherUser={otherUser}
              />
            </div>
            <div className="success-container">
              <UserSuccess id={id} />
            </div>
            <div>
              {otherUser.is_private ? null : (
                <Portfolios other otherUserId={id} />
              )}
            </div>
          </div>
        </Page>
      );
    }
    return 'user not found';
  }
}

export default OtherUser;
