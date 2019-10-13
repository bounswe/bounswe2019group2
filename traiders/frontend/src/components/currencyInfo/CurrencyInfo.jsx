import React from 'react';
import { Icon } from 'antd';
import './currency-info.scss';

const CurrencyInfo = (props) => {
  const { fullName, changeRate, price } = props;
  const changeType = changeRate < 0 ? 'fall' : 'rise';

  return (
    <div className="currency-container">
      <div className="currency-name">{fullName}</div>
      <div className="currency-price">{price}</div>
      <div className="currency-change-container">
        <div className={`currency-change-arrow ${changeType}`}>
          <Icon type={changeType} />
        </div>
        <div className={`currency-change-amount ${changeType}`}>
          %{changeRate}
        </div>
      </div>
    </div>
  );
};

export default CurrencyInfo;
