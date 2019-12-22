import { API } from '../apiConfig';
import { GetWithAuthorization } from '../../common/http/httpUtil';

/* Action Types */

const SAVE_NOTIFICATION = 'SAVE_NOTIFICATION';
const CLEAR_NOTIFICATION = 'CLEAR_NOTIFICATION';

export const actionTypes = {
  SAVE_NOTIFICATION,
  CLEAR_NOTIFICATION
};

/* Action Creators */

function saveNotifications(result) {
  return {
    type: SAVE_NOTIFICATION,
    payload: result
  };
}

function clearNotifications() {
  return {
    type: CLEAR_NOTIFICATION
  };
}

export const actionCreators = {
  saveNotifications
};

/* Api Call Functions */

export const getNotifications = (token) => {
  return (dispatch) => {
    dispatch(clearNotifications);
    GetWithAuthorization(`${API}/notification`, token)
      .then((response) =>
        response.json().then((res) => dispatch(saveNotifications(res)))
      )

      .catch((error) =>
        // eslint-disable-next-line no-console
        console.log('Error while fetching notifications\n', error)
      );
  };
};
