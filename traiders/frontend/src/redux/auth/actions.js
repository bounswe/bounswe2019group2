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
      .then((response) => {
        if (response.status === 201) {
          response.json().then((res) => dispatch(saveUser(res)));
        }
      })

      // eslint-disable-next-line no-console
      .catch((error) => console.log('Error while logging\n', error));
  };
};

export const postUserRegister = (body) => {
  return () => {
    PostWithUrlBody(`${API}/users/`, body)
      // eslint-disable-next-line
      .then(alert('Successfully registered'))

      .catch((error) =>
        // eslint-disable-next-line no-console
        console.log('Error when fetch register\n', error)
      );
  };
};
