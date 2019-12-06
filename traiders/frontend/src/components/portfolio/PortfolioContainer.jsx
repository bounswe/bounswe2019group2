import { connect } from 'react-redux';

import Portfolio from './Portfolio';
import { getCurrencyList } from '../../redux/investments/actions';
const mapStateToProps = (state) => {
  return {
    user: state.user.currentUser,
    currencyList: state.investment.currencyList
  };
};

const mapDispatchToProps = {
  getCurrencyList
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Portfolio);
