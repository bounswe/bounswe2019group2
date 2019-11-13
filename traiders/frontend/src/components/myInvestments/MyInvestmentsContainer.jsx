import { connect } from 'react-redux';

import MyInvestments from './MyInvestments';

const mapStateToProps = (state) => {
  return {
    user: state.user.currentUser
  };
};

const mapDispatchToProps = {};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(MyInvestments);
