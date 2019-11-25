import React from 'react';

import Page from '../page/Page';
import UserHeader from '../userHeader/UserHeaderContainer';
import UserSuccess from '../userSuccess/UserSuccessContainer';
import './user-profile.scss';

const UserProfile = (props) => {
  const { user } = props;
  return (
    <Page>
      <div className="profile-container">
        <div>
          <UserHeader user={user.user} other={false} />
        </div>
        <div>
          <UserSuccess user={user.user} />
        </div>
      </div>
    </Page>
  );
};

export default UserProfile;
