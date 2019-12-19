import React from 'react';
import { Icon } from 'antd';

import history from '../../common/history';
import './custom-table.scss';

const Row = (props) => {
  const { item } = props;
  // eslint-disable-next-line camelcase
  const { close, open, base_equipment, target_equipment } = item;

  const changeRate = (((close - open) / open) * 100).toFixed(4);
  const changeType = changeRate < 0 ? 'fall' : 'rise';

  const handleRoute = (event, equipmentSymbol) => {
    event.stopPropagation();
    const url = `/equipment/${equipmentSymbol}`;
    history.push(url);
  };

  const handleParity = () => {
    const url = `/parity/${base_equipment.symbol}/${target_equipment.symbol}`;
    history.push(url);
  };

  return (
    <div className="table-row" onClick={handleParity}>
      <div className="parity-details">
        <div className="parity-symbols">
          <div
            onClick={(event) => handleRoute(event, base_equipment.symbol)}
            className="base-equipment"
            value={base_equipment.symbol}
          >
            {`${base_equipment.symbol}`}
          </div>
          /
          <div
            onClick={(event) => handleRoute(event, target_equipment.symbol)}
            className="target-equipment"
            value={target_equipment.symbol}
          >
            {` ${target_equipment.symbol}`}
          </div>
        </div>
        <div className="parity-names">
          {`${base_equipment.name} / ${target_equipment.name}`}
        </div>
      </div>
      <div className={`parity-ratio ${changeType}`}>
        <div>{close}</div>
      </div>
      <div className="change-details">
        <div className={`change-amount ${changeType}`}>
          {(close - open).toFixed(4)}
        </div>
        <div className={`change-ratio ${changeType}`}>
          <Icon type={changeType} />
          <div className="change-rate">{changeRate}</div>
        </div>
      </div>
    </div>
  );
};

const CustomTable = (props) => {
  const { parityList } = props;

  const parities =
    parityList &&
    // eslint-disable-next-line react/no-array-index-key
    parityList.map((element, index) => <Row item={element} key={index} />);

  return <div className="custom-table-container">{parities}</div>;
};
export default CustomTable;
