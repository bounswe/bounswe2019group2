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
    const { match, getOtherUser } = this.props;
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
  }

  render() {
    const { otherUser, user } = this.props;
    const { match } = this.props;
    const { id } = match.params;
    const { followings } = this.state;
    const followingNumber = followings.length;
    const array = user.user.url.split('/');
    const userId = array[array.length - 2];
    if (otherUser) {
      return (
        <Page>
          <div className="other-profile-container">
            <div>
              <UserHeader
                userId={userId}
                other
                followingN={followingNumber}
                otherUserId={id}
              />
            </div>
            <div>
              <UserSuccess id={id} />
            </div>
          </div>
        </Page>
      );
    }
    return null;
  }
}

export default OtherUser;
