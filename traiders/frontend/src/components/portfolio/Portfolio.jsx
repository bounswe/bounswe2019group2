import React, { Component } from 'react';
import { Tabs, Button, Modal, Select, Input } from 'antd';

import Page from '../../components/page/Page';
import { API } from '../../redux/apiConfig';
import { PostWithAuthorization } from '../../common/http/httpUtil';
import history from '../../common/history';
const { Option } = Select;

class Portfolio extends Component {
  constructor(props) {
    super(props);
    this.newTabIndex = 0;
    const panes = [];
    this.state = {
      activeKey: null,
      panes,
      portfoliBaseCurrency: 'TRY',
      portfolioTargetCurrency: 'USD',
      visiblePortfolioEquipment: false
    };
  }
  componentDidMount() {
    const { getCurrencyList, user } = this.props;
    if (user) {
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

  handleOkEquipment = () => {
    const { portfoliBaseCurrency, portfolioTargetCurrency } = this.state;
    const { user, getPortfolioEquipments } = this.props;
    const url = `${API}/portfolioequipment/`;
    const body = {
      base_equipment: portfoliBaseCurrency,
      target_equipment: portfolioTargetCurrency
    };

    PostWithAuthorization(url, body, user.key)
      .then((response) => {
        if (response.status !== 201) {
          response.json().then((res) => alert(res));
        } else {
          alert('Success');
        }
      })
      .catch(() => alert('error while adding portfolio equipment'));

    setTimeout(() => getPortfolioEquipments(user.key), 1000);
    this.setState({
      visibleManual: false
    });
  };

  handleCancelEquipment = () => {
    this.setState({
      visiblePortfolioEquipment: false
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

  onChange = (activeKey) => {
    this.setState({ activeKey });
  };

  onEdit = (targetKey, action) => {
    this[action](targetKey);
  };

  add = () => {
    const { panes } = this.state;
    const activeKey = `newTab${this.newTabIndex++}`;
    panes.push({
      title: 'New Portfolio',
      content: 'New Portfolio Content',
      key: activeKey
    });
    this.setState({ panes, activeKey });
  };
  remove = (targetKey) => {
    let { activeKey } = this.state;
    let lastIndex;
    this.state.panes.forEach((pane, i) => {
      if (pane.key === targetKey) {
        lastIndex = i - 1;
      }
    });
    const panes = this.state.panes.filter((pane) => pane.key !== targetKey);
    if (panes.length && activeKey === targetKey) {
      if (lastIndex >= 0) {
        activeKey = panes[lastIndex].key;
      } else {
        activeKey = panes[0].key;
      }
    }
    this.setState({ panes, activeKey });
  };

  mergeArrays = (arr1, arr2) => {
    const newList = [];
    arr1.forEach((element, index) =>
      newList.push({ ...element, ...arr2[index] })
    );

    return newList;
  };

  render() {
    const { TabPane } = Tabs;
    const { user, currencyList, portfolios } = this.props;
    const { visiblePortfolioEquipment } = this.state;

    let newPortfolioList = [];
    if (user && portfolios) {
      newPortfolioList = this.mergeArrays(portfolios, newPortfolioList);
    }
    if (!user) {
      history.push('/login');
    }

    const filteredList = [];
    if (currencyList) {
      currencyList.forEach((element) => filteredList.push(element.symbol));
    }

    return (
      <Page>
        {' '}
        <div>
          <div style={{ marginBottom: 16 }}>
            <Button onClick={this.add}>Add New Portfolio</Button>
          </div>
          <Tabs
            hideAdd
            onChange={this.onChange}
            activeKey={this.state.activeKey}
            type="editable-card"
            onEdit={this.onEdit}
          >
            {this.state.panes.map((pane) => (
              <TabPane tab={pane.title} key={pane.key}>
                {pane.content}
                <Button>Add Equipment</Button>
              </TabPane>
            ))}
          </Tabs>
        </div>
      </Page>
    );
  }
}
export default Portfolio;
