import { actionTypes } from './actions';

const initialState = {
  parityList: []
};

function successReducer(state = initialState, action) {
  switch (action.type) {
    case actionTypes.SAVE_PARITY_LIST:
      return {
        ...state,
        parityList: action.payload
      };
    default:
      return state;
  }
}

export default successReducer;
