import React, { Component } from 'react';
import { List, Avatar, Button } from 'antd';

import {
  DeleteWithAuthorization,
  GetWithAuthorization,
  PatchWithAuthorization
} from '../../common/http/httpUtil';
import { API } from '../../redux/apiConfig';

import './follow-request.scss';
import images from '../../common/images';

class FollowRequestList extends Component {
  constructor(props) {
    super(props);
    this.state = {
      followRequests: []
    };
  }

  async componentDidMount() {
    const { user, token } = this.props;

    const response = await GetWithAuthorization(
      `${API}/following/?user_followed=${user.id}&status=0`,
      token
    );

    const followRequests = await response.json();

    for (let i = 0; i < followRequests.length; i += 1) {
      const url = followRequests[i].user_following;
      const res = await GetWithAuthorization(url, token);
      followRequests[i].user_following = await res.json();
    }

    this.setState({
      followRequests
    });
  }

  async removeRequest(url) {
    const { followRequests } = this.state;
    this.setState({
      followRequests: followRequests.filter((request) => request.url !== url)
    });
  }

  async handleAcceptRequest(url) {
    const { token } = this.props;

    const response = await PatchWithAuthorization(url, { status: 1 }, token);

    if (response.status === 200) {
      this.removeRequest(url);
    }
  }

  async handleDenyRequest(url) {
    const { token } = this.props;

    const response = await DeleteWithAuthorization(url, token);

    if (response.status === 204) {
      this.removeRequest(url);
    }
  }

  render() {
    const { followRequests } = this.state;
    return (
      <div className="follow-request-container">
        <h2>Following Requests</h2>
        <List
          itemLayout="horizontal"
          dataSource={followRequests}
          renderItem={(item) => (
            <List.Item>
              <List.Item.Meta
                avatar={
                  <Avatar src={images[item.user_following.avatar - 1].src} />
                }
                title={
                  <a href={`/profile/${item.user_following.id}`}>
                    {item.user_following.username}
                  </a>
                }
                description={`${item.user_following.first_name} ${item.user_following.last_name}`}
              />
              <Button
                className="accept-button"
                onClick={() => this.handleAcceptRequest(item.url)}
              >
                Accept
              </Button>
              <Button
                className="deny-button"
                onClick={() => this.handleDenyRequest(item.url)}
              >
                Deny
              </Button>
            </List.Item>
          )}
        />
      </div>
    );
  }
}

export default FollowRequestList;
