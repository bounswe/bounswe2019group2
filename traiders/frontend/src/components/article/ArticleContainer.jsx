import { connect } from 'react-redux';

import Article from './Article';
import { getArticle, getArticleAuthor } from '../../redux/article/actions';

const mapStateToProps = (state) => {
  return {
    article: state.article.currentArticle,
    author: state.article.author
  };
};

const mapDispatchToProps = {
  getArticle,
  getArticleAuthor
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Article);
