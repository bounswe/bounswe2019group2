import React, { Component } from 'react';
import history from '../../common/history';

import './my-investments.scss';

class MyInvestments extends Component {
  componentDidMount() {
    // const { getInvestments, user } = this.props;
  }

  render() {
    const { user } = this.props;
    if (!user) {
      history.push('/login');
    }
    return (
      <div>
        <div>Hello World</div>
      </div>
    );
  }
}

export default MyInvestments;
