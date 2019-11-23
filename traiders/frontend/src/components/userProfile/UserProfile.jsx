import React from 'react';

import Page from '../page/Page';
import UserHeader from '../userHeader/UserHeader';
import UserSuccess from '../userSuccess/UserSuccessContainer';
import './user-profile.scss';

const UserProfile = (props) => {
  const { user } = props;
  return (
    <Page>
      <div className="profile-container">
        <div>
          <UserHeader data={user} />
        </div>
        <div>
          <UserSuccess user={user} />
        </div>
      </div>
    </Page>
  );
};

export default UserProfile;
