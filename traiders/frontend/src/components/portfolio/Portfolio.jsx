import React, { Component } from 'react';
import { Tabs, Button } from 'antd';
import Page from '../../components/page/Page';

class Portfolio extends Component {
  constructor(props) {
    super(props);
    this.newTabIndex = 0;
    const panes = [
      { title: 'Portfolio 1', content: 'Content of Portfolio 1', key: '1' },
      { title: 'Portfolio 2', content: 'Content of Portfolio 2', key: '2' }
    ];
    this.state = {
      activeKey: panes[0].key,
      panes
    };
  }
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

  render() {
    const { TabPane } = Tabs;

    return (
      <Page>
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
              </TabPane>
            ))}
          </Tabs>
        </div>
      </Page>
    );
  }
}
export default Portfolio;
