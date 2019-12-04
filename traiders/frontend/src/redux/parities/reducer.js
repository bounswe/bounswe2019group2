import { actionTypes } from './actions';

const initialState = {
  parityList: [],
  limitedParityList: [],
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
    case actionTypes.SAVE_LIMITED_PARITY_LIST:
      return {
        ...state,
        limitedParityList: action.payload
      };
    case actionTypes.CLEAR_PARITY_DATA:
      return {
        ...state,
        oneParity: null
      };

    default:
      return state;
  }
}

export default parityReducer;
