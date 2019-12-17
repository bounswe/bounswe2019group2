import React, { useEffect, useState } from 'react';
import { Button, Table } from 'antd';

import { SEARCH_RESULTS_TABLES_COLUMNS } from '../../common/constants/generalConstants';
import Page from '../../components/page/Page';
import ArticleRow from '../articleList/ArticleRow';
import history from '../../common/history';
import './recommendation.scss';

const Recommendation = ({
  searchContent,
  getRecommendationResult,
  recommendationResult
}) => {
  const [selectedTab, setSelectedTab] = useState('articles');
  searchContent = 'TR';
  useEffect(() => {
    getRecommendationResult(searchContent);
  }, [getRecommendationResult, searchContent]);

  const parities =
    recommendationResult &&
    recommendationResult.parities.map((parity) => ({
      ...parity,
      date: `${parity.date.substring(0, 10)} ${parity.date.substring(11, 19)}`
    }));

  return (
    <Page>
      <div className="search-result-container">
        {recommendationResult ? (
          <div className="search-result-single-table">
            <div className="tab-buttons">
              <Button onClick={() => setSelectedTab('articles')}>
                ARTICLES
              </Button>
              <Button onClick={() => setSelectedTab('equipments')}>
                EQUIPMENTS
              </Button>
              <Button onClick={() => setSelectedTab('parities')}>
                PARITIES
              </Button>
              <Button onClick={() => setSelectedTab('events')}>EVENTS</Button>
              <Button onClick={() => setSelectedTab('users')}>USERS</Button>
            </div>
            <div className="search-result-table">
              {selectedTab === 'equipments' && (
                <Table
                  dataSource={recommendationResult.equipments}
                  columns={SEARCH_RESULTS_TABLES_COLUMNS.equipmentsTable}
                  bordered
                  rowKey="id"
                  onRowClick={(row) => history.push(`/equipment/${row.symbol}`)}
                />
              )}
              {selectedTab === 'events' && (
                <Table
                  dataSource={recommendationResult.events}
                  columns={SEARCH_RESULTS_TABLES_COLUMNS.eventsTable}
                  bordered
                  rowKey="id"
                />
              )}
              {selectedTab === 'users' && (
                <Table
                  dataSource={recommendationResult.users}
                  columns={SEARCH_RESULTS_TABLES_COLUMNS.usersTable}
                  bordered
                  rowKey="id"
                  onRowClick={(row) => history.push(`/profile/${row.id}`)}
                />
              )}
              {selectedTab === 'parities' && (
                <Table
                  dataSource={parities}
                  columns={SEARCH_RESULTS_TABLES_COLUMNS.paritiesTable}
                  bordered
                  rowKey="id"
                  onRowClick={(row) =>
                    history.push(
                      `/parity/${row.base_equipment.symbol}/${row.target_equipment.symbol}`
                    )
                  }
                />
              )}
              {selectedTab === 'articles' && (
                <div className="article-list-container">
                  {recommendationResult.articles.map((article) => (
                    <ArticleRow article={article} key={article.id} />
                  ))}
                </div>
              )}
            </div>
          </div>
        ) : (
          'Loading'
        )}
      </div>
    </Page>
  );
};

export default Recommendation;
