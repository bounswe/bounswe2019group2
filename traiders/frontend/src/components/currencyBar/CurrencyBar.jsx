import React from 'react';

import './currency-bar.scss';
import CurrencyInfo from '../currencyInfo/CurrencyInfo';

const CurrencyBar = () => {
  return (
    <div className="currency-bar-container">
      <CurrencyInfo fullName="USD" price="5.85" changeRate="0.21" />
      <CurrencyInfo fullName="EUR" price="6.52" changeRate="0.44" />
      <CurrencyInfo fullName="GBP" price="7.43" changeRate="-0.03" />
      <CurrencyInfo fullName="ONS" price="1493.36" changeRate="0.31" />
      <CurrencyInfo fullName="EUR/USD" price="1.10" changeRate="-0.11" />
      <CurrencyInfo fullName="GBP/USD" price="1.25" changeRate="-0.52" />
    </div>
  );
};

export default CurrencyBar;
