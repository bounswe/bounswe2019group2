import { connect } from 'react-redux';

import MyInvestments from './MyInvestments';
import {
  getManualInvestments,
  getOnlineInvestments,
  getCurrencyList,
  getProfitList
} from '../../redux/investments/actions';

const mapStateToProps = (state) => {
  return {
    user: state.user.currentUser,
    manualInvestments: state.investment.manualInvestments,
    onlineInvestments: state.investment.onlineInvestments,
    currencyList: state.investment.currencyList,
    profitLossList: state.investment.profitLossList
  };
};

const mapDispatchToProps = {
  getManualInvestments,
  getOnlineInvestments,
  getCurrencyList,
  getProfitList
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(MyInvestments);
