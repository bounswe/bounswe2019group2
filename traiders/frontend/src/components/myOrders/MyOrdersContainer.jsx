import { connect } from 'react-redux';

import MyOrders from './MyOrders';
import {
  getBuyOrders,
  getStopLossOrders,
  getCurrencyList
} from '../../redux/investments/actions';

const mapStateToProps = (state) => {
  return {
    user: state.user.currentUser,
    buyOrders: state.investment.buyOrderList,
    stopLossOrders: state.investment.stopLossOrderList,
    currencyList: state.investment.currencyList
  };
};

const mapDispatchToProps = {
  getBuyOrders,
  getStopLossOrders,
  getCurrencyList
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(MyOrders);
