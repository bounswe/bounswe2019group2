import { API } from '../apiConfig';
import { GetWithAuthorization } from '../../common/http/httpUtil';

/* Action Types */

const SAVE_PREDICTION_LIST = 'SAVE_PREDICTION_LIST';

export const actionTypes = {
  SAVE_PREDICTION_LIST
};

/* Action Creators */

function savePredictionList(predictionList) {
  return {
    type: SAVE_PREDICTION_LIST,
    payload: predictionList
  };
}

export const actionCreator = {
  savePredictionList
};

/* Api Call Functions */

export const getPredictions = (base, target, token) => {
  return (dispatch) => {
    GetWithAuthorization(
      `${API}/prediction/?base_equipment=${base}&target_equipment=${target},`,
      token
    )
      .then((response) => response.json())
      .then((response) => dispatch(savePredictionList(response)))
      // eslint-disable-next-line no-console
      .catch((error) => console.log('Error while fetching parities\n', error));
  };
};
