import { connect } from 'react-redux';

import MyInvestments from './MyInvestments';
import { getInvestments } from '../../redux/investments/actions';

const mapStateToProps = (state) => {
  return {
    user: state.user.currentUser
  };
};

const mapDispatchToProps = {
  getInvestments
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(MyInvestments);
