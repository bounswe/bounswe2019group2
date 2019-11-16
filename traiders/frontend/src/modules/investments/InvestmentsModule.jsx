import React from 'react';

import './investments-module.scss';
import Page from '../../components/page/Page';
import MyInvestments from '../../components/myInvestments/MyInvestmentsContainer';
import AddInvestment from '../../components/addInvestment/AddInvestmentContainer';

const InvestmentsModule = () => {
  return (
    <Page>
      <div className="investments-container">
        <AddInvestment />
        <MyInvestments />
      </div>
    </Page>
  );
};

export default InvestmentsModule;
