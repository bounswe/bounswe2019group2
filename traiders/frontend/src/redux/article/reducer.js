import { actionTypes } from './actions';

const initialState = {
  articleList: []
};

function articleReducer(state = initialState, action) {
  switch (action.type) {
    case actionTypes.SAVE_ARTICLE_LIST:
      return {
        ...state,
        articleList: action.payload
      };
    default:
      return state;
  }
}

export default articleReducer;
