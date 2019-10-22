import { actionTypes } from './actions';

const initialState = {
  currentUser: null
};

function userReducer(state = initialState, action) {
  switch (action.type) {
    case actionTypes.SAVE_USER:
      return {
        ...state,
        currentUser: action.payload
      };
    case actionTypes.LOGOUT:
      return {
        ...state,
        currentUser: null
      };
    default:
      return state;
  }
}

export default userReducer;
