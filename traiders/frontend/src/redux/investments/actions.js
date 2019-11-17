import { API } from '../apiConfig';
import { GetWithAuthorization } from '../../common/http/httpUtil';

/* Action Types */

const SAVE_INVESTMENT_LIST = 'SAVE_INVESTMENT_LIST';
const SAVE_ASSETS_LIST = 'SAVE_ASSETS_LIST';

export const actionTypes = {
  SAVE_INVESTMENT_LIST,
  SAVE_ASSETS_LIST
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

export const actionCreators = {
  saveInvestmentList,
  saveAssetList
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
      .then((response) => dispatch(saveInvestmentList(response)))

      .catch((error) =>
        // eslint-disable-next-line no-console
        console.log('Error while fetching assets\n', error)
      );
  };
};
