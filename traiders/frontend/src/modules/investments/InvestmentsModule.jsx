import React from 'react';

import './investments-module.scss';
import Page from '../../components/page/Page';
import MyInvestments from '../../components/myInvestments/MyInvestmentsContainer';
import AddInvestment from '../../components/addInvestment/AddInvestmentContainer';
import Assets from '../../components/assets/AssetsContainer';

const InvestmentsModule = () => {
  return (
    <Page>
      <div className="investments-page-container">
        <div className="assets-container">
          <Assets />
        </div>
        <div className="investment-container">
          <AddInvestment />
          <MyInvestments />
        </div>
      </div>
    </Page>
  );
};

export default InvestmentsModule;
