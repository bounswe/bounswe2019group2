import { actionTypes } from './actions';

const initialState = {
  currentUser: null,
  followers: null,
  followings: null,
  otherUser: null
};

function userReducer(state = initialState, action) {
  switch (action.type) {
    case actionTypes.SAVE_USER:
      return {
        ...state,
        currentUser: action.payload
      };
    case actionTypes.SAVE_OTHER_USER:
      return {
        ...state,
        otherUser: action.payload
      };
    case actionTypes.LOGOUT:
      return {
        ...state,
        currentUser: null
      };
    case actionTypes.CLEAR_OTHER_USER:
      return {
        ...state,
        otherUser: null
      };
    case actionTypes.SAVE_FOLLOWINGS:
      return {
        ...state,
        followings: action.payload
      };
    case actionTypes.SAVE_FOLLOWERS:
      return {
        ...state,
        followers: action.payload
      };

    default:
      return state;
  }
}

export default userReducer;
