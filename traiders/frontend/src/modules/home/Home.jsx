import React from 'react';

import './home.scss';
import Page from '../../components/page/Page';
import CurrencyTable from '../../components/currencyTable/CurrencyTableContainer';
import ArticleList from '../../components/articleList/ArticleListContainer';

const Home = () => {
  return (
    <Page>
      <div className="home-container">
        <CurrencyTable />
        <ArticleList />
      </div>
    </Page>
  );
};

export default Home;
