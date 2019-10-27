import React from 'react';
// import { Breadcrumb } from 'antd';
// import { Link } from 'react-router-dom';

import Article from '../../components/article/ArticleContainer';
import Page from '../../components/page/Page';

const ArticleModule = (props) => {
  const { match } = props;
  return (
    <Page>
      {/* TODO add breadcrumb here */}
      <Article id={match.params.id} />
    </Page>
  );
};

export default ArticleModule;
