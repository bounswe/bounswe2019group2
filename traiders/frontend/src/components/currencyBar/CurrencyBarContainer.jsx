import { connect } from 'react-redux';

import CurrencyBar from './CurrencyBar';
import { getCurrencies } from '../../redux/parities/actions';

const mapStateToProps = (state) => {
  return {
    currencyList: state.parity.limitedParityList
  };
};

const mapDispatchToProps = {
  getCurrencies
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(CurrencyBar);
