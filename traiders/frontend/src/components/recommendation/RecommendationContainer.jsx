import { connect } from 'react-redux';

import Recommendation from './Recommendation';
import { getRecommendationResult } from '../../redux/recommendation/actions';

const mapStateToProps = (state) => {
  return {
    recommendationResult: state.recommendation.recommendationResult,
    user: state.user.currentUser
  };
};

const mapDispatchToProps = {
  getRecommendationResult
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Recommendation);
