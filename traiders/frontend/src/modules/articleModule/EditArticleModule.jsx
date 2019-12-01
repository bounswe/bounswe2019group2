import React from 'react';

import Page from '../../components/page/Page';
import EditArticle from '../../components/editArticle/EditArticleContainer';

const EditArticleModule = (props) => {
  const { match } = props;

  return (
    <Page>
      <EditArticle id={match.params.id} />
    </Page>
  );
};

export default EditArticleModule;
