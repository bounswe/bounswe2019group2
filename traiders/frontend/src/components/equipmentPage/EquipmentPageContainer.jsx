import { connect } from 'react-redux';

import EquipmentPage from './EquipmentPage';
import { getEquipmentComments } from '../../redux/equipment/actions';

const mapStateToProps = (state) => {
  return {
    comments: state.equipment.commentsList
  };
};

const mapDispatchToProps = {
  getEquipmentComments
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(EquipmentPage);
