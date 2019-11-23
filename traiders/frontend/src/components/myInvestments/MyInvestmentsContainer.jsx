import { connect } from 'react-redux';

import MyInvestments from './MyInvestments';
import {
  getManualInvestments,
  getOnlineInvestments
} from '../../redux/investments/actions';

const mapStateToProps = (state) => {
  return {
    user: state.user.currentUser,
    manualInvestments: state.investment.manualInvestments,
    onlineInvestments: state.investment.onlineInvestments
  };
};

const mapDispatchToProps = {
  getManualInvestments,
  getOnlineInvestments
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(MyInvestments);
