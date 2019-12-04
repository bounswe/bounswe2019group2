import { actionTypes } from './actions';

const initialState = {
  commentsList: null,
  currentComment: null,
  currentEquipment: null
};

function equipmentReducer(state = initialState, action) {
  switch (action.type) {
    case actionTypes.SAVE_SINGLE_EQUIPMENT:
      return {
        ...state,
        currentEquipment: action.payload
      };
    case actionTypes.SAVE_EQUIPMENT_COMMENTS:
      return {
        ...state,
        commentsList: action.payload
      };
    case actionTypes.SAVE_SINGLE_COMMENT:
      return {
        ...state,
        currentComment: action.payload
      };
    case actionTypes.CLEAR_EQUIPMENT_COMMENTS:
      return {
        ...state,
        currentComment: null
      };
    default:
      return state;
  }
}

export default equipmentReducer;
