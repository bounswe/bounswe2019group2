import React, { Component } from 'react';

import './currency-table.scss';

class CurrencyTable extends Component {
  componentDidMount() {
    const { getParities } = this.props;
    getParities();
  }

  render() {
    let { parityList } = this.props;
    const { base } = this.props;
    if (base !== null && parityList) {
      parityList = parityList.filter((parity) => {
        return parity.target_equipment.symbol === base;
      });
    }

    const currencyList =
      parityList.length > 0
        ? parityList.map((parity) => {
            return (
              <div className="currency-table-row" key={parity.id}>
                <div className="parity">
                  <div className="parity-symbols">
                    {parity.base_equipment.symbol}/
                    {parity.target_equipment.symbol}
                  </div>
                  <div className="parity-names">
                    {parity.base_equipment.name}/{parity.target_equipment.name}
                  </div>
                </div>
                <div className="parity-ratio">{parity.ratio}</div>
              </div>
            );
          })
        : null;
    return (
      <div className="currency-table-container">
        {currencyList}
        <div className="currency-table-footer" />
      </div>
    );
  }
}

export default CurrencyTable;
