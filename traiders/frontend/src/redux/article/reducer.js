import { actionTypes } from './actions';

const initialState = {
  articleList: [],
  currentArticle: null,
  author: null
};

function articleReducer(state = initialState, action) {
  switch (action.type) {
    case actionTypes.SAVE_ARTICLE_LIST:
      return {
        ...state,
        articleList: action.payload
      };
    case actionTypes.SAVE_SINGLE_ARTICLE:
      return {
        ...state,
        currentArticle: action.payload
      };

    case actionTypes.SAVE_ARTICLE_AUTHOR:
      return {
        ...state,
        author: action.payload
      };
    default:
      return state;
  }
}

export default articleReducer;
