import { connect } from 'react-redux';

import MyOrders from './MyOrders';

const mapStateToProps = (state) => {
  return {
    user: state.user.currentUser
  };
};

const mapDispatchToProps = {};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(MyOrders);
