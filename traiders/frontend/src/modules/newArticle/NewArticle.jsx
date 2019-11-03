import React from 'react';

import AddArticle from '../../components/addArticle/AddArticleModule';
import Page from '../../components/page/Page';

const NewArticle = () => {
  return (
    <Page>
      {/* TODO add breadcrumb here */}
      <AddArticle />
    </Page>
  );
};

export default NewArticle;
