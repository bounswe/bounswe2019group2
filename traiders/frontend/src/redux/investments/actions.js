import { API } from '../apiConfig';
import { GetWithAuthorization, GetWithUrl } from '../../common/http/httpUtil';

/* Action Types */

const SAVE_INVESTMENT_LIST = 'SAVE_INVESTMENT_LIST';
const SAVE_ASSETS_LIST = 'SAVE_ASSETS_LIST';
const SAVE_CURRENCY_LIST = 'SAVE_CURRENCY_LIST';

export const actionTypes = {
  SAVE_INVESTMENT_LIST,
  SAVE_ASSETS_LIST,
  SAVE_CURRENCY_LIST
};

/* Action Creators */

function saveInvestmentList(list) {
  return {
    type: SAVE_INVESTMENT_LIST,
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
  saveInvestmentList,
  saveAssetList,
  saveCurrencyList
};

/* Api Call Functions */

export const getInvestments = (id, token) => {
  return (dispatch) => {
    GetWithAuthorization(`${API}/investment/?id=${id}`, token)
      .then((response) => response.json())
      .then((response) => dispatch(saveInvestmentList(response)))

      .catch((error) =>
        // eslint-disable-next-line no-console
        console.log('Error while fetching investments\n', error)
      );
  };
};

export const getAssets = (id, token) => {
  return (dispatch) => {
    GetWithAuthorization(`${API}/asset/?id=${id}`, token)
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
        console.log('Error while fetching assets\n', error)
      );
  };
};
