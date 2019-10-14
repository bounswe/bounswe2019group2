import { connect } from 'react-redux';

import { postUserRegister } from '../../../redux/auth/actions';
import Register from './Register';

const mapDispatchToProps = {
  postUserRegister
};

export default connect(
  null,
  mapDispatchToProps
)(Register);
