import React from 'react';

import Page from '../../components/page/Page';
import CurrencyTable from '../../components/currencyTable/CurrencyTableContainer';
import UserProfile from '../../components/userProfile/UserProfile';

const Home = () => {
  return (
    <Page>
      <CurrencyTable />
      <UserProfile />
    </Page>
  );
};

export default Home;
