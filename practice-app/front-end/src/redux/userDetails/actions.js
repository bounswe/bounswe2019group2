const SAVE_INVESTMENTS = "SAVE_INVESTMENTS";

export const types = {
  SAVE_INVESTMENTS
};

const saveInvestments = investmentList => ({
  type: SAVE_INVESTMENTS,
  payload: investmentList
});

export const actionCreators = {
  saveInvestments
};

const addInvestment = investmentConfig => (dispatch, getState, xmlService) => {
  return xmlService
    .fetch({
      path: "",
      method: "POST",
      body: investmentConfig
    })
    .then(res => dispatch(getInvestments()))
    .catch(err => Promise.reject(err));
};

const deleteInvestment = investment => (dispatch, getState, xmlService) => {
  return xmlService
    .fetch({
      path: "",
      method: "GET",
      body: investment
    })
    .then(res => dispatch(getInvestments()))
    .catch(err => Promise.reject(err));
};

const getInvestments = userConfig => (dispatch, getState, xmlService) => {
  return xmlService
    .fetch({
      path: "",
      method: "GET",
      body: userConfig
    })
    .then(res => dispatch(saveInvestments(res)))
    .catch(err => Promise.reject(err));
};

export const api = {
  getInvestments,
  deleteInvestment,
  addInvestment
};
