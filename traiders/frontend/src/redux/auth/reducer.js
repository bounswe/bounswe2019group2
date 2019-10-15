import { actionTypes } from './actions';

const initialState = {
  currentUser: null
};

function userReducer(state = initialState, action) {
  switch (action.type) {
    case actionTypes.SAVE_USER:
      return {
        ...state,
        user: action.payload
      };
    default:
      return state;
  }
}

export default userReducer;
