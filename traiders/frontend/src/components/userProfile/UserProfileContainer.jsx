import { connect } from 'react-redux';

import UserProfile from './UserProfile';

import { getFollowings } from '../../redux/auth/actions';

const mapStateToProps = (state) => {
  return {
    user: state.user.currentUser,
    followings: state.user.followings
  };
};

const mapDispatchToProps = {
  getFollowings
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(UserProfile);
