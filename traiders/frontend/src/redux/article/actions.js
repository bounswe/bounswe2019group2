import { API } from '../apiConfig';
import { GetWithUrl } from '../../common/http/httpUtil';

/* Action Types */

const SAVE_ARTICLE_LIST = 'SAVE_ARTICLE_LIST';

export const actionTypes = {
  SAVE_ARTICLE_LIST
};

/* Action Creators */

function saveArticleList(articleList) {
  return {
    type: SAVE_ARTICLE_LIST,
    payload: articleList
  };
}

export const actionCreators = {
  saveArticleList
};

/* Api Call Functions */

export const getArticles = () => {
  return (dispatch) => {
    GetWithUrl(`${API}/articles/`)
      .then((response) => response.json())
      .then((response) => dispatch(saveArticleList(response)))
      // eslint-disable-next-line no-console
      .catch((error) => console.log('Error while fetching articles\n', error));
  };
};
