import { actionTypes } from './actions';

const initialState = {
  eventsList: null
};

function eventsReducer(state = initialState, action) {
  switch (action.type) {
    case actionTypes.SAVE_EVENTS_LIST:
      return {
        ...state,
        eventsList: action.payload
      };
    default:
      return state;
  }
}

export default eventsReducer;
