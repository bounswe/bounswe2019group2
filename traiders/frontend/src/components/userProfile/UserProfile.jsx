import React from 'react';

import Page from '../page/Page';
import UserHeader from '../userHeader/UserHeader';
import './user-profile.scss';

const UserProfile = (props) => {
  return (
    <Page>
      <UserHeader data={props.user} />
    </Page>
  );
};

export default UserProfile;
