import React, { Component } from 'react';
import { Table, Button, Modal, Select, Input, Checkbox } from 'antd';

import './my-orders.scss';
import history from '../../common/history';
import { API } from '../../redux/apiConfig';
import { PostWithAuthorization } from '../../common/http/httpUtil';
import {
  buyOrderTableColumns,
  stopLossOrderTableColumns
} from '../../common/constants/generalConstants';

const { Option } = Select;

class MyOrders extends Component {
  componentDidMount() {
    const {
      getBuyOrders,
      getStopLossOrders,
      user,
      getCurrencyList
    } = this.props;
    if (user) {
      getBuyOrders(user.key);
      getStopLossOrders(user.key);
    }
    getCurrencyList();
  }

  menu = (list) => {
    return list.map((element, index) => (
      // eslint-disable-next-line react/no-array-index-key
      <Option key={index} value={element}>
        {element}
      </Option>
    ));
  };

  render() {
    const { user, buyOrders, stopLossOrders, currencyList } = this.props;
    if (!user) {
      history.push('/login');
    }

    const filteredList = [];
    currencyList.forEach((element) => {
      filteredList.push(element.code);
    });
    return (
      <div className="orders-container">
        <div className="buy-order-container">
          <div className="table">
            <Table
              columns={buyOrderTableColumns}
              dataSource={buyOrders}
              bordered
              title={() => 'BUY ORDERS'}
              rowKey="id"
            />
          </div>
          <div className="button"></div>
        </div>
        <div className="stop-loss-order-container">
          <div className="table">
            <Table
              columns={stopLossOrderTableColumns}
              dataSource={stopLossOrders}
              bordered
              title={() => 'STOP LOSS ORDERS'}
              rowKey="id"
            />
          </div>
          <div className="button"></div>
        </div>
      </div>
    );
  }
}

export default MyOrders;
