import React, { Component } from 'react';

import Page from '../page/Page';
import { API } from '../../redux/apiConfig';
import UserHeader from '../userHeader/UserHeaderContainer';
import UserSuccess from '../userSuccess/UserSuccessContainer';
import './user-profile.scss';

class UserProfile extends Component {
  constructor(props) {
    super(props);
    this.state = {
      followings: [],
      followingNumber: 0
    };
  }

  componentWillMount() {
    const { user } = this.props;
    const array = user.user.url.split('/');
    const id = array[array.length - 2];
    fetch(`${API}/following/?user_following=${id}`)
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
  }

  render() {
    const { user } = this.props;
    const { followingNumber } = this.state;
    const array = user.user.url.split('/');
    const id = array[array.length - 2];
    return (
      <Page>
        <div className="profile-container">
          <div>
            <UserHeader
              userId={id}
              other={false}
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
}

export default UserProfile;
