import { connect } from 'react-redux';

import ParityChart from './ParityChart';
import { getOneParity } from '../../redux/parities/actions';

const mapStateToProps = (state) => {
  return {
    oneParity: state.parity.oneParity
  };
};

const mapDispatchToProps = {
  getOneParity
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(ParityChart);
