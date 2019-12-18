import { connect } from 'react-redux';

import UserHeader from './UserHeader';

import {
  getFollowings,
  getFollowers,
  deleteFollowing,
  updateUser,
  getOtherUser
} from '../../redux/auth/actions';

const mapStateToProps = (state) => {
  return {
    followings: state.user.followings
  };
};

const mapDispatchToProps = {
  getFollowings,
  getFollowers,
  deleteFollowing,
  updateUser,
  getOtherUser
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(UserHeader);
