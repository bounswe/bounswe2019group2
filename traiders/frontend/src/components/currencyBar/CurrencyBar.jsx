import React, { Component } from 'react';

import './currency-bar.scss';
import CurrencyInfo from '../currencyInfo/CurrencyInfo';

class CurrencyBar extends Component {
  componentDidMount() {
    const { getCurrencies } = this.props;
    getCurrencies();
    this.gettingCurrencies = setInterval(getCurrencies, 10000);
  }

  componentWillUnmount() {
    clearInterval(this.gettingCurrencies);
  }

  render() {
    const { currencyList } = this.props;
    let currencies;
    if (currencyList) {
      currencies = currencyList.map((element, index) => {
        return (
          <CurrencyInfo
            data={element}
            // eslint-disable-next-line react/no-array-index-key
            key={index}
          />
        );
      });
    }

    return <div className="currency-bar-container">{currencies}</div>;
  }
}

export default CurrencyBar;
