import React from 'react';
import { Link } from 'react-router-dom';

import Page from '../../components/page/Page';

const Home = () => {
  return (
    <Page>
      <Link to="/login">Login</Link>
      <Link to="/register">Register</Link>
    </Page>
  );
};

export default Home;
