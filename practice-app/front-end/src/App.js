import React, { Component } from "react";
import { connect } from "react-redux";
import BaseLayout from "./components/BaseLayout";
import { Switch, Route } from "react-router-dom";

import HomePage from "./pages/homepage";
import Investments from "./pages/investments";
import Login from "./pages/login";
import Register from "./pages/register";

class App extends Component {
  render() {
    return (
      <BaseLayout>
        <Switch>
          <Route exact path="/" render={() => this.renderHomepage()} />
          <Route exact path="/homepage" component={HomePage} />
          <Route exact path="/investments" component={Investments} />
          <Route exact path="/register" component={Register} />
          <Route exact path="/login" component={Login} />
        </Switch>
      </BaseLayout>
    );
  }

  renderHomepage() {
    return <div>Hello</div>;
  }
}

const mapStateToProps = state => ({
  user: state.auth.user
});
export default connect(
  mapStateToProps,
  null
)(App);
