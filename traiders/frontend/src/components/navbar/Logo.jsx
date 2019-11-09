import React from 'react';

import { Link } from 'react-router-dom';

const Logo = () => {
  // eslint-disable-next-line
  const logo = require('../../common/log0.png');
  return (
    <div className="logo">
      <Link to="/">
        <img src={logo} alt={logo} />
      </Link>
    </div>
  );
};

export default Logo;
