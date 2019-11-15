import { connect } from 'react-redux';

import Article from './Article';
import {
  getArticle,
  getArticleAuthor,
  getArticleComments
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
  getArticle,
  getArticleAuthor,
  getArticleComments,
  getFollowings,
  getFollowers,
  deleteFollowing
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Article);
