import React, { Component } from 'react';

import Page from '../page/Page';
import { API } from '../../redux/apiConfig';
import UserHeader from '../userHeader/UserHeaderContainer';
import UserSuccess from '../userSuccess/UserSuccessContainer';
import Notification from '../notification/NotificationContainer';
import history from '../../common/history';
import './user-profile.scss';
import Portfolios from '../portfolio/MyPortfolioContainer';
import FollowRequestList from "../followRequest/FollowRequestList";

class UserProfile extends Component {
  constructor(props) {
    super(props);
    this.state = {
      followings: [],
      followingNumber: null,
      followers: [],
      followerNumber: null
    };
  }

  componentDidMount() {
    const { user } = this.props;
    if (user) {
      const array = user.user.url.split('/');
      const id = array[array.length - 2];
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
  }

  render() {
    const { user } = this.props;
    const { followingNumber, followerNumber } = this.state;
    if (!user) {
      history.push('/login');
      return <div />;
    }
    if (followingNumber != null && followerNumber != null) {
      return (
        <Page>
          <div className="profile-container">
            <div className="profile-left">
              <div>
                <UserHeader
                  user={user.user}
                  userKey={user.key}
                  other={false}
                  followingN={followingNumber}
                  followerN={followerNumber}
                  otherUser={user.user}
                />
              </div>
              <div>
                <UserSuccess id={user.user.id} />
              </div>
              <div>
                <Portfolios userOwn={user.id} />
              </div>
            </div>
            <div className="profile-right">
              <Notification />
              {
                user.user.is_private ?
                  <FollowRequestList token={user.key} user={user.user}/> :
                  ''
              }
            }
            </div>
          </div>
        </Page>
      );
    }
    return <div>waiting...</div>;
  }
}

export default UserProfile;
