import { connect } from 'react-redux';

import UserSuccess from './UserSuccess';
import { getParities } from '../../redux/success/actions';

const mapStateToProps = (state) => {
  return {
    parityList: state.success.parityList
  };
};

const mapDispatchToProps = {
  getParities
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(UserSuccess);
