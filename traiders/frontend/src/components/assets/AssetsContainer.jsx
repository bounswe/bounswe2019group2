import { connect } from 'react-redux';

import Assets from './Assets';
import { getAssets } from '../../redux/investments/actions';

const mapStateToProps = (state) => {
  return {
    user: state.user.currentUser,
    assets: state.investment.assets
  };
};

const mapDispatchToProps = {
  getAssets
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Assets);
