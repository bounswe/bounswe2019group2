import { connect } from 'react-redux';

import AddArticle from './AddArticle';

const mapStateToProps = (state) => {
  return {
    user: state.user.currentUser
  };
};

export default connect(mapStateToProps)(AddArticle);
