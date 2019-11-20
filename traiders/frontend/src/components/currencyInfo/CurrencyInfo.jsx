import React from 'react';
import { Icon } from 'antd';

import './currency-info.scss';
import history from '../../common/history';

const CurrencyInfo = (props) => {
  const { fullName, changeRate, price } = props;

  const changeType = changeRate < 0 ? 'fall' : 'rise';

  const handleRoute = () => {
    const url = `/equipment/${fullName}`;
    history.push(url);
  };

  return (
    <div className="currency-container" onClick={handleRoute}>
      <div className="currency-name">{fullName}</div>
      <div className="currency-price">{price.toFixed(4)}</div>
      <div className="currency-change-container">
        <div className={`currency-change-arrow ${changeType}`}>
          <Icon type={changeType} />
        </div>
        <div className={`currency-change-amount ${changeType}`}>
          %{changeRate.toFixed(4)}
        </div>
      </div>
    </div>
  );
};

export default CurrencyInfo;
