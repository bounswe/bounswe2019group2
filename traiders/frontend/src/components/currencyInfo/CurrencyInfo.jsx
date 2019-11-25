import React from 'react';
import { Icon } from 'antd';

import './currency-info.scss';
import history from '../../common/history';

const CurrencyInfo = (props) => {
  const { data } = props;
  const { base_equipment, target_equipment } = data;

  const changeRate = data.ratio - data.open;

  const changeType = changeRate < 0 ? 'fall' : 'rise';

  const handleRoute = () => {
    const url = `/parity/${base_equipment.symbol}/TRY`;
    history.push(url);
  };

  const handleRouteEquipment = (event, name) => {
    event.stopPropagation();
    const url = `/equipment/${name}`;
    history.push(url);
  };

  return (
    <div className="currency-container" onClick={handleRoute}>
      <div className="currency-name">
        <div
          onClick={(event) =>
            handleRouteEquipment(event, base_equipment.symbol)
          }
          name={base_equipment.symbol}
        >
          {base_equipment.symbol}
        </div>
        <div
          name="TRY"
          onClick={(event) =>
            handleRouteEquipment(event, target_equipment.symbol)
          }
        >
          / {target_equipment.symbol}
        </div>
      </div>
      <div className="currency-price">{Number(data.ratio).toFixed(4)}</div>
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
