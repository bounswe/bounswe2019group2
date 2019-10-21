import { API } from '../apiConfig';
import { GetWithUrl } from '../../common/http/httpUtil';

/* Action Types */

const SAVE_PARITY_LIST = 'SAVE_PARITY_LIST';

export const actionTypes = {
  SAVE_PARITY_LIST
};

/* Action Creators */

function saveParityList(parityList) {
  return {
    type: SAVE_PARITY_LIST,
    payload: parityList
  };
}

export const actionCreator = {
  saveParityList
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
