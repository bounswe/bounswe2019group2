/* eslint-disable */
import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import { Router, Route } from 'react-router-dom';

import ReduxStore from './common/ReduxStore';
import './index.scss';
import history from './common/history';

import Routes from './routing';

const rootElement = document.getElementById('root'); // eslint-disable-line no-undef

ReactDOM.render(
  <Provider store={ReduxStore.store}>
    <Router history={history}>
      <Route component={Routes} />
    </Router>
  </Provider>,
  rootElement
);
