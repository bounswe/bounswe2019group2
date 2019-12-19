import React, { Component } from 'react';
import { Button } from 'antd';
import { Link } from 'react-router-dom';

import ParityChart from '../parityChart/ParityChart';
import Page from '../page/Page';
import './parity-page.scss';
import { PostWithAuthorization } from '../../common/http/httpUtil';
import history from '../../common/history';

class ParityPage extends Component {
  constructor(props) {
    super(props);
    this.state = {
      limit: 30,
      ma: 0,
      predicted: false,
      prediction: null
    };
  }

  componentDidMount() {
    const {
      match,
      getOneParity,
      getPredictions,
      predictionList,
      user
    } = this.props;
    const { base, target } = match.params;

    getOneParity(target, base);
    if (user) {
      getPredictions(target, base, user.key);

      let list;
      if (predictionList.length !== 0) {
        list = predictionList.filter(
          (element) => element.user === user.user.url
        );
        if (list.length !== 0) {
          this.setState({
            predicted: true,
            prediction: list[0].direction
          });
        }
      }
    }
  }

  handler = (len) => {
    this.setState({
      limit: len,
      ma: 0
    });
  };

  handlerPrd = (pred) => {
    const { user, match, getPredictions } = this.props;
    const { base, target } = match.params;
    if (user) {
      const token = user.key;
      const url = 'https://api.traiders.tk/prediction/';
      const body = {
        base_equipment: base,
        target_equipment: target,
        direction: pred
      };
      PostWithAuthorization(url, body, token)
        .then((response) => {
          if (response.status === 201) {
            this.setState({ predicted: true, prediction: pred });
          }
        })
        // eslint-disable-next-line no-console
        .catch((error) => console.log('Smt wrong \n', error));
      setTimeout(() => getPredictions(target, base, user.key), 1000);
    } else {
      history.push('/login');
    }
  };

  handlerMA = (len) => {
    this.setState({
      ma: len
    });
  };

  render() {
    const { oneParity, match } = this.props;
    const { target, base } = match.params;
    const { limit, ma, predicted, prediction } = this.state;
    const l1 = `/equipment/${target}`;
    const l2 = `/equipment/${base}`;
    let style;
    let type1 = 'default';
    let type2 = 'default';
    if (predicted) {
      style = { pointerEvents: 'none', cursor: 'not-allowed' };
      if (prediction === 1) {
        type1 = 'primary';
      } else {
        type2 = 'primary';
      }
    }
    return (
      <Page>
        {oneParity && (
          <div className="parity-container">
            <div className="up">
              <div style={{ pointerEvents: 'none' }}>Your prediction:</div>
              <Button
                style={style}
                onClick={() => this.handlerPrd(1)}
                icon="arrow-up"
                type={type1}
              />
              <Button
                style={style}
                onClick={() => this.handlerPrd(-1)}
                icon="arrow-down"
                type={type2}
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
                <div className="chart">
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
          </div>
        )}
      </Page>
    );
  }
}

export default ParityPage;
