import { API } from '../apiConfig';
import {
  PostWithUrlBody,
  GetWithUrl,
  DeleteWithAuthorization
} from '../../common/http/httpUtil';

/* Action Types */

const SAVE_USER = 'SAVE_USER';
const SAVE_FOLLOWERS = 'SAVE_FOLLOWERS';
const SAVE_FOLLOWINGS = 'SAVE_FOLLOWINGS';
const LOGOUT = 'LOGOUT';

export const actionTypes = {
  SAVE_USER,
  LOGOUT,
  SAVE_FOLLOWERS,
  SAVE_FOLLOWINGS
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
export function saveFollowers(list) {
  return {
    type: SAVE_FOLLOWERS,
    payload: list
  };
}
export function saveFollowings(list) {
  return {
    type: SAVE_FOLLOWINGS,
    payload: list
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
          response.json().then((res) => {
            dispatch(saveUser(res));
          });
        }
      })

      // eslint-disable-next-line no-console
      .catch((error) => console.log('Error while logging\n', error));
  };
};

export const getFollowers = (id) => {
  return (dispatch) => {
    GetWithUrl(`${API}/following/?user_followed=${id}`)
      .then((response) => {
        if (response.status === 200) {
          response.json().then((res) => dispatch(saveFollowers(res)));
        }
      })
      // eslint-disable-next-line no-console
      .catch((error) => console.log('Error while fetching followers\n', error));
  };
};

export const getFollowings = (id) => {
  return (dispatch) => {
    GetWithUrl(`${API}/following/?user_following=${id}`)
      .then((response) => {
        if (response.status === 200) {
          response.json().then((res) => dispatch(saveFollowings(res)));
        }
      })
      .catch((error) =>
        // eslint-disable-next-line no-console
        console.log('Error while fetching followings\n', error)
      );
  };
};

export const deleteFollowing = (id, token) => {
  const url = `${API}/following/${id}/`;
  return () => {
    DeleteWithAuthorization(url, token)
      .then((response) => {
        if (response.status === 204) {
          // eslint-disable-next-line no-console
          response.json().then((res) => console.log(res));
        }
      })
      // eslint-disable-next-line no-console
      .catch((error) => console.log('Error while unfollowing\n', error));
  };
};

export const postUserRegister = (body) => {
  return () => {
    PostWithUrlBody(`${API}/users/`, body)
      .then((response) => {
        if (response.status === 201) {
          // eslint-disable-next-line
          alert('Succesfully Registered.');
        } // else if (!response.ok) {
        // eslint-disable-next-line
        //response.text().then((text) => alert(text));}
        else {
          // eslint-disable-next-line
          response.json().then((res) => alert(res.type, res.message));
        }
      })

      .catch((error) =>
        // eslint-disable-next-line no-console
        console.log('Error when fetch register\n', error)
      );
  };
};
