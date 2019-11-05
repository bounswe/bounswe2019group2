import React from 'react';

import Page from '../page/Page';
import UserHeader from '../userHeader/UserHeader';
import './user-profile.scss';

const UserProfile = (props) => {
  const datas = props;
  return (
    <Page>
      <UserHeader data={datas.user} />
    </Page>
  );
};

export default UserProfile;
