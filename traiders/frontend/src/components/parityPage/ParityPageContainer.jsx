import { connect } from 'react-redux';

import ParityPage from './ParityPage';
import { getOneParity } from '../../redux/parities/actions';

const mapStateToProps = (state) => {
  return {
    oneParity: state.parity.oneParity,
    user: state.user.currentUser
  };
};

const mapDispatchToProps = {
  getOneParity
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(ParityPage);
