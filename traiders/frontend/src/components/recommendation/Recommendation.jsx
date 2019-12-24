import React, { useEffect, useState } from 'react';
import { Button, Table } from 'antd';
import ReactTooltip from 'react-tooltip';

import { SEARCH_RESULTS_TABLES_COLUMNS } from '../../common/constants/generalConstants';
import Page from '../page/Page';
import ArticleRow from '../articleList/ArticleRow';
import history from '../../common/history';
import './recommendation.scss';

const Recommendation = ({
  getRecommendationResult,
  recommendationResult,
  user
}) => {
  console.log(recommendationResult);
  if (!user) {
    history.push('/login');
  }
  const [selectedTab, setSelectedTab] = useState('articles');
  const { key } = user;
  useEffect(() => {
    getRecommendationResult(key);
  }, [getRecommendationResult, key]);
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
                  expandedRowRender={(row) => (
                    <p style={{ margin: 0 }}>
                      {row.messages.map((message) => (
                        <div>
                          <p>{message}</p>
                        </div>
                      ))}
                    </p>
                  )}
                />
              )}
              {selectedTab === 'events' && (
                <Table
                  dataSource={recommendationResult.events}
                  columns={SEARCH_RESULTS_TABLES_COLUMNS.eventsTable}
                  bordered
                  rowKey="id"
                  expandedRowRender={(row) => (
                    <p style={{ margin: 0 }}>
                      {row.messages.map((message) => (
                        <div>
                          <p>{message}</p>
                        </div>
                      ))}
                    </p>
                  )}
                />
              )}
              {selectedTab === 'users' && (
                <Table
                  dataSource={recommendationResult.users}
                  columns={SEARCH_RESULTS_TABLES_COLUMNS.usersTable}
                  bordered
                  rowKey="id"
                  onRowClick={(row) => history.push(`/profile/${row.id}`)}
                  expandedRowRender={(row) => (
                    <p style={{ margin: 0 }}>
                      {row.messages.map((message) => (
                        <div>
                          <p>{message}</p>
                        </div>
                      ))}
                    </p>
                  )}
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
                  expandedRowRender={(row) => (
                    <p style={{ margin: 0 }}>
                      {row.messages.map((message) => (
                        <div>
                          <p>{message}</p>
                        </div>
                      ))}
                    </p>
                  )}
                />
              )}
              {selectedTab === 'articles' && (
                <div className="article-list-container">
                  {recommendationResult.articles.map((article) => (
                    <div>
                      <p
                        data-tip={article.messages.join('\n')}
                        data-for="oneArticle"
                      >
                        <ArticleRow article={article} key={article.id} />
                      </p>
                      <ReactTooltip id="oneArticle" className="customeTheme" />
                    </div>
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
