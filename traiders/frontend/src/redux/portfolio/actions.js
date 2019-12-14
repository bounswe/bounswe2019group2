import { API } from '../apiConfig';
import { GetWithUrl, GetWithAuthorization } from '../../common/http/httpUtil';

/* Action Types */

const SAVE_PORTFOLIO_LIST = 'SAVE_PORTFOLIO_LIST';
const SAVE_PORTFOLIO_ITEM = 'SAVE_PORTFOLIO_ITEM';
const CLEAR_PORTFOLIO_DATA = 'CLEAR_PORTFOLIO_DATA';
const SAVE_SINGLE_PORTFOLIO = 'SAVE_SINGLE_PORTFOLIO';
const SAVE_PORTFOLIOS_FOLLOWED_LIST = 'SAVE_PORTFOLIOS_FOLLOWED_LIST';
export const actionTypes = {
  SAVE_PORTFOLIO_LIST,
  SAVE_SINGLE_PORTFOLIO,
  SAVE_PORTFOLIO_ITEM,
  SAVE_PORTFOLIOS_FOLLOWED_LIST,
  CLEAR_PORTFOLIO_DATA
};

/* Action Creators */

function clearPortfolioData() {
  return {
    type: CLEAR_PORTFOLIO_DATA
  };
}

function savePortfolioFollowed(followedPortfolioList) {
  return {
    type: SAVE_PORTFOLIOS_FOLLOWED_LIST,
    payload: followedPortfolioList
  };
}

function savePortfolioList(portfolioList) {
  return {
    type: SAVE_PORTFOLIO_LIST,
    payload: portfolioList
  };
}

function saveSinglePortfolio(portfolio) {
  return {
    type: SAVE_SINGLE_PORTFOLIO,
    payload: portfolio
  };
}

function savePortfolioItems(portfolioItemList) {
  return {
    type: SAVE_PORTFOLIO_ITEM,
    payload: portfolioItemList
  };
}

export const actionCreators = {
  saveSinglePortfolio,
  savePortfolioList,
  savePortfolioItems,
  savePortfolioFollowed
};

/* Api Call Functions */

export const getPortfoliosUserFollowedWithAuthorization = (id, token) => {
  return (dispatch) => {
    dispatch(clearPortfolioData());
    GetWithAuthorization(`${API}/portfolio/?followed_by=${id}`, token)
      .then((response) => {
        if (response.status === 200) {
          response.json().then((res) => {
            return dispatch(savePortfolioFollowed(res));
          });
        }
      })
      // eslint-disable-next-line no-console
      .catch((error) =>
        console.log('Error while fetching portfolios\n', error)
      );
  };
};
export const getPortfolio = (id) => {
  return (dispatch) => {
    dispatch(clearPortfolioData());
    GetWithUrl(`${API}/portfolio/${id}/`)
      .then((response) => {
        if (response.status === 200) {
          response.json().then((res) => {
            return dispatch(saveSinglePortfolio(res));
          });
        }
      })
      // eslint-disable-next-line no-console
      .catch((error) => console.log('Error while fetching portfolio\n', error));
  };
};
export const getPortfoliosUserOwnsWithAuthorization = (id, token) => {
  return (dispatch) => {
    dispatch(clearPortfolioData());
    GetWithAuthorization(`${API}/portfolio/?user=${id}`, token)
      .then((response) => {
        if (response.status === 200) {
          response.json().then((res) => {
            return dispatch(savePortfolioList(res));
          });
        }
      })
      // eslint-disable-next-line no-console
      .catch((error) =>
        console.log('Error while fetching portfolios\n', error)
      );
  };
};
export const getPortfolioEquipments = (id) => {
  return (dispatch) => {
    GetWithUrl(`${API}/portfolioitem/?portfolio=${id}`)
      .then((response) => {
        if (response.status === 200) {
          response.json().then((res) => dispatch(savePortfolioItems(res)));
        }
      })

      .catch((error) =>
        // eslint-disable-next-line no-console
        console.log('Error while fetching portfolio equipments\n', error)
      );
  };
};
