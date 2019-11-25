import { actionTypes } from './actions';

const initialState = {
  parityList: [],
  currencyList: [],
  oneParity: null
};

function parityReducer(state = initialState, action) {
  switch (action.type) {
    case actionTypes.SAVE_PARITY_LIST:
      return {
        ...state,
        parityList: action.payload
      };
    case actionTypes.SAVE_ONE_PARITY:
      return {
        ...state,
        oneParity: action.payload
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

export default parityReducer;
