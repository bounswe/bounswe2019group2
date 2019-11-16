import { API } from '../apiConfig';
import { GetWithUrl } from '../../common/http/httpUtil';

/* Action Types */

const SAVE_PARITY_LIST = 'SAVE_PARITY_LIST';
const SAVE_CURRENCY_LIST = 'SAVE_CURRENCY_LIST';
const SAVE_ONE_PARITY = 'SAVE_ONE_PARITY';

export const actionTypes = {
  SAVE_PARITY_LIST,
  SAVE_ONE_PARITY,
  SAVE_CURRENCY_LIST
};

/* Action Creators */

function saveCurrencyList(currencyList) {
  return {
    type: SAVE_CURRENCY_LIST,
    payload: currencyList
  };
}

function saveParityList(parityList) {
  return {
    type: SAVE_PARITY_LIST,
    payload: parityList
  };
}
function saveOneParity(oneParity) {
  return {
    type: SAVE_ONE_PARITY,
    payload: oneParity
  };
}

export const actionCreator = {
  saveParityList,
  saveOneParity,
  saveCurrencyList
};

/* Api Call Functions */

export const getParities = () => {
  return (dispatch) => {
    GetWithUrl(`${API}/parity/latest/`)
      .then((response) => response.json())
      .then((response) => dispatch(saveParityList(response)))
      // eslint-disable-next-line no-console
      .catch((error) => console.log('Error while fetching parities\n', error));
  };
};

export const getOneParity = (base, target) => {
  return (dispatch) => {
    GetWithUrl(
      `${API}/parity/?base_equipment=${base}&target_equipment=${target}`
    )
      .then((response) => response.json())
      .then((response) => dispatch(saveOneParity(response)))
      // eslint-disable-next-line no-console
      .catch((error) => console.log('Error while fetching parities\n', error));
  };
};

export const getCurrencies = () => {
  return (dispatch) => {
    GetWithUrl('https://finans.apipara.com/json/v7//converter')
      .then((response) => response.json())
      .then((response) =>
        dispatch(saveCurrencyList(response.response.currency))
      )

      .catch((error) =>
        // eslint-disable-next-line no-console
        console.log('Error while fetching currencies\n', error)
      );
  };
};
