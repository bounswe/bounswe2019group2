import { connect } from 'react-redux';

import EquipmentPage from './EquipmentPage';
import {
  getEquipmentComments,
  getEquipment
} from '../../redux/equipment/actions';
import { getParities } from '../../redux/parities/actions';

const mapStateToProps = (state) => {
  return {
    comments: state.equipment.commentsList,
    parityList: state.parity.parityList
  };
};

const mapDispatchToProps = {
  getEquipmentComments,
  getParities,
  getEquipment
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(EquipmentPage);
