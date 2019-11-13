import React from 'react';

import Page from '../../components/page/Page';
import MyInvestments from '../../components/myInvestments/MyInvestmentsContainer';
import AddInvestment from '../../components/addInvestment/AddInvestmentContainer';

const InvestmentsModule = (props) => {
  return (
    <Page>
      <AddInvestment />
      <MyInvestments />
    </Page>
  );
};

export default InvestmentsModule;
