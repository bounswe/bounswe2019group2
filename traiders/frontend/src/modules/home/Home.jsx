import React from 'react';

import './home.scss';
import Page from '../../components/page/Page';
import CurrencyTable from '../../components/currencyTable/CurrencyTableContainer';
import ArticleList from '../../components/articleList/ArticleListContainer';

const Home = (props) => {
  const { history } = props;

  return (
    <Page>
      <div className="home-container">
        <CurrencyTable />
        <ArticleList history={history} />
      </div>
    </Page>
  );
};

export default Home;
