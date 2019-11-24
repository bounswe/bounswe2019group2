import { connect } from 'react-redux';

import UserHeader from './UserHeader';

import {
  getFollowings,
  getFollowers,
  deleteFollowing
} from '../../redux/auth/actions';

const mapStateToProps = (state) => {
  return {
    followings: state.user.followings,
    followers: state.user.followers
  };
};

const mapDispatchToProps = {
  getFollowings,
  getFollowers,
  deleteFollowing
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(UserHeader);
