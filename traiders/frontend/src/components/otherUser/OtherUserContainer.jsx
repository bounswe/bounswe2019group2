import { connect } from 'react-redux';

import OtherUser from './OtherUser';

import {
  getFollowings,
  deleteFollowing,
  getOtherUser,
  getFollowers
} from '../../redux/auth/actions';

const mapStateToProps = (state) => {
  return {
    user: state.user.currentUser,
    otherUser: state.user.otherUser,
    followings: state.user.followings,
    followers: state.user.followers
  };
};

const mapDispatchToProps = {
  getFollowings,
  deleteFollowing,
  getOtherUser,
  getFollowers
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(OtherUser);
