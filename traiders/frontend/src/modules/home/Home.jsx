import React from 'react';

import './home.scss';
import Page from '../../components/page/Page';
import CurrencyTable from '../../components/currencyTable/CurrencyTableContainer';
import ArticleList from '../../components/articleList/ArticleListContainer';

const Home = (props) => {
  const { history } = props;
  const articleLimit = 6;
  return (
    <Page>
      <div className="home-container">
        <CurrencyTable />
        <ArticleList limit={articleLimit} history={history} />
      </div>
    </Page>
  );
};

export default Home;
