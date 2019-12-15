import { API } from '../apiConfig';
import {
  PostWithUrlBody,
  GetWithUrl,
  DeleteWithAuthorization,
  PatchWithAuthorization
} from '../../common/http/httpUtil';

/* Action Types */

const SAVE_USER = 'SAVE_USER';
const SAVE_OTHER_USER = 'SAVE_OTHER_USER';
const SAVE_FOLLOWERS = 'SAVE_FOLLOWERS';
const SAVE_FOLLOWINGS = 'SAVE_FOLLOWINGS';
const LOGOUT = 'LOGOUT';
const CLEAR_OTHER_USER = 'CLEAR_OTHER_USER';

export const actionTypes = {
  SAVE_USER,
  SAVE_OTHER_USER,
  LOGOUT,
  SAVE_FOLLOWERS,
  SAVE_FOLLOWINGS,
  CLEAR_OTHER_USER
};

/* Action Creators */

function saveUser(user) {
  return {
    type: SAVE_USER,
    payload: user
  };
}
function saveOtherUser(user) {
  return {
    type: SAVE_OTHER_USER,
    payload: user
  };
}
function clearOtherUser() {
  return {
    type: CLEAR_OTHER_USER
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
        } else {
          // eslint-disable-next-line no-alert
          alert('Wrong Credentials');
        }
      })

      // eslint-disable-next-line no-console
      .catch((error) => console.log('Error while logging\n', error));
  };
};

export const updateUser = (id, body, token) => {
  return () => {
    PatchWithAuthorization(`${API}/users/${id}`, body, token)
      .then((response) => {
        if (response.status === 200) {
          // eslint-disable-next-line no-console
          response.json().then((res) => console.log(res));
        }
      })
      // eslint-disable-next-line no-console
      .catch((error) => console.log('Error while fetching followers\n', error));
  };
};

export const getOtherUser = (id) => {
  return (dispatch) => {
    dispatch(clearOtherUser());
    GetWithUrl(`${API}/users/${id}`)
      .then((response) => {
        if (response.status === 200) {
          response.json().then((res) => dispatch(saveOtherUser(res)));
        }
      })
      // eslint-disable-next-line no-console
      .catch((error) => console.log('Error while fetching followers\n', error));
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
