import { actionTypes } from './actions';

const initialState = {
  searchResult: null
};

function searchReducer(state = initialState, action) {
  switch (action.type) {
    case actionTypes.SAVE_SEARCH_RESULT:
      return {
        ...state,
        searchResult: action.payload
      };

    default:
      return state;
  }
}

export default searchReducer;
