import { connect } from 'react-redux';

import MyInvestments from './MyInvestments';
import {
  getManualInvestments,
  getOnlineInvestments,
  getCurrencyList
} from '../../redux/investments/actions';

const mapStateToProps = (state) => {
  return {
    user: state.user.currentUser,
    manualInvestments: state.investment.manualInvestments,
    onlineInvestments: state.investment.onlineInvestments,
    currencyList: state.investment.currencyList
  };
};

const mapDispatchToProps = {
  getManualInvestments,
  getOnlineInvestments,
  getCurrencyList
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(MyInvestments);
