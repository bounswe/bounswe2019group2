import { connect } from 'react-redux';

import ArticleList from './ArticleList';
import { getArticles } from '../../redux/article/actions';

const mapStateToProps = (state) => {
  return {
    articleList: state.article.articleList
  };
};

const mapDispatchToProps = {
  getArticles
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(ArticleList);
