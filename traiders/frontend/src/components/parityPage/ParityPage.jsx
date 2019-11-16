import React, { Component } from 'react';
import { Button } from 'antd';

import ParityChart from '../parityChart/ParityChart';
import Page from '../page/Page';
import './parity-page.scss';
import { PostWithAuthorization } from '../../common/http/httpUtil';

class ParityPage extends Component {
  constructor(props) {
    super(props);
    this.state = {
      limit: 30,
      base: '',
      target: '',
      ma: 0
    };
  }

  componentWillMount() {
    const { match } = this.props;
    const { base, target } = match.params;
    this.setState({
      base,
      target
    });
    const { getOneParity } = this.props;
    getOneParity(target, base);
  }

  handler = (len) => {
    this.setState({
      limit: len,
      ma: 0
    });
  };

  handlerPrd = (pred) => {
    const { user } = this.props;
    const { base, target } = this.state;
    const token = user.key;
    const url = 'https://api.traiders.tk/prediction/';
    const body = {
      base_equipment: base,
      target_equipment: target,
      direction: pred
    };
    PostWithAuthorization(url, body, token)
      .then((response) => console.log(response))
      .catch((error) => console.log('Smt wrong \n', error));
  };

  handlerMA = (len) => {
    this.setState({
      ma: len
    });
  };

  render() {
    const { oneParity } = this.props;
    const { limit, base, target, ma } = this.state;
    return (
      <Page>
        <div className="container">
          <div className="up">
            Your prediction:
            <Button
              type="default"
              onClick={() => this.handlerPrd(1)}
              icon="arrow-up"
            />
            <Button
              type="default"
              onClick={() => this.handlerPrd(-1)}
              icon="arrow-down"
            />
          </div>
          <div className="down">
            <div className="left">
              <Button onClick={() => this.handler(1)}>Daily</Button>
              <Button onClick={() => this.handler(30)}>Monthly</Button>
              <Button onClick={() => this.handler(365)}>Yearly</Button>
              <Button onClick={() => this.handlerMA(50)}>MA50</Button>
              <Button onClick={() => this.handlerMA(100)}>MA100</Button>
              <Button onClick={() => this.handlerMA(200)}>MA200</Button>
            </div>
            <div>
              {oneParity && (
                <ParityChart
                  base={base}
                  target={target}
                  limit={limit}
                  ma={ma}
                  list={oneParity}
                />
              )}
            </div>
          </div>
        </div>
      </Page>
    );
  }
}

export default ParityPage;
