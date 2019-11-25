import React, { Component } from 'react';

import { API } from '../../redux/apiConfig';
import { GetWithUrl } from '../../common/http/httpUtil';
import Page from '../page/Page';
import UserHeader from '../userHeader/UserHeaderContainer';
import UserSuccess from '../userSuccess/UserSuccessContainer';
import './other-user.scss';

class OtherUser extends Component {
  constructor(props) {
    super(props);
    this.state = {
      followings: []
    };
  }

  componentWillMount() {
    const { match, getOtherUser, followings } = this.props;
    const { id } = match.params;
    getOtherUser(id);
    GetWithUrl(`${API}/following/?user_following=${id}`)
      .then((response) => {
        if (response.status === 200) {
          response.json().then((res) => this.setState({ followings: res }));
        }
      })
      .catch((error) =>
        // eslint-disable-next-line no-console
        console.log('Error while fetching followings\n', error)
      );
    // eslint-disable-next-line no-console
    console.log(followings);
  }

  render() {
    const { otherUser, user } = this.props;
    const { followings } = this.state;
    const followingNumber = followings.length;
    if (otherUser) {
      return (
        <Page>
          <div className="other-profile-container">
            <div>
              <UserHeader
                user={otherUser}
                other
                followingN={followingNumber}
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
    }
    return null;
  }
}

export default OtherUser;
