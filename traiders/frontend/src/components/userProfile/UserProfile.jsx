import React from 'react';

import Page from '../page/Page';
import UserHeader from '../userHeader/UserHeader';
import './user-profile.scss';
import ParityPage from '../parityPage/ParityPage';

const UserProfile = (props) => {
  const datas = props;
  return (
    <Page>
      <UserHeader data={datas.user} />
      <ParityPage base="TRY" target="EUR"></ParityPage>
    </Page>
  );
};

export default UserProfile;
