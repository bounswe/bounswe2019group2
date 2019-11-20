import React, { Component } from 'react';
import { Table, Button, Modal, Select, Input } from 'antd';

import './assets.scss';
import { API } from '../../redux/apiConfig';
import { PostWithAuthorization } from '../../common/http/httpUtil';
import { assetsTableConstants } from '../../common/constants/generalConstants';
import history from '../../common/history';

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
    getAssets(user.key);
  }

  handleAddAsset = () => {
    this.setState({
      visible: true
    });
  };

  handleOk = () => {
    const { newAssetAmount, selectedCurrency } = this.state;
    const { user, getAssets } = this.props;
    const body = { equipment: selectedCurrency, amount: newAssetAmount };
    const url = `${API}/asset/`;

    PostWithAuthorization(url, body, user.key)
      .then((response) => console.log(response))
      .catch((error) => console.log('error while adding asset', error));

    setTimeout(() => getAssets(user.key), 1000);

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
    const { assets, user } = this.props;
    const { visible, newAssetAmount } = this.state;

    if (!user) {
      history.push('/login');
    }

    return (
      <div className="assets-container">
        <div className="assets-table">
          <Table
            dataSource={assets}
            columns={assetsTableConstants}
            title={() => 'MY ASSETS'}
            bordered
            rowKey="id"
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
