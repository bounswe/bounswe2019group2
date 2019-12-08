import { API } from '../apiConfig';
import { GetWithUrl } from '../../common/http/httpUtil';

/* Action Types */

const SAVE_SEARCH_RESULT = 'SAVE_SEARCH_RESULT';

export const actionTypes = {
  SAVE_SEARCH_RESULT
};

/* Action Creators */

function saveSearchResult(result) {
  return {
    type: SAVE_SEARCH_RESULT,
    payload: result
  };
}

export const actionCreators = {
  saveSearchResult
};

/* Api Call Functions */

export const getSearchResult = (searchContent) => {
  return (dispatch) => {
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
