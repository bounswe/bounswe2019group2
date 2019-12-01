import { connect } from 'react-redux';

import AddComment from './AddComment';
import { getArticleComments } from '../../redux/article/actions';
import { getEquipmentComments } from '../../redux/equipment/actions';

const mapStateToProps = (state) => {
  return {
    user: state.user.currentUser,
    article: state.article.currentArticle,
    equipment: state.equipment.currentEquipment
  };
};

export default connect(
  mapStateToProps,
  { getArticleComments, getEquipmentComments }
)(AddComment);
