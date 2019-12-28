import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

import Navbar from './Navbar';
import { logout } from '../../redux/auth/actions';
import { getNotifications } from '../../redux/notification/actions';

const mapStateToProps = (state) => {
  return {
    user: state.user.currentUser,
    notificationList: state.notification.notificationList
  };
};
const mapDispatchToProps = (dispatch) =>
  bindActionCreators({ logout, getNotifications }, dispatch);

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Navbar);
