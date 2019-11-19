import React, { Component } from 'react';
import { Table, Button, Modal, Select, Input } from 'antd';

import history from '../../common/history';
import './my-investments.scss';
import { investmentsTableColumns } from '../../common/constants/generalConstants';

const { Option } = Select;

class MyInvestments extends Component {
  constructor(props) {
    super(props);
    this.state = {
      visibleManual: false,
      visibleOnline: false,
      // manualCurrency: 'TRY',
      // onlineCurrency: 'TRY'
      manualAmount: null,
      onlineAmount: null
    };
  }

  componentDidMount() {
    const { getInvestments, user } = this.props;
    getInvestments(1, user.key);
  }

  menu = (list) => {
    return list.map((element, index) => (
      // eslint-disable-next-line react/no-array-index-key
      <Option key={index} value={element}>
        {element}
      </Option>
    ));
  };

  handleManual = () => {
    this.setState({
      visibleManual: true
    });
  };

  handleOkManual = () => {
    // eslint-disable-next-line

    this.setState({
      visibleManual: false
    });
  };

  handleCancelManual = () => {
    this.setState({
      visibleManual: false
    });
  };

  handleOnline = () => {
    this.setState({
      visibleOnline: true
    });
  };

  handleOkOnline = () => {
    // eslint-disable-next-line

    this.setState({
      visibleOnline: false
    });
  };

  handleCancelOnline = () => {
    this.setState({
      visibleOnline: false
    });
  };

  render() {
    const { user } = this.props;
    const {
      visibleManual,
      visibleOnline,
      manualAmount,
      onlineAmount
    } = this.state;
    if (!user) {
      history.push('/login');
    }
    return (
      <div className="investment-part">
        <div className="investments-table">
          <Table
            columns={investmentsTableColumns}
            dataSource={[]}
            bordered
            title={() => 'MY INVESTMENTS'}
          />
        </div>
        <div className="make-investment">
          <div className="manual-investment">
            <Button type="primary" onClick={this.handleManual}>
              Manual Investment
            </Button>
          </div>
          <div className="online-investment">
            <Button type="primary" onClick={this.handleOnline}>
              Online Investment
            </Button>
          </div>
        </div>
        <Modal
          title="MAKE MANUAL INVESTMENT"
          visible={visibleManual}
          onOk={this.handleOkManual}
          onCancel={this.handleCancelManual}
        >
          <div className="modal">
            <Input
              placeholder="Please enter the amount"
              type="number"
              value={manualAmount}
              onChange={this.changeValue}
            />
            <Select
              defaultValue="TRY"
              onChange={this.handleSelectCurrency}
              style={{ width: 120 }}
            >
              {/* eslint-disable-next-line no-use-before-define */}
              {this.menu(currencyList)}
            </Select>
          </div>
        </Modal>
        <Modal
          title="MAKE ONLINE INVESTMENT"
          visible={visibleOnline}
          onOk={this.handleOkOnline}
          onCancel={this.handleCancelOnline}
        >
          <div className="modal">
            <Input
              placeholder="Please enter the amount"
              type="number"
              value={onlineAmount}
              onChange={this.changeValue}
            />
            <Select
              defaultValue="TRY"
              onChange={this.handleSelectCurrency}
              style={{ width: 120 }}
            >
              {/* eslint-disable-next-line no-use-before-define */}
              {this.menu(currencyList)}
            </Select>
          </div>
        </Modal>
      </div>
    );
  }
}

export default MyInvestments;
const currencyList = ['TRY', 'EUR', 'USD'];
