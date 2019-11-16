import { connect } from 'react-redux';

import Portfolio from './Portfolio';

const mapStateToProps = (state) => {
  return {
    user: state.user.currentUser
  };
};

export default connect(mapStateToProps)(Portfolio);
