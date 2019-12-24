import { connect } from 'react-redux';

import UserProfile from './UserProfile';

const mapStateToProps = (state) => {
  return {
    user: state.user.currentUser,
    notificationList: state.notification.notificationList
  };
};

export default connect(mapStateToProps)(UserProfile);
