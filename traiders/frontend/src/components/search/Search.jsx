import React, { useEffect } from 'react';

import './search.scss';

const Search = ({ searchContent, getSearchResult, searchResult }) => {
  useEffect(() => {
    getSearchResult(searchContent);
  }, [getSearchResult, searchContent]);

  console.log(searchResult);

  return (
    <div>
      <div>You have searched for '{searchContent}'</div>
    </div>
  );
};

export default Search;
