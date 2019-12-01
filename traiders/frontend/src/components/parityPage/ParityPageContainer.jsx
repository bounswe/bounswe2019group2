import { connect } from 'react-redux';

import ParityPage from './ParityPage';
import { getOneParity } from '../../redux/parities/actions';
import { getPredictions } from '../../redux/prediction/actions';

const mapStateToProps = (state) => {
  return {
    oneParity: state.parity.oneParity,
    user: state.user.currentUser,
    predictionList: state.prediction.predictionList
  };
};

const mapDispatchToProps = {
  getOneParity,
  getPredictions
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(ParityPage);
