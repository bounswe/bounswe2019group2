import React, { Component } from 'react';
import { Button } from 'antd';

import ParityChart from '../parityChart/ParityChartContainer';
import Page from '../page/Page';
import './parity-page.scss';

class ParityPage extends Component {
  constructor(props) {
    super(props);
    this.state = {
      limit: 30
    };
  }

  handler = (len) => {
    this.setState({
      limit: len
    });
  };

  render() {
    return (
      <Page>
        <div className="container">
          <div className="up">
            <Button onClick={() => this.handler(2)}>Daily</Button>
            <Button onClick={() => this.handler(30)}>Monthly</Button>
            <Button onClick={() => this.handler(365)}>Yearly</Button>
            Your prediction:
            <Button icon="arrow-up" />
            <Button icon="arrow-down" />
          </div>
          <div className="down">
            <ParityChart base="TRY" target="USD" limit={this.state.limit} />
          </div>
        </div>
      </Page>
    );
  }
}

export default ParityPage;
