import { API } from '../apiConfig';
import { PostWithUrlBody } from '../../common/http/httpUtil';

/* Action Types */

const SAVE_USER = 'SAVE_USER';
const LOGOUT = 'LOGOUT';

export const actionTypes = {
  SAVE_USER,
  LOGOUT
};

/* Action Creators */

function saveUser(user) {
  return {
    type: SAVE_USER,
    payload: user
  };
}

export function logout() {
  return {
    type: LOGOUT
  };
}

export const actionCreators = {
  saveUser,
  logout
};

/* Api Call Functions */

export const loginUser = (body) => {
  return (dispatch) => {
    PostWithUrlBody(`${API}/token/`, body)
      .then((response) => response.json())
      .then((response) => dispatch(saveUser(response)))
      // eslint-disable-next-line no-console
      .catch((error) => console.log('Error while logging\n', error));
  };
};

export const postUserRegister = (body) => {
  return () => {
    PostWithUrlBody(`${API}/users/`, body)
      // eslint-disable-next-line
      .then(alert('Successfully registered'))
      // eslint-disable-next-line no-console
      .catch((error) => console.log('Error when fetch register\n', error));
  };
};
