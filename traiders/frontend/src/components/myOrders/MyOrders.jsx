import React, { Component } from 'react';
import { Table, Button, Modal, Select, Input, Checkbox } from 'antd';

import './my-orders.scss';

import history from '../../common/history';
import { API } from '../../redux/apiConfig';
import { PostWithAuthorization } from '../../common/http/httpUtil';

const { Option } = Select;

class MyOrders extends Component {
  render() {
    return (
      <div>
        <div></div>
      </div>
    );
  }
}

export default MyOrders;
