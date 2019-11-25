import { connect } from 'react-redux';

import AddComment from './AddComment';
import { getArticleComments } from '../../redux/article/actions';

const mapStateToProps = (state) => {
  return {
    user: state.user.currentUser,
    article: state.article.currentArticle,
    equipment: state.equipment.currentEquipment
  };
};

export default connect(
  mapStateToProps,
  { getArticleComments }
)(AddComment);
