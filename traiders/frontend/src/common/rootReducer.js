import { combineReducers } from 'redux';
import { reducer as formReducer } from 'redux-form';

// eslint-disable-next-line
import userReducer from '../redux/auth/reducer';
import parityReducer from '../redux/parities/reducer';

const rootReducer = combineReducers({
  form: formReducer,
  user: userReducer,
  parity: parityReducer
});

export default rootReducer;
