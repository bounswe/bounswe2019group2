import { actionTypes } from './actions';

const initialState = {
  portfolioList: null,
  currentPortfolio: null,
  portfolioItemList: null,
  followedPortfolioList: null
};

function portfolioReducer(state = initialState, action) {
  switch (action.type) {
    case actionTypes.SAVE_PORTFOLIO_LIST:
      return {
        ...state,
        portfolioList: action.payload
      };
    case actionTypes.SAVE_SINGLE_PORTFOLIO:
      return {
        ...state,
        currentPortfolio: action.payload
      };
    case actionTypes.SAVE_PORTFOLIO_ITEM:
      return {
        ...state,
        portfolioItemList: action.payload
      };
    case actionTypes.SAVE_PORTFOLIOS_FOLLOWED_LIST:
      return {
        ...state,
        followedPortfolioList: action.payload
      };
    default:
      return state;
  }
}

export default portfolioReducer;
