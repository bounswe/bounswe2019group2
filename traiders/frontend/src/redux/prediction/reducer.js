import { actionTypes } from './actions';

const initialState = {
  predictionList: []
};

function predictionReducer(state = initialState, action) {
  switch (action.type) {
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
