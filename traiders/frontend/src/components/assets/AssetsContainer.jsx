import { connect } from 'react-redux';

import Assets from './Assets';
import { getAssets, getCurrencyList } from '../../redux/investments/actions';

const mapStateToProps = (state) => {
  return {
    user: state.user.currentUser,
    assets: state.investment.assets,
    currencyList: state.investment.currencyList
  };
};

const mapDispatchToProps = {
  getAssets,
  getCurrencyList
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Assets);
