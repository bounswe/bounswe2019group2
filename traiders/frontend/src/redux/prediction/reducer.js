import { actionTypes } from './actions';

const initialState = {
  predictionList: []
};

function predictionReducer(state = initialState, action) {
  switch (action.type) {
    case actionTypes.CLEAR_PREDICTION_DATA:
      return {
        ...state,
        predictionList: []
      };
    case actionTypes.SAVE_PREDICTION_LIST:
      return {
        ...state,
        predictionList: action.payload
      };

    default:
      return state;
  }
}

export default predictionReducer;
