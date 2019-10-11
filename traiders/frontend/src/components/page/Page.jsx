import React from 'react';

import Navbar from '../navbar/Navbar';
// TODO this component should updated after the implementation of Navbar and Footer components.

const Page = (props) => {
  const { children } = props;

  return (
    <div>
      <Navbar />
      {children}
    </div>
  );
};

export default Page;
