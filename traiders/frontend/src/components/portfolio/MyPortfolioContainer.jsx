import { connect } from 'react-redux';

import Portfolio from './MyPortfolio';
import { getCurrencyList } from '../../redux/investments/actions';
import {
  getPortfoliosUserOwnsWithAuthorization,
  getPortfolio,
  getPortfolioEquipments
} from '../../redux/portfolio/actions';
const mapStateToProps = (state) => {
  return {
    user: state.user.currentUser,
    currencyList: state.investment.currencyList,
    portfolioList: state.portfolio.portfolioList,
    portfolioItemList: state.portfolio.portfolioItemList,
    currentPortfolio: state.portfolio.currentPortfolio
  };
};

const mapDispatchToProps = {
  getCurrencyList,
  getPortfoliosUserOwnsWithAuthorization,
  getPortfolio,
  getPortfolioEquipments
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Portfolio);
