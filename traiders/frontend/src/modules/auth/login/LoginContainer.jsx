import { connect } from 'react-redux';

import { loginUser } from '../../../redux/auth/actions';
import Login from './Login';

const mapStateToProps = (state) => {
  return {
    user: state.user.currentUser
  };
};

const mapDispatchToProps = {
  loginUser
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Login);
