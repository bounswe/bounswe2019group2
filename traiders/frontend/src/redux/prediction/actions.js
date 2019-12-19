import { API } from '../apiConfig';
import { GetWithAuthorization } from '../../common/http/httpUtil';

/* Action Types */

const SAVE_PREDICTION_LIST = 'SAVE_PREDICTION_LIST';
const CLEAR_PREDICTION_DATA = 'CLEAR_PREDICTION_DATA';

export const actionTypes = {
  SAVE_PREDICTION_LIST,
  CLEAR_PREDICTION_DATA
};

/* Action Creators */

function clearPredictionData() {
  return {
    type: CLEAR_PREDICTION_DATA
  };
}

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
    dispatch(clearPredictionData());
    GetWithAuthorization(
      `${API}/prediction/?base_equipment=${target}&target_equipment=${base}`,
      token
    )
      .then((response) => response.json())
      .then((response) => dispatch(savePredictionList(response)))
      // eslint-disable-next-line no-console
      .catch((error) => console.log('Error while fetching parities\n', error));
  };
};
