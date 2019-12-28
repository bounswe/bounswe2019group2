import { connect } from 'react-redux';

import Notification from './Notification';

import { getNotifications } from '../../redux/notification/actions';

const mapStateToProps = (state) => {
  return {
    user: state.user.currentUser,
    notificationList: state.notification.notificationList
  };
};

const mapDispatchToProps = { getNotifications };

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Notification);
