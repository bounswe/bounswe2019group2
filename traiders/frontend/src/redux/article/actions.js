import { API, ANNOTATION_URL } from '../apiConfig';
import { GetWithUrl, GetWithAuthorization } from '../../common/http/httpUtil';

/* Action Types */

const SAVE_ARTICLE_LIST = 'SAVE_ARTICLE_LIST';
const SAVE_SINGLE_ARTICLE = 'SAVE_SINGLE_ARTICLE';
const SAVE_ARTICLE_AUTHOR = 'SAVE_ARTICLE_AUTHOR';
const SAVE_ARTICLE_COMMENTS = 'SAVE_ARTICLE_COMMENTS';
const SAVE_SINGLE_COMMENT = 'SAVE_SINGLE_COMMENT';
const CLEAR_ARTICLE_DATA = 'CLEAR_ARTICLE_DATA';
const SAVE_ARTICLE_ANNOTATIONS = 'SAVE_ARTICLE_ANNOTATIONS';
const CLEAR_ARTICLE_ANNOTATIONS = 'CLEAR_ARTICLE_ANNOTATIONS';

export const actionTypes = {
  SAVE_ARTICLE_LIST,
  SAVE_SINGLE_ARTICLE,
  SAVE_ARTICLE_AUTHOR,
  SAVE_ARTICLE_COMMENTS,
  SAVE_SINGLE_COMMENT,
  CLEAR_ARTICLE_DATA,
  SAVE_ARTICLE_ANNOTATIONS,
  CLEAR_ARTICLE_ANNOTATIONS
};

/* Action Creators */

function clearArticleAnnotations() {
  return {
    type: CLEAR_ARTICLE_ANNOTATIONS
  };
}

function saveArticleAnnotations(annotationList) {
  return {
    type: SAVE_ARTICLE_ANNOTATIONS,
    payload: annotationList
  };
}

function clearArticleData() {
  return {
    type: CLEAR_ARTICLE_DATA
  };
}

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

function saveSingleComment(comment) {
  return {
    type: SAVE_SINGLE_COMMENT,
    payload: comment
  };
}

function saveArticleAuthor(user) {
  return {
    type: SAVE_ARTICLE_AUTHOR,
    payload: user
  };
}

function saveArticleComments(commentsList) {
  return {
    type: SAVE_ARTICLE_COMMENTS,
    payload: commentsList
  };
}

export const actionCreators = {
  saveArticleList,
  saveSingleArticle,
  saveArticleAuthor,
  saveArticleComments,
  saveSingleComment,
  saveArticleAnnotations,
  clearArticleAnnotations
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

export const getArticleAnnotations = () => {
  return (dispatch) => {
    dispatch(clearArticleAnnotations());
    GetWithUrl(`${ANNOTATION_URL}`)
      .then((response) => response.json())
      .then((response) => dispatch(saveArticleAnnotations(response)))
      // eslint-disable-next-line no-console
      .catch((error) =>
        // eslint-disable-next-line no-console
        console.log('Error while fetching annotations\n', error)
      );
  };
};

export const getArticleWithAuthorization = (id, token) => {
  return (dispatch) => {
    dispatch(clearArticleData());
    GetWithAuthorization(`${API}/articles/${id}/`, token)
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

export const getArticle = (id) => {
  return (dispatch) => {
    dispatch(clearArticleData());
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

export const getComment = (id) => {
  return (dispatch) => {
    GetWithUrl(`${API}/comments/article/${id}/`)
      .then((response) => {
        if (response.status === 200) {
          response.json().then((res) => {
            return dispatch(saveSingleComment(res));
          });
        }
      })
      // eslint-disable-next-line no-console
      .catch((error) => console.log('Error while fetching comment\n', error));
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

export const getArticleComments = (id) => {
  return (dispatch) => {
    GetWithUrl(`${API}/comments/article/?article=${id}`)
      .then((response) => {
        if (response.status === 200) {
          response.json().then((res) => dispatch(saveArticleComments(res)));
        }
      })

      .catch((error) =>
        // eslint-disable-next-line no-console
        console.log('Error while fetching article comments\n', error)
      );
  };
};

export const getArticleCommentsWithAuthorization = (id, token) => {
  return (dispatch) => {
    dispatch(clearArticleData());
    GetWithAuthorization(`${API}/comments/article/?article=${id}`, token)
      .then((response) => {
        if (response.status === 200) {
          response.json().then((res) => {
            return dispatch(saveArticleComments(res));
          });
        }
      })
      // eslint-disable-next-line no-console
      .catch((error) => console.log('Error while fetching article\n', error));
  };
};
