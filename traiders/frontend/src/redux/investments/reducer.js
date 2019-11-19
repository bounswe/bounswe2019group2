import { actionTypes } from './actions';

const initialState = {
  investments: null,
  assets: null,
  currencyList: null
};

function investmentReducer(state = initialState, action) {
  switch (action.type) {
    case actionTypes.SAVE_INVESTMENT_LIST:
      return {
        ...state,
        investments: action.payload
      };
    case actionTypes.SAVE_ASSETS_LIST:
      return {
        ...state,
        assets: action.payload
      };
    case actionTypes.SAVE_CURRENCY_LIST:
      return {
        ...state,
        currencyList: action.payload
      };
    default:
      return state;
  }
}

export default investmentReducer;
