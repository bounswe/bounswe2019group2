import React, { Component } from 'react';
import { Table, Button, Modal, Select, Input, Checkbox } from 'antd';

import './my-orders.scss';
import {
  buyOrderTableColumns,
  stopLossOrderTableColumns
} from '../../common/constants/generalConstants';
import history from '../../common/history';
import { API } from '../../redux/apiConfig';
import { PostWithAuthorization } from '../../common/http/httpUtil';

const { Option } = Select;

class MyOrders extends Component {
  render() {
    return (
      <div className="order-container">
        <div className="buy-order-container">
          <div className="buy-order-table">
            <Table
              columns={buyOrderTableColumns}
              dataSource={newManualInvestmentList}
              bordered
              title={() => 'BUY ORDERS'}
              rowKey="id"
            />
          </div>
        </div>
        <div className="stop-loss-order-container">
          <div className="stop-loss-order-table">
            <Table
              columns={stopLossOrderTableColumns}
              dataSource={newManualInvestmentList}
              bordered
              title={() => 'MANUAL INVESTMENTS'}
              rowKey="id"
            />
          </div>
        </div>
      </div>
    );
  }
}

export default MyOrders;
