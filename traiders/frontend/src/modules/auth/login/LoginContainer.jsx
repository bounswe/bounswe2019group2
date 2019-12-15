import { connect } from 'react-redux';

import { loginUser, loginUserWithGoogle } from '../../../redux/auth/actions';
import Login from './Login';

const mapStateToProps = (state) => {
  return {
    user: state.user.currentUser
  };
};

const mapDispatchToProps = {
  loginUser,
  loginUserWithGoogle
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Login);
