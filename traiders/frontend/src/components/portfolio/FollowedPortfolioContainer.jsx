import { connect } from 'react-redux';

import Portfolio from './FollowedPortfolio';
import { getPortfoliosUserFollowedWithAuthorization } from '../../redux/portfolio/actions';

const mapStateToProps = (state) => {
  return {
    user: state.user.currentUser,
    portfolioList: state.portfolio.followedPortfolioList
  };
};

const mapDispatchToProps = {
  getPortfoliosUserFollowedWithAuthorization
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Portfolio);
