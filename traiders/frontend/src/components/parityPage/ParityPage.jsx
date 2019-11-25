import React, { Component } from 'react';
import { Button } from 'antd';
import { Link } from 'react-router-dom';

import ParityChart from '../parityChart/ParityChart';
import Page from '../page/Page';
import './parity-page.scss';
import { PostWithAuthorization } from '../../common/http/httpUtil';

class ParityPage extends Component {
  constructor(props) {
    super(props);
    this.state = {
      limit: 30,
      ma: 0
    };
  }

  componentWillMount() {
    const { match, getOneParity } = this.props;
    const { base, target } = match.params;

    getOneParity(target, base);
  }

  handler = (len) => {
    this.setState({
      limit: len,
      ma: 0
    });
  };

  handlerPrd = (pred) => {
    const { user, match } = this.props;
    const { base, target } = match.params;
    const token = user.key;
    const url = 'https://api.traiders.tk/prediction/';
    const body = {
      base_equipment: base,
      target_equipment: target,
      direction: pred
    };
    PostWithAuthorization(url, body, token)
      // eslint-disable-next-line no-console
      .then((response) => console.log(response))
      // eslint-disable-next-line no-console
      .catch((error) => console.log('Smt wrong \n', error));
  };

  handlerMA = (len) => {
    this.setState({
      ma: len
    });
  };

  render() {
    const { oneParity, match } = this.props;
    const { target, base } = match.params;
    const { limit, ma } = this.state;
    const l1 = `/equipment/${target}`;
    const l2 = `/equipment/${base}`;
    return (
      <Page>
        {oneParity && (
          <div className="parity-container">
            <div className="up">
              Your prediction:
              <Button
                type="secondary"
                onClick={() => this.handlerPrd(1)}
                icon="arrow-up"
              />
              <Button
                type="secondary"
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
              <div className="right">
                <div className="link">
                  <Link to={l1}>{target} / </Link>
                  <Link to={l2}>{base}</Link>
                </div>
                {oneParity.length !== 0 && (
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
        )}
      </Page>
    );
  }
}

export default ParityPage;
