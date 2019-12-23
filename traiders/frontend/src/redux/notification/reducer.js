import { actionTypes } from './actions';

const initialState = {
  notificationList: null
};

function notificationReducer(state = initialState, action) {
  switch (action.type) {
    case actionTypes.SAVE_NOTIFICATION:
      return {
        ...state,
        notificationList: action.payload
      };

    case actionTypes.CLEAR_NOTIFICATION:
      return {
        notificationList: null
      };
    default:
      return state;
  }
}

export default notificationReducer;
