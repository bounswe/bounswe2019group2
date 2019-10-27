import { API } from '../apiConfig';
import { GetWithUrl } from '../../common/http/httpUtil';

/* Action Types */

const SAVE_ARTICLE_LIST = 'SAVE_ARTICLE_LIST';
const SAVE_SINGLE_ARTICLE = 'SAVE_SINGLE_ARTICLE';
const SAVE_ARTICLE_AUTHOR = 'SAVE_ARTICLE_AUTHOR';

export const actionTypes = {
  SAVE_ARTICLE_LIST,
  SAVE_SINGLE_ARTICLE,
  SAVE_ARTICLE_AUTHOR
};

/* Action Creators */

function saveArticleList(articleList) {
  return {
    type: SAVE_ARTICLE_LIST,
    payload: articleList
  };
}

function saveSingleArticle(article) {
  return {
    type: SAVE_SINGLE_ARTICLE,
    payload: article
  };
}

function saveArticleAuthor(user) {
  return {
    type: SAVE_ARTICLE_AUTHOR,
    payload: user
  };
}

export const actionCreators = {
  saveArticleList,
  saveSingleArticle,
  saveArticleAuthor
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

export const getArticle = (id) => {
  return (dispatch) => {
    GetWithUrl(`${API}/articles/${id}/`)
      .then((response) => {
        if (response.status === 200) {
          response.json().then((res) => {
            return dispatch(saveSingleArticle(res));
          });
        }
      })
      // eslint-disable-next-line no-console
      .catch((error) => console.log('Error while fetching article\n', error));
  };
};

export const getArticleAuthor = (url) => {
  return (dispatch) => {
    GetWithUrl(url)
      .then((response) => {
        if (response.status === 200) {
          response.json().then((res) => dispatch(saveArticleAuthor(res)));
        }
      })

      .catch((error) =>
        // eslint-disable-next-line no-console
        console.log('Error while fetching author owner\n', error)
      );
  };
};
