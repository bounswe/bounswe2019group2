import { API } from '../apiConfig';
import { GetWithAuthorization } from '../../common/http/httpUtil';

/* Action Types */

const SAVE_RECOMMENDATION_RESULT = 'SAVE_RECOMMENDATION_RESULT';
const CLEAR_RESULT_DATA = 'CLEAR_RESULT_DATA';

export const actionTypes = {
  SAVE_RECOMMENDATION_RESULT,
  CLEAR_RESULT_DATA
};

/* Action Creators */

function saveRecommendationResult(result) {
  return {
    type: SAVE_RECOMMENDATION_RESULT,
    payload: result
  };
}

function clearResultData() {
  return {
    type: CLEAR_RESULT_DATA
  };
}

export const actionCreators = {
  saveRecommendationResult
};

/* Api Call Functions */

export const getRecommendationResult = (token) => {
  return (dispatch) => {
    dispatch(clearResultData);
    GetWithAuthorization(`${API}/recommendation`, token)
      .then((response) =>
        response.json().then((res) => dispatch(saveRecommendationResult(res)))
      )

      .catch((error) =>
        // eslint-disable-next-line no-console
        console.log('Error while fetching search result\n', error)
      );
  };
};
