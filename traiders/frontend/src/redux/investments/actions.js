import { API } from '../apiConfig';
import { GetWithAuthorization, GetWithUrl } from '../../common/http/httpUtil';

/* Action Types */

const SAVE_MANUAL_INVESTMENT_LIST = 'SAVE_MANUAL_INVESTMENT_LIST';
const SAVE_ONLINE_INVESTMENT_LIST = 'SAVE_ONLINE_INVESTMENT_LIST';
const SAVE_ASSETS_LIST = 'SAVE_ASSETS_LIST';
const SAVE_CURRENCY_LIST = 'SAVE_CURRENCY_LIST';
const SAVE_BUY_ORDER_LIST = 'SAVE_BUY_ORDER_LIST';
const SAVE_STOP_LOSS_ORDER_LIST = 'SAVE_STOP_LOSS_ORDER_LIST';

export const actionTypes = {
  SAVE_MANUAL_INVESTMENT_LIST,
  SAVE_ONLINE_INVESTMENT_LIST,
  SAVE_ASSETS_LIST,
  SAVE_CURRENCY_LIST,
  SAVE_BUY_ORDER_LIST,
  SAVE_STOP_LOSS_ORDER_LIST
};

/* Action Creators */

function saveBuyOrderList(list) {
  return {
    type: SAVE_BUY_ORDER_LIST,
    payload: list
  };
}

function saveStopLossOrderList(list) {
  return {
    type: SAVE_STOP_LOSS_ORDER_LIST,
    payload: list
  };
}

function saveManualInvestmentList(list) {
  return {
    type: SAVE_MANUAL_INVESTMENT_LIST,
    payload: list
  };
}

function saveOnlineInvestmentList(list) {
  return {
    type: SAVE_ONLINE_INVESTMENT_LIST,
    payload: list
  };
}

function saveAssetList(list) {
  return {
    type: SAVE_ASSETS_LIST,
    payload: list
  };
}

function saveCurrencyList(list) {
  return {
    tyoe: SAVE_CURRENCY_LIST,
    payload: list
  };
}

export const actionCreators = {
  saveManualInvestmentList,
  saveOnlineInvestmentList,
  saveAssetList,
  saveCurrencyList
};

/* Api Call Functions */

export const getManualInvestments = (token) => {
  return (dispatch) => {
    GetWithAuthorization(`${API}/manualinvestment/`, token)
      .then((response) => response.json())
      .then((response) => dispatch(saveManualInvestmentList(response)))

      .catch((error) =>
        // eslint-disable-next-line no-console
        console.log('Error while fetching manual investments\n', error)
      );
  };
};

export const getBuyOrders = (token) => {
  return (dispatch) => {
    GetWithAuthorization(`${API}/buyorder/`, token)
      .then((response) => response.json())
      .then((response) => dispatch(saveBuyOrderList(response)))

      .catch((error) =>
        // eslint-disable-next-line no-console
        console.log('Error while fetching buy orders\n', error)
      );
  };
};

export const getStopLossOrders = (token) => {
  return (dispatch) => {
    GetWithAuthorization(`${API}/stoplossorder/`, token)
      .then((response) => response.json())
      .then((response) => dispatch(saveStopLossOrderList(response)))

      .catch((error) =>
        // eslint-disable-next-line no-console
        console.log('Error while fetching stop-loss orders\n', error)
      );
  };
};

export const getOnlineInvestments = (token) => {
  return (dispatch) => {
    GetWithAuthorization(`${API}/onlineinvestment/`, token)
      .then((response) => response.json())
      .then((response) => dispatch(saveOnlineInvestmentList(response)))

      .catch((error) =>
        // eslint-disable-next-line no-console
        console.log('Error while fetching  online investments\n', error)
      );
  };
};

export const getAssets = (token) => {
  return (dispatch) => {
    GetWithAuthorization(`${API}/asset/`, token)
      .then((response) => response.json())
      .then((response) => dispatch(saveAssetList(response)))

      .catch((error) =>
        // eslint-disable-next-line no-console
        console.log('Error while fetching assets\n', error)
      );
  };
};

export const getCurrencyList = () => {
  return (dispatch) => {
    GetWithUrl(`${API}/equipment/?category=currency`)
      .then((response) => response.json())
      .then((response) => dispatch(saveCurrencyList(response)))

      .catch((error) =>
        // eslint-disable-next-line no-console
        console.log('Error while fetching currencyList\n', error)
      );
  };
};
