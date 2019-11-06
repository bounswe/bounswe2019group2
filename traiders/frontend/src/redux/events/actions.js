import { API } from '../apiConfig';
import { GetWithUrl } from '../../common/http/httpUtil';

/* Action Types */

const SAVE_EVENTS_LIST = 'SAVE_EVENTS_LIST';

export const actionTypes = {
  SAVE_EVENTS_LIST
};

/* Action Creators */

function saveEventsList(eventsList) {
  return {
    type: SAVE_EVENTS_LIST,
    payload: eventsList
  };
}

export const actionCreators = {
  saveEventsList
};

/* Api Call Functions */

export const getEvents = () => {
  return (dispatch) => {
    GetWithUrl(`${API}/events/`)
      .then((response) => response.json())
      .then((res) => dispatch(saveEventsList(res)))
      // eslint-disable-next-line no-console
      .catch((error) => console.log('Error while fetching events\n', error));
  };
};
