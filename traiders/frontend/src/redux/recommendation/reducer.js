import { actionTypes } from './actions';

const initialState = {
  recommendationResult: null
};

function recommendationReducer(state = initialState, action) {
  switch (action.type) {
    case actionTypes.SAVE_RECOMMENDATION_RESULT:
      return {
        ...state,
        recommendationResult: action.payload
      };

    case actionTypes.CLEAR_RESULT_DATA:
      return {
        recommendationResult: null
      };
    default:
      return state;
  }
}

export default recommendationReducer;
