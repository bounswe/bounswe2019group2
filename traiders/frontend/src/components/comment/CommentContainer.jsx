import { connect } from 'react-redux';

import Comment from './Comment';
import { getArticleComments } from '../../redux/article/actions';
import { getEquipmentComments } from '../../redux/equipment/actions';

const mapStateToProps = (state) => {
  return {
    user: state.user.currentUser,
    equipment: state.equipment.currentEquipment
  };
};

export default connect(
  mapStateToProps,
  { getArticleComments, getEquipmentComments }
)(Comment);
