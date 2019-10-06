/* eslint-disable */
import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import { Router, Route } from 'react-router-dom';
import createBrowserHistory from 'history/createBrowserHistory';
import ReduxStore from './common/ReduxStore';
import './index.scss';

import Routes from './routing';

const rootElement = document.getElementById('root'); // eslint-disable-line no-undef

// eslint-disable-next-line import/prefer-default-export
export const history = createBrowserHistory({
  basename: 'traider-frontend'
});

ReactDOM.render(
  <Provider store={ReduxStore.store}>
    <Router history={history}>
      <Route component={Routes} />
    </Router>
  </Provider>,
  rootElement
);
