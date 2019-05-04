import * as authActionManager from "../auth/actions";

const initialState = {
  user: null
};

const authReducer = (state = initialState, action) => {
  switch (action.type) {
    case authActionManager.types.SAVE_USER:
      return {
        ...state,
        user: action.payload.user
      };
    default:
      return state;
  }
};

export default authReducer;
