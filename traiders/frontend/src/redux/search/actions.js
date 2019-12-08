import { API } from '../apiConfig';
import { GetWithUrl } from '../../common/http/httpUtil';

/* Action Types */

const SAVE_SEARCH_RESULT = 'SAVE_SEARCH_RESULT';
const CLEAR_RESULT_DATA = 'CLEAR_RESULT_DATA';

export const actionTypes = {
  SAVE_SEARCH_RESULT,
  CLEAR_RESULT_DATA
};

/* Action Creators */

function saveSearchResult(result) {
  return {
    type: SAVE_SEARCH_RESULT,
    payload: result
  };
}

function clearResultData() {
  return {
    type: CLEAR_RESULT_DATA
  };
}

export const actionCreators = {
  saveSearchResult
};

/* Api Call Functions */

export const getSearchResult = (searchContent) => {
  return (dispatch) => {
    dispatch(clearResultData);
    GetWithUrl(`${API}/search?keyword=${searchContent}`)
      .then((response) =>
        response.json().then((res) => dispatch(saveSearchResult(res)))
      )
      // eslint-disable-next-line no-console
      .catch((error) =>
        console.log('Error while fetching search result\n', error)
      );
  };
};
