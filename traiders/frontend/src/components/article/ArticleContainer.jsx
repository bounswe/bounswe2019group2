import { connect } from 'react-redux';

import Article from './Article';
import { getArticle } from '../../redux/article/actions';

const mapStateToProps = (state) => {
  return {
    article: state.article.currentArticle,
    user: state.user.currentUser
  };
};

const mapDispatchToProps = {
  getArticle
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Article);
