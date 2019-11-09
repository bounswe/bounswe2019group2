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
    let currencies = currencyList.slice(0, 7);
    currencies = currencies.filter((element) => element.code !== 'TRY');
    currencies = currencies.map((element, index) => {
      return (
        <CurrencyInfo
          fullName={element.code}
          price={element.latest}
          changeRate={element.change_rate}
          key={index}
        />
      );
    });

    return <div className="currency-bar-container">{currencies}</div>;
  }
}

export default CurrencyBar;
