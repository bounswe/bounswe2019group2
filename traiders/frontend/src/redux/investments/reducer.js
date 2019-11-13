import { actionTypes } from './actions';

const initialState = {
  investments: null
};

function investmentReducer(state = initialState, action) {
  switch (action.type) {
    case actionTypes.SAVE_INVESTMENT_LIST:
      return {
        ...state,
        investments: action.payload
      };

    default:
      return state;
  }
}

export default investmentReducer;
