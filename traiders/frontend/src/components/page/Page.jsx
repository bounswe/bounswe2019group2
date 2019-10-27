import React from 'react';

import './page.scss';
import Navbar from '../navbar/NavbarContainer';
import CurrencyBar from '../currencyBar/CurrencyBarContainer';
import Footer from '../footer/Footer';
// TODO this component should updated after the implementation of Navbar and Footer components.

const Page = (props) => {
  const { children } = props;

  return (
    <div className="root-container">
      <Navbar />
      <CurrencyBar />
      <div className="content">{children}</div>
      <Footer />
    </div>
  );
};

export default Page;
