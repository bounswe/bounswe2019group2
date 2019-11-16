import { connect } from 'react-redux';

import Comment from './Comment';

const mapStateToProps = (state) => {
  return {
    user: state.user.currentUser
  };
};

export default connect(mapStateToProps)(Comment);
