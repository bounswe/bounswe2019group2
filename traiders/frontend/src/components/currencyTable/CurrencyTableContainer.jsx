import { connect } from 'react-redux';

import CurrencyTable from './CurrencyTable';
import { getParities } from '../../redux/parities/actions';
import { getOneParity } from '../../redux/parities/actions';

const mapStateToProps = (state) => {
  return {
    parityList: state.parity.parityList
  };
};

const mapDispatchToProps = {
  getParities,
  getOneParity
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(CurrencyTable);
