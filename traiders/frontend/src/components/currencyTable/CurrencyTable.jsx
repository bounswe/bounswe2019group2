import React, { Component } from 'react';

import CustomTable from '../customTable/CustomTable';
import './currency-table.scss';

class CurrencyTable extends Component {
  componentDidMount() {
    const { getParities } = this.props;
    getParities();
  }

  render() {
    const { parityList } = this.props;
    return <CustomTable parityList={parityList} />;
  }
}

export default CurrencyTable;
