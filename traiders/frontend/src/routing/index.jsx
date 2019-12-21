import React, { Component, Suspense } from 'react';
import { Route, Switch } from 'react-router-dom';

import Home from '../modules/home/Home';
import Login from '../modules/auth/login/LoginContainer';
import Register from '../modules/auth/register/RegisterContainer';
import UserProfile from '../components/userProfile/UserProfileContainer';
import ChangePassword from '../components/changePassword/ChangePassword';
import Article from '../modules/articleModule/ArticleModule';
import NewArticle from '../modules/newArticle/NewArticle';
import Social from '../modules/social/Social';
import bomUtil from '../common/utils/bomUtil';
import UserProfileUpdate from '../components/userProfileUpdate/UserProfileUpdate';
import ParityPage from '../components/parityPage/ParityPageContainer';
import EditArticle from '../modules/articleModule/EditArticleModule';
import Portfolio from '../components/portfolio/Portfolios';
import EquipmentPage from '../components/equipmentPage/EquipmentPageContainer';
import Investments from '../modules/investments/InvestmentsModule';
import OtherUser from '../components/otherUser/OtherUserContainer';
import SearchModule from '../modules/searchModule/SearchModule';
import Recommendation from '../components/recommendation/RecommendationContainer';

const ACTION_TYPE = {
  PUSH: 'PUSH',
  POP: 'POP'
};

class Routes extends Component {
  constructor(props) {
    super(props);

    const { history } = props;
    this.unsubscribeFromHistory = history.listen(this.handleLocationChange);
    this.handleLocationChange();
  }

  componentWillUnmount() {
    if (this.unsubscribeFromHistory) {
      this.unsubscribeFromHistory();
    }
  }

  handleLocationChange = () => {
    const { history, location } = this.props;
    const { action } = history;
    const { hash } = location;

    /*
     NOTE: React router does not update scroll position after transitioning to another route.
     This block scrolls to the beginning of the page after switching to new route.
     */
    if (!hash && action === ACTION_TYPE.PUSH) {
      bomUtil.scrollToTop();
    }
  };

  render = () => {
    return (
      <Suspense>
        <Switch>
          <Route exact path="/" component={Home} />
          <Route exact path="/profile" component={UserProfile} />
          <Route exact path="/profile/:id" component={OtherUser} />
          <Route path="/updateprofile" component={UserProfileUpdate} />
          <Route path="/changepassword" component={ChangePassword} />
          <Route path="/login" component={Login} />
          <Route path="/register" component={Register} />
          <Route exact path="/parity/:target/:base" component={ParityPage} />
          <Route path="/articles/:id" component={Article} />
          <Route exact path="/equipment/:base" component={EquipmentPage} />
          <Route path="/article/edit/:id" component={EditArticle} />
          <Route path="/create-article" component={NewArticle} />
          <Route path="/social" component={Social} />
          <Route path="/portfolios" component={Portfolio} />
          <Route path="/investments" component={Investments} />
          <Route path="/recommendations" component={Recommendation} />
          <Route exact path="/search/:content" component={SearchModule} />
          <Route render={() => <h1>404 Page not found</h1>} />
        </Switch>
      </Suspense>
    );
  };
}

export default Routes;
