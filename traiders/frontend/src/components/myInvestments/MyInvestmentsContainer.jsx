import { connect } from 'react-redux';

import MyInvestments from './MyInvestments';
import { getInvestments } from '../../redux/investments/actions';

const mapStateToProps = (state) => {
  return {
    user: state.user.currentUser,
    investments: state.investment.investments
  };
};

const mapDispatchToProps = {
  getInvestments
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(MyInvestments);
