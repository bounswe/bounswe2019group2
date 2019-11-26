import { actionTypes } from './actions';

const initialState = {
  manualInvestments: null,
  onlineInvestments: null,
  assets: null,
  currencyList: null,
  profitLossList: null,
  buyOrderList: null,
  stopLossOrderList: null
};

function investmentReducer(state = initialState, action) {
  switch (action.type) {
    case actionTypes.SAVE_MANUAL_INVESTMENT_LIST:
      return {
        ...state,
        manualInvestments: action.payload
      };
    case actionTypes.SAVE_ONLINE_INVESTMENT_LIST:
      return {
        ...state,
        onlineInvestments: action.payload
      };
    case actionTypes.SAVE_ASSETS_LIST:
      return {
        ...state,
        assets: action.payload
      };
    case actionTypes.SAVE_CURRENCY_LIST:
      return {
        ...state,
        currencyList: action.payload
      };
    case actionTypes.SAVE_PROFIT_LOSS_LIST:
      return {
        ...state,
        profitLossList: action.payload
      };
    case actionTypes.SAVE_BUY_ORDER_LIST:
      return {
        ...state,
        buyOrderList: action.payload
      };
    case actionTypes.SAVE_STOP_LOSS_ORDER_LIST:
      return {
        ...state,
        stopLossOrderList: action.payload
      };
    default:
      return state;
  }
}

export default investmentReducer;
