import React from 'react';

import Search from '../../components/search/SearchContainer';
import Page from '../../components/page/Page';

const SearchModule = (props) => {
  const { match } = props;
  const { content } = match.params;
  return (
    <Page>
      <Search searchContent={content} />
    </Page>
  );
};

export default SearchModule;
