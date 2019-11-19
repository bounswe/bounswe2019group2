import { actionTypes } from './actions';

const initialState = {
  commentsList: null,
  currentComment: null
};

function equipmentReducer(state = initialState, action) {
  switch (action.type) {
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
    default:
      return state;
  }
}

export default equipmentReducer;
