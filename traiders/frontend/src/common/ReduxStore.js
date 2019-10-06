import { createStore, applyMiddleware } from 'redux';
import { composeWithDevTools } from 'redux-devtools-extension/developmentOnly';
import ReduxThunk from 'redux-thunk';

import rootReducer from './rootReducer';

class ReduxStore {
  constructor() {
    this.store = createStore(
      rootReducer,
      composeWithDevTools(applyMiddleware(ReduxThunk))
    );
  }
}

export default new ReduxStore();
