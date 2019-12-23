import React, { Component } from 'react';
import { Table, Button, Modal, Select, Input } from 'antd';

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
  constructor() {
    super();
    this.state = {
      visibleBuyOrder: false,
      visibleStopLossOrder: false,
      buyBaseCurrency: 'TRY',
      buyTargetCurrency: 'TRY',
      buyOrderRatio: null,
      buyOrderAmount: null,
      stopBaseCurrency: 'TRY',
      stopTargetCurrency: 'TRY',
      stopOrderRatio: null,
      stopOrderAmount: null
    };
  }

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

  handleBuyOrder = () => {
    this.setState({
      visibleBuyOrder: true
    });
  };

  handleOkBuyOrder = () => {
    const {
      buyBaseCurrency,
      buyTargetCurrency,
      buyOrderRatio,
      buyOrderAmount
    } = this.state;

    const { user, getBuyOrders } = this.props;
    const url = `${API}/buyorder/`;
    const body = {
      base_equipment: buyBaseCurrency,
      target_equipment: buyTargetCurrency,
      buy_ratio: buyOrderRatio,
      buy_amount: buyOrderAmount
    };
    if (
      buyBaseCurrency &&
      buyTargetCurrency &&
      buyOrderAmount &&
      buyOrderRatio
    ) {
      PostWithAuthorization(url, body, user.key)
        .then((response) => {
          if (response.status !== 201) {
            response.json().then((res) => alert(res));
          } else {
            alert('Success');
          }
        })
        .catch(() => alert('error while adding buy order'));

      setTimeout(() => getBuyOrders(user.key), 1000);
    }

    this.setState({
      visibleBuyOrder: false
    });
  };

  handleCancelBuyOrder = () => {
    this.setState({
      visibleBuyOrder: false
    });
  };

  handleSellOrder = () => {
    this.setState({
      visibleStopLossOrder: true
    });
  };

  handleOkSellOrder = () => {
    const {
      stopBaseCurrency,
      stopTargetCurrency,
      stopOrderRatio,
      stopOrderAmount
    } = this.state;
    const { user, getStopLossOrders } = this.props;
    const url = `${API}/stoplossorder/`;
    const body = {
      base_equipment: stopBaseCurrency,
      target_equipment: stopTargetCurrency,
      sell_ratio: stopOrderRatio,
      sell_amount: stopOrderAmount
    };
    PostWithAuthorization(url, body, user.key)
      .then((response) => {
        if (response.status !== 201) {
          response.json().then((res) => alert(res));
        } else {
          alert('Success');
        }
      })
      .catch(() => alert('error while adding stop loss order'));

    setTimeout(() => getStopLossOrders(user.key), 1000);

    this.setState({
      visibleStopLossOrder: false
    });
  };

  handleCancelSellOrder = () => {
    this.setState({
      visibleStopLossOrder: false
    });
  };

  handleSelectCurrency = (name, value) => {
    this.setState({
      [name]: value
    });
  };

  changeValue = (event) => {
    const { name, value } = event.target;
    this.setState({
      [name]: value
    });
  };

  render() {
    const { user, buyOrders, stopLossOrders, currencyList } = this.props;
    const {
      visibleBuyOrder,
      visibleStopLossOrder,
      buyOrderRatio,
      buyOrderAmount,
      stopOrderRatio,
      stopOrderAmount
    } = this.state;
    if (!user) {
      history.push('/login');
    }

    const filteredList = [];
    if (currencyList) {
      currencyList.forEach((element) => {
        filteredList.push(element.symbol);
      });
    }
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
          <div className="button">
            <Button type="primary" onClick={this.handleBuyOrder}>
              Buy Order
            </Button>
          </div>
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
          <div className="button">
            <Button type="primary" onClick={this.handleSellOrder}>
              Stop Loss Order
            </Button>
          </div>
        </div>
        <Modal
          title="ADD BUY ORDER"
          visible={visibleBuyOrder}
          onOk={this.handleOkBuyOrder}
          onCancel={this.handleCancelBuyOrder}
        >
          <div className="modal">
            <div className="base-equipment">
              Buy from this:
              <Select
                defaultValue="TRY"
                onChange={(value) =>
                  this.handleSelectCurrency('buyTargetCurrency', value)
                }
                style={{ width: 120 }}
              >
                {this.menu(filteredList)}
              </Select>
            </div>
            <div className="target-equipment">
              Spend from this:
              <Select
                defaultValue="TRY"
                onChange={(value) =>
                  this.handleSelectCurrency('buyBaseCurrency', value)
                }
                style={{ width: 120 }}
              >
                {/* eslint-disable-next-line no-use-before-define */}
                {this.menu(filteredList)}
              </Select>
            </div>
            <div className="credit-card">
              <div className="cc-number">
                <Input
                  placeholder="Buy Ratio"
                  type="number"
                  name="buyOrderRatio"
                  value={buyOrderRatio}
                  onChange={this.changeValue}
                />
              </div>
              <div className="cc-date">
                <Input
                  placeholder="Buy Amount"
                  name="buyOrderAmount"
                  value={buyOrderAmount}
                  onChange={this.changeValue}
                />
              </div>
            </div>
          </div>
        </Modal>
        <Modal
          title="ADD STOP LOSS ORDER"
          visible={visibleStopLossOrder}
          onOk={this.handleOkSellOrder}
          onCancel={this.handleCancelSellOrder}
        >
          <div className="modal">
            <div className="base-equipment">
              Sell from this:
              <Select
                defaultValue="TRY"
                onChange={(value) =>
                  this.handleSelectCurrency('stopTargetCurrency', value)
                }
                style={{ width: 120 }}
              >
                {this.menu(filteredList)}
              </Select>
            </div>
            <div className="target-equipment">
              Buy from this:
              <Select
                defaultValue="TRY"
                onChange={(value) =>
                  this.handleSelectCurrency('stopBaseCurrency', value)
                }
                style={{ width: 120 }}
              >
                {this.menu(filteredList)}
              </Select>
            </div>
            <div className="credit-card">
              <div className="cc-number">
                <Input
                  placeholder="Sell Ratio"
                  type="number"
                  name="stopOrderRatio"
                  value={stopOrderRatio}
                  onChange={this.changeValue}
                />
              </div>
              <div className="cc-date">
                <Input
                  placeholder="Sell Amount"
                  name="stopOrderAmount"
                  value={stopOrderAmount}
                  onChange={this.changeValue}
                />
              </div>
            </div>
          </div>
        </Modal>
      </div>
    );
  }
}

export default MyOrders;
