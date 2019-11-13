import React from 'react';
import { Icon } from 'antd';

import './custom-table.scss';

const Row = (props) => {
  const { item } = props;
  const { close, open, high, low, base_equipment, target_equipment } = item;
  console.log(base_equipment, target_equipment);
  const changeRate = (((close - open) / open) * 100).toFixed(4);
  const changeType = changeRate < 0 ? 'fall' : 'rise';

  return (
    <div className="table-row">
      <div className="parity-details">
        <div className="parity-symbols">{`${base_equipment.symbol} / ${target_equipment.symbol}`}</div>
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
    parityList.map((element, index) => <Row item={element} key={index} />);

  return <div className="custom-table-container">{parities}</div>;
};
export default CustomTable;
