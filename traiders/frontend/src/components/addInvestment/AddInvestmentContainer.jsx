import { connect } from 'react-redux';

import AddInvestment from './AddInvestment';

const mapStateToProps = (state) => {
  return {
    user: state.user.currentUser
  };
};

const mapDispatchToProps = {};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(AddInvestment);
