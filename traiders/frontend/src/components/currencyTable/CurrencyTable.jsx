import React, { Component } from 'react';

import './currency-table.scss';

class CurrencyTable extends Component {
  componentDidMount() {
    const { getParities } = this.props;
    getParities();
  }
  render() {
    const { parityList } = this.props;
    const currencyList =
      parityList.length > 0
        ? parityList.map((parity, index) => {
            return (
              <div className="currency-table-row" key={index}>
                <div className="parity">
                  <div classname="parity-names">
                    {parity.base_equipment.symbol}/
                    {parity.target_equipment.symbol}
                  </div>
                </div>
                <div className="parity-ratio">{parity.ratio}</div>
              </div>
            );
          })
        : null;
    return (
      <div className="currency-table-container">
        <div className="currency-table-header">
          <div className="parity">Parity</div>
          <div className="ratio">Ratio</div>
        </div>
        {currencyList}
        <div className="currency-table-footer"></div>
      </div>
    );
  }
}

export default CurrencyTable;
