import { connect } from 'react-redux';

import Search from './Search';
import { getSearchResult } from '../../redux/search/actions';

const mapStateToProps = (state) => {
  return {
    searchResult: state.search.searchResult
  };
};

const mapDispatchToProps = {
  getSearchResult
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(Search);
