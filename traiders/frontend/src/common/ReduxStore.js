import { createStore, applyMiddleware } from 'redux';
import { composeWithDevTools } from 'redux-devtools-extension/developmentOnly';
import ReduxThunk from 'redux-thunk';
import { persistReducer } from 'redux-persist';
import storage from 'redux-persist/lib/storage';

import rootReducer from './rootReducer';

const persistConfig = {
  key: 'root',
  storage
};

const persistedReducer = persistReducer(persistConfig, rootReducer);

class ReduxStore {
  constructor() {
    this.store = createStore(
      persistedReducer,
      composeWithDevTools(applyMiddleware(ReduxThunk))
    );
  }
}

export default new ReduxStore();
