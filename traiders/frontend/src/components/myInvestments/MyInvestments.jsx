import React, { Component } from 'react';
import { Table, Button, Modal, Select, Input, Checkbox, Alert } from 'antd';

import history from '../../common/history';
import './my-investments.scss';
import {
  manualInvestmentsTableColumns,
  onlineInvestmentsTableColumns
} from '../../common/constants/generalConstants';
import { API } from '../../redux/apiConfig';
import { PostWithAuthorization } from '../../common/http/httpUtil';

const { Option } = Select;

class MyInvestments extends Component {
  constructor(props) {
    super(props);
    this.state = {
      visibleManual: false,
      manualBaseCurrency: 'TRY',
      manualTargetCurrency: 'TRY',
      manualBaseAmount: null,
      manualTargetAmount: null,
      manualDate: null,
      visibleOnline: false,
      onlineBaseCurrency: 'TRY',
      onlineTargetCurrency: 'TRY',
      onlineBaseAmount: null,
      creditCardNumber: null,
      creditCardValidUntil: null,
      CCV: null,
      isCreditCard: false
    };
  }

  componentDidMount() {
    const {
      getManualInvestments,
      getOnlineInvestments,
      user,
      getCurrencyList,
      getProfitList
    } = this.props;
    if (user) {
      getManualInvestments(user.key);
      getOnlineInvestments(user.key);
      getProfitList(user.key);
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

  handleManual = () => {
    this.setState({
      visibleManual: true
    });
  };

  handleOkManual = () => {
    const {
      manualBaseCurrency,
      manualBaseAmount,
      manualTargetAmount,
      manualTargetCurrency,
      manualDate
    } = this.state;
    const { user, getManualInvestments } = this.props;
    const url = `${API}/manualinvestment/`;
    const body = {
      base_equipment: manualBaseCurrency,
      target_equipment: manualTargetCurrency,
      base_amount: manualBaseAmount,
      target_amount: manualTargetAmount,
      date: manualDate
    };

    PostWithAuthorization(url, body, user.key)
      .then((response) => {
        if (response.status !== 201) {
          response.json().then((res) => alert(res));
        } else {
          alert('Success');
        }
      })
      .catch(() => alert('error while adding manual investment'));

    setTimeout(() => getManualInvestments(user.key), 1000);

    this.setState({
      visibleManual: false
    });
  };

  mergeArrays = (arr1, arr2) => {
    const newList = [];
    arr1.forEach((element, index) =>
      newList.push({ ...element, ...arr2[index] })
    );

    return newList;
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
    const {
      onlineBaseCurrency,
      onlineBaseAmount,
      onlineTargetCurrency,
      creditCardNumber,
      creditCardValidUntil,
      CCV,
      isCreditCard
    } = this.state;
    const { user, getOnlineInvestments } = this.props;
    const url = `${API}/onlineinvestment/`;
    const body = isCreditCard
      ? {
          base_equipment: onlineBaseCurrency,
          target_equipment: onlineTargetCurrency,
          base_amount: onlineBaseAmount,
          credit_card: creditCardNumber,
          credit_card_valid_until: creditCardValidUntil,
          credit_card_ccv: CCV
        }
      : {
          base_equipment: onlineBaseCurrency,
          target_equipment: onlineTargetCurrency,
          base_amount: onlineBaseAmount
        };
    PostWithAuthorization(url, body, user.key)
      .then((response) => {
        if (response.status !== 201) {
          response.json().then((res) => {
            alert(JSON.stringify(res));
          });
        } else {
          alert('Success');
        }
      })
      .catch(() => alert('error while adding online investment'));

    setTimeout(() => getOnlineInvestments(user.key), 1000);

    this.setState({
      visibleOnline: false
    });
  };

  handleCancelOnline = () => {
    this.setState({
      visibleOnline: false
    });
  };

  changeValue = (event) => {
    const { name, value } = event.target;
    this.setState({
      [name]: value
    });
  };

  handleSelectCurrency = (name, value) => {
    this.setState({
      [name]: value
    });
  };

  triggerRadio = () => {
    this.setState((prevState) => {
      return {
        isCreditCard: !prevState.isCreditCard
      };
    });
  };

  render() {
    const {
      user,
      manualInvestments,
      onlineInvestments,
      currencyList,
      profitLossList
    } = this.props;
    const {
      visibleManual,
      visibleOnline,
      manualBaseAmount,
      manualTargetAmount,
      manualDate,
      onlineBaseAmount,
      CCV,
      creditCardNumber,
      creditCardValidUntil,
      isCreditCard
    } = this.state;

    let newManualInvestmentList = [];
    let newOnlineInvestmentList = [];
    if (user && manualInvestments && onlineInvestments && profitLossList) {
      newManualInvestmentList = this.mergeArrays(
        manualInvestments,
        profitLossList.manual_investments
      );

      newOnlineInvestmentList = this.mergeArrays(
        onlineInvestments,
        profitLossList.online_investments
      );
    }

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
      <div className="investment-part">
        <div className="manual-investments">
          <div className="manual-investments-table">
            <Table
              columns={manualInvestmentsTableColumns}
              dataSource={newManualInvestmentList}
              bordered
              title={() => 'MANUAL INVESTMENTS'}
              rowKey="id"
            />
          </div>
          <div className="make-investment">
            <div className="manual-investment">
              <Button type="primary" onClick={this.handleManual}>
                Manual Investment
              </Button>
            </div>
          </div>
        </div>
        <div className="online-investments">
          <div className="online-investments-table">
            <Table
              columns={onlineInvestmentsTableColumns}
              dataSource={newOnlineInvestmentList}
              bordered
              title={() => 'ONLINE INVESTMENTS'}
              rowKey="id"
            />
          </div>
          <div className="make-investment">
            <div className="online-investment">
              <Button type="primary" onClick={this.handleOnline}>
                Online Investment
              </Button>
            </div>
          </div>
        </div>
        <Modal
          title="MAKE MANUAL INVESTMENT"
          visible={visibleManual}
          onOk={this.handleOkManual}
          onCancel={this.handleCancelManual}
        >
          <div className="modal">
            <div className="base-equipment">
              <Input
                placeholder="Spent this amount"
                type="number"
                name="manualBaseAmount"
                value={manualBaseAmount}
                onChange={this.changeValue}
              />
              <Select
                defaultValue="TRY"
                onChange={(value) =>
                  this.handleSelectCurrency('manualBaseCurrency', value)
                }
                style={{ width: 120 }}
              >
                {/* eslint-disable-next-line no-use-before-define */}
                {this.menu(filteredList)}
              </Select>
            </div>
            <div className="target-equipment">
              <Input
                placeholder="Bought this amount"
                type="number"
                name="manualTargetAmount"
                value={manualTargetAmount}
                onChange={this.changeValue}
              />
              <Select
                defaultValue="TRY"
                onChange={(value) =>
                  this.handleSelectCurrency('manualTargetCurrency', value)
                }
                style={{ width: 120 }}
              >
                {/* eslint-disable-next-line no-use-before-define */}
                {this.menu(filteredList)}
              </Select>
            </div>
            <Input
              placeholder="Date (Format: YYYY-MM-DD)"
              name="manualDate"
              value={manualDate}
              onChange={this.changeValue}
            />
          </div>
        </Modal>
        <Modal
          title="MAKE ONLINE INVESTMENT"
          visible={visibleOnline}
          onOk={this.handleOkOnline}
          onCancel={this.handleCancelOnline}
        >
          <div className="modal">
            <div className="base-equipment">
              <Input
                placeholder="Buy this amount"
                type="number"
                name="onlineBaseAmount"
                value={onlineBaseAmount}
                onChange={this.changeValue}
              />
              <Select
                defaultValue="TRY"
                onChange={(value) =>
                  this.handleSelectCurrency('onlineTargetCurrency', value)
                }
                style={{ width: 120 }}
              >
                {/* eslint-disable-next-line no-use-before-define */}
                {this.menu(filteredList)}
              </Select>
            </div>
            <div className="target-equipment-online">
              Spend from this asset:
              <Select
                defaultValue="TRY"
                onChange={(value) =>
                  this.handleSelectCurrency('onlineBaseCurrency', value)
                }
                style={{ width: 120 }}
              >
                {/* eslint-disable-next-line no-use-before-define */}
                {this.menu(filteredList)}
              </Select>
            </div>
            <div className="credit-card-radio">
              <Checkbox onChange={this.triggerRadio}>
                Use Credit Card (Or you can use your assets)
              </Checkbox>
            </div>
            {isCreditCard && (
              <div className="credit-card">
                <div className="cc-number">
                  <Input
                    placeholder="16 Characters Credit Card Number"
                    type="number"
                    name="creditCardNumber"
                    value={creditCardNumber}
                    onChange={this.changeValue}
                  />
                </div>
                <div className="cc-date">
                  <Input
                    placeholder="Valid Until (MM/YY)"
                    name="creditCardValidUntil"
                    value={creditCardValidUntil}
                    onChange={this.changeValue}
                  />
                </div>
                <div className="cc-ccv">
                  <Input
                    placeholder="CCV (3 characters long)"
                    type="number"
                    name="CCV"
                    value={CCV}
                    onChange={this.changeValue}
                  />
                </div>
              </div>
            )}
          </div>
        </Modal>
        {profitLossList && profitLossList.total_profit > 0 ? (
          <div>
            Total Profit:
            <Alert message={profitLossList.total_profit} type="success" />
          </div>
        ) : (
          <div>
            Total Profit:
            <Alert message={profitLossList.total_profit} type="error" />
          </div>
        )}
      </div>
    );
  }
}

export default MyInvestments;
