import React from 'react';

import './page.scss';
import Navbar from '../navbar/Navbar';
// TODO this component should updated after the implementation of Navbar and Footer components.

const Page = (props) => {
  const { children } = props;

  return (
    <div className="root-container">
      <Navbar />
      <div className="content">{children}</div>
    </div>
  );
};

export default Page;
