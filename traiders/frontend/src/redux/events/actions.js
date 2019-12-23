import { API } from '../apiConfig';
import { GetWithUrl, GetWithAuthorization } from '../../common/http/httpUtil';

/* Action Types */
const CLEAR_EVENTS_LIST = 'CLEAR_EVENTS_LIST';
const SAVE_EVENTS_LIST = 'SAVE_EVENTS_LIST';

export const actionTypes = {
  SAVE_EVENTS_LIST,
  CLEAR_EVENTS_LIST
};

/* Action Creators */

function saveEventsList(eventsList) {
  return {
    type: SAVE_EVENTS_LIST,
    payload: eventsList
  };
}

function clearEventsList() {
  return {
    type: CLEAR_EVENTS_LIST
  };
}
export const actionCreators = {
  saveEventsList,
  clearEventsList
};

/* Api Call Functions */

export const getEvents = () => {
  return (dispatch) => {
    dispatch(clearEventsList());
    GetWithUrl(`${API}/events/`)
      .then((response) => response.json())
      .then((res) => dispatch(saveEventsList(res)))
      // eslint-disable-next-line no-console
      .catch((error) => console.log('Error while fetching events\n', error));
  };
};

export const getEventsWithAuthorization = (token) => {
  return (dispatch) => {
    dispatch(clearEventsList());
    GetWithAuthorization(`${API}/events/`, token)
      .then((response) => {
        if (response.status === 200) {
          response.json().then((res) => {
            return dispatch(saveEventsList(res));
          });
        }
      })
      // eslint-disable-next-line no-console
      .catch((error) => console.log('Error while fetching events\n', error));
  };
};
