const SAVE_USER = "SAVE_USER";

export const types = {
  SAVE_USER
};

const saveUser = user => ({
  type: SAVE_USER,
  payload: { user }
});

export const actionCreators = {
  saveUser
};

//API

const getUser = userConfig => (dispatch, getState, xmlService) => {
  return xmlService
    .fetch({
      path: "",
      method: "GET",
      body: userConfig
    })
    .then(res => dispatch(saveUser(res)))
    .catch(err => Promise.reject(err));
};

const signUpUser = userConfig => (dispatch, getState, xmlService) => {
  return xmlService
    .fetch({
      path: "",
      method: "POST",
      body: userConfig
    })
    .then(res => dispatch(saveUser(userConfig)))
    .catch(err => Promise.reject(err));
};

export const api = {
  getUser,
  signUpUser
};
