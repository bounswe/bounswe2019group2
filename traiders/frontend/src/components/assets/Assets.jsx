import React, { Component } from 'react';

import './assets.scss';

class Assets extends Component {
  componentDidMount() {
    const { user, getAssets } = this.props;
    getAssets(1, user.key);
  }

  render() {
    return (
      <div>
        <div>Hello World</div>
      </div>
    );
  }
}

export default Assets;
