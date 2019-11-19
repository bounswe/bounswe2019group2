import React, { Component } from 'react';
import { Table, Button, Modal, Select, Input } from 'antd';

import './assets.scss';
import { assetsTableConstants } from '../../common/constants/generalConstants';

const { Option } = Select;

class Assets extends Component {
  constructor(props) {
    super(props);
    this.state = {
      visible: false,
      newAssetAmount: null,
      selectedCurrency: 'TRY'
    };
  }

  componentDidMount() {
    const { user, getAssets, getCurrencyList } = this.props;
    getCurrencyList();
    getAssets(1, user.key);
  }

  handleAddAsset = () => {
    this.setState({
      visible: true
    });
  };

  handleOk = () => {
    // eslint-disable-next-line
    const { newAssetAmount, selectedCurrency } = this.state;

    this.setState({
      visible: false
    });
  };

  handleCancel = () => {
    this.setState({
      visible: false
    });
  };

  menu = (list) => {
    return list.map((element, index) => (
      // eslint-disable-next-line react/no-array-index-key
      <Option key={index} value={element}>
        {element}
      </Option>
    ));
  };

  changeValue = (event) => {
    const { value } = event.target;
    this.setState({
      newAssetAmount: value
    });
  };

  handleSelectCurrency = (value) => {
    this.setState({
      selectedCurrency: value
    });
  };

  render() {
    const { assets } = this.props;
    const { visible, newAssetAmount } = this.state;

    return (
      <div className="assets-container">
        <div className="assets-table">
          <Table
            data={assets}
            columns={assetsTableConstants}
            title={() => 'My Assets'}
            bordered
          />
        </div>
        <div className="add-assets">
          <Button type="primary" onClick={this.handleAddAsset}>
            Add Asset
          </Button>
        </div>
        <Modal
          title="ADD ASSET"
          visible={visible}
          onOk={this.handleOk}
          onCancel={this.handleCancel}
        >
          <div className="modal">
            <Input
              placeholder="Please enter the amount"
              type="number"
              value={newAssetAmount}
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

export default Assets;

const currencyList = ['TRY', 'EUR', 'USD'];
