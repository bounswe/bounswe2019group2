import { connect } from 'react-redux';

import Article from './Article';
import {
  getArticle,
  getArticleAuthor,
  getArticleComments,
  getArticleWithAuthorization,
  getArticleCommentsWithAuthorization,
  getArticleAnnotations
} from '../../redux/article/actions';
import {
  getFollowings,
  getFollowers,
  deleteFollowing
} from '../../redux/auth/actions';

const mapStateToProps = (state) => {
  return {
    article: state.article.currentArticle,
    author: state.article.author,
    comments: state.article.commentsList,
    user: state.user.currentUser,
    followings: state.user.followings
  };
};

const mapDispatchToProps = {
  getArticleWithAuthorization,
  getArticle,
  getArticleAuthor,
  getArticleComments,
  getFollowings,
  getFollowers,
  deleteFollowing,
  getArticleCommentsWithAuthorization,
  getArticleAnnotations
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Article);
