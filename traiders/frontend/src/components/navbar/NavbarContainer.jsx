import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

import Navbar from './Navbar';
import { logout } from '../../redux/auth/actions';

const mapStateToProps = (state) => {
  return {
    user: state.user.currentUser
  };
};
const mapDispatchToProps = (dispatch) =>
  bindActionCreators({ logout }, dispatch);

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Navbar);
