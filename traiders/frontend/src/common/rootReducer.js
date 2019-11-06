import { combineReducers } from 'redux';
import { reducer as formReducer } from 'redux-form';

// eslint-disable-next-line
import userReducer from '../redux/auth/reducer';
import parityReducer from '../redux/parities/reducer';
import articleReducer from '../redux/article/reducer';
import eventsReducer from '../redux/events/reducer';

const rootReducer = combineReducers({
  form: formReducer,
  user: userReducer,
  parity: parityReducer,
  article: articleReducer,
  events: eventsReducer
});

export default rootReducer;
