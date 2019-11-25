import React from 'react';

import './investments-module.scss';
import Page from '../../components/page/Page';
import MyInvestments from '../../components/myInvestments/MyInvestmentsContainer';
import Assets from '../../components/assets/AssetsContainer';
import MyOrders from '../../components/myOrders/MyOrdersContainer';

const InvestmentsModule = () => {
  return (
    <Page>
      <div className="investments-page-container">
        <div className="assets-container">
          <Assets />
        </div>
        <div className="investment-container">
          <MyInvestments />
        </div>
        <div className="order-container">
          <MyOrders />
        </div>
      </div>
    </Page>
  );
};

export default InvestmentsModule;
