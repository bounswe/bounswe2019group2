import { API } from '../apiConfig';
import { GetWithAuthorization } from '../../common/http/httpUtil';

/* Action Types */

const SAVE_INVESTMENT_LIST = 'SAVE_INVESTMENT_LIST';

export const actionTypes = {
  SAVE_INVESTMENT_LIST
};

/* Action Creators */

function saveInvestmentList(list) {
  return {
    type: SAVE_INVESTMENT_LIST,
    payload: list
  };
}

export const actionCreators = {
  saveInvestmentList
};

/* Api Call Functions */

export const getInvestments = (id) => {
  return (dispatch) => {
    GetWithAuthorization(`${API}/investment/?id=${id}`)
      .then((response) => response.json())
      .then((response) => dispatch(saveInvestmentList(response)))

      .catch((error) =>
        // eslint-disable-next-line no-console
        console.log('Error while fetching investments\n', error)
      );
  };
};
