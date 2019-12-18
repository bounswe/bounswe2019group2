import { connect } from 'react-redux';

import UserProfile from './UserProfile';

const mapStateToProps = (state) => {
  return {
    user: state.user.currentUser
  };
};

export default connect(mapStateToProps)(UserProfile);
