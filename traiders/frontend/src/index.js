/* eslint-disable */
import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import { Router, Route } from 'react-router-dom';
import { persistStore } from 'redux-persist';
import { PersistGate } from 'redux-persist/integration/react';

import ReduxStore from './common/ReduxStore';
import './index.scss';
import history from './common/history';

import Routes from './routing';

const rootElement = document.getElementById('root'); // eslint-disable-line no-undef
const persistor = persistStore(ReduxStore.store);

ReactDOM.render(
  <Provider store={ReduxStore.store}>
    <PersistGate loading={null} persistor={persistor}>
      <Router history={history}>
        <Route component={Routes} />
      </Router>
    </PersistGate>
  </Provider>,
  rootElement
);
