import { combineReducers } from 'redux';
import { reducer as formReducer } from 'redux-form';

// eslint-disable-next-line
import userReducer from '../redux/auth/reducer';

const rootReducer = combineReducers({
  form: formReducer,
  user: userReducer
});

export default rootReducer;
