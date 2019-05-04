import * as userActionManager from "../userDetails/actions";

const initialState = {
  investmentList: []
};

const userReducer = (state = initialState, action) => {
  switch (action.type) {
    case userActionManager.types.SAVE_INVESTMENTS:
      return {
        ...state,
        investmentList: action.payload.investmentList
      };
    default:
      return state;
  }
};

export default userReducer;
