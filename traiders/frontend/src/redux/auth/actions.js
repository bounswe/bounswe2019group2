import { API } from '../apiConfig';
import { PostWithUrlBody } from '../../common/http/httpUtil';

/* Action Types */

const SAVE_USER = 'SAVE_USER';

export const actionTypes = {
  SAVE_USER
};

/* Action Creators */

function saveUser(user) {
  return {
    type: SAVE_USER,
    payload: user
  };
}

export const actionCreators = {
  saveUser
};

/* Api Call Functions */

export const loginUser = (body) => {
  return (dispatch) => {
    PostWithUrlBody(`${API}/token`, body)
      .then((response) => {
        if (response.status === 200) {
          dispatch(saveUser(response));
        }
      })
      // eslint-disable-next-line no-console
      .catch((error) => console.log('Error while logging\n', error));
  };
};

export const postUserRegister = (body) => {
  return () => {
    PostWithUrlBody(`${API}/users`, body)
      .then((response) => {
        if (response.status === 200) {
          // eslint-disable-next-line no-console
          console.log('Successful registration');
        }
      })
      // eslint-disable-next-line no-console
      .catch((error) => console.log('Error when fetch register\n', error));
  };
};
