import React from 'react';
import { Link } from 'react-router-dom';

import Page from '../../components/page/Page';

const Home = () => {
  return (
    <div>
      <Page>
        <Link to="/login">Login</Link>
        <Link to="/register">Register</Link>
      </Page>
    </div>
  );
};

export default Home;
