import { actionTypes } from './actions';

const initialState = {
  articleList: [],
  currentArticle: null,
  author: null,
  commentsList: null,
  currentComment: null,
  annotationList: null
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
    case actionTypes.SAVE_ARTICLE_COMMENTS:
      return {
        ...state,
        commentsList: action.payload
      };
    case actionTypes.SAVE_SINGLE_COMMENT:
      return {
        ...state,
        currentComment: action.payload
      };
    case actionTypes.CLEAR_ARTICLE_DATA:
      return {
        ...state,
        currentArticle: null,
        commentsList: null
      };
    case actionTypes.SAVE_ARTICLE_ANNOTATIONS:
      return {
        ...state,
        annotationList: action.payload
      };
    case actionTypes.CLEAR_ARTICLE_ANNOTATIONS:
      return {
        ...state,
        annotationList: null
      };

    default:
      return state;
  }
}

export default articleReducer;
