import { connect } from 'react-redux';

import Article from './Article';
import {
  getArticle,
  getArticleAuthor,
  getArticleComments
} from '../../redux/article/actions';

const mapStateToProps = (state) => {
  return {
    article: state.article.currentArticle,
    author: state.article.author,
    comments: state.article.commentsList,
    user: state.user.currentUser
  };
};

const mapDispatchToProps = {
  getArticle,
  getArticleAuthor,
  getArticleComments
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Article);
