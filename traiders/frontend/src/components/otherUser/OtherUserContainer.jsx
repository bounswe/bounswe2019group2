import { connect } from 'react-redux';

import OtherUser from './OtherUser';

import {
  getFollowings,
  deleteFollowing,
  getOtherUser
} from '../../redux/auth/actions';

const mapStateToProps = (state) => {
  return {
    user: state.user.currentUser,
    otherUser: state.user.otherUser,
    followings: state.user.followings
  };
};

const mapDispatchToProps = {
  getFollowings,
  deleteFollowing,
  getOtherUser
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(OtherUser);
