import { connect } from 'react-redux';

import CurrencyTable from './CurrencyTable';
import { getParities } from '../../redux/parities/actions';

const mapStateToProps = (state) => {
  return {
    parityList: state.parity.parityList
  };
};

const mapDispatchToProps = {
  getParities
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(CurrencyTable);
