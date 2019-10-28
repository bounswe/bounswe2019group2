import React from 'react';
import { Avatar, Icon, Button } from 'antd';
import { Link } from 'react-router-dom';

import './user-header.scss';

const UserHeader = (props) => {
  function handleFollow(e) {
    e.preventDefault();
  }

  const { data } = props;
  const { user } = data;

  return (
    <div className="all">
      <div className="left">
        <div className="left-up">
          <Avatar size={80}>{user.username.charAt(0).toUpperCase()}</Avatar>
          <h1>{user.username}</h1>
          <h2>Success Rate 0.0%</h2>
        </div>
        <div className="left-down">
          <Button
            onClick={handleFollow}
            type="primary"
            icon="user-add"
            size={14}
          >
            Follow
          </Button>
        </div>
      </div>
      <div className="right">
        {user.is_private ? (
          <div className="right-up">
            <Icon type="lock" style={{ fontSize: '26px' }} />
            Private
          </div>
        ) : (
          <div className="right-up">
            <Icon type="lock" style={{ fontSize: '26px' }} />
            Private
          </div>
        )}
        <div className="right-down">
          <Icon type="edit" style={{ fontSize: '26px' }} />
          <Link
            className="update-link"
            to={{ pathname: '/updateprofile', state: { user: user } }}
          >
            Edit
          </Link>
        </div>
      </div>
    </div>
  );
};

export default UserHeader;
