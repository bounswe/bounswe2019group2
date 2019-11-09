import { connect } from 'react-redux';

import AddComment from './AddComment';

const mapStateToProps = (state) => {
  return {
    user: state.user.currentUser,
    article: state.article.currentArticle
  };
};

export default connect(mapStateToProps)(AddComment);
