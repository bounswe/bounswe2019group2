import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import { Icon } from 'antd';

import { PatchWithAuthorization } from '../../common/http/httpUtil';
import './notification.scss';

class Notification extends Component {
  componentDidMount() {
    const { getNotifications, user } = this.props;
    getNotifications(user.key);
  }

  makeSeen = (url) => {
    const { user } = this.props;

    const body = { seen: true };
    PatchWithAuthorization(url, body, user.key)
      // eslint-disable-next-line no-console
      .then((response) => console.log(response))
      .catch((error) =>
        // eslint-disable-next-line no-console
        console.log('Errow while changing notification\n', error)
      );
  };

  render() {
    const Row = (props) => {
      const { item } = props;
      // eslint-disable-next-line camelcase
      const { message, reference_url, seen, url, reference_obj } = item;
      let link;
      if (reference_obj === 'Event') {
        link = '/social';
      } else if (
        reference_obj === 'BuyOrder' ||
        reference_obj === 'StopLossOrder'
      ) {
        link = '/investments';
      } else {
        const array = reference_url.split('/');
        link = `${array[array.length - 3]}/${array[array.length - 2]}`;
      }
      let style = { cursor: 'default', backgroundColor: '#ADD8E6' };
      if (seen) {
        style = { cursor: 'default', backgroundColor: '#c2bdbd' };
      }
      return (
        <div>
          <div style={style} className="table-row">
            <div className="notification-details">
              <div className="notification-message">
                {message}
                <Link onClick={() => this.makeSeen(url)} to={link}>
                  see..
                </Link>
              </div>
              <div>{seen ? null : <Icon type="bell" />}</div>
            </div>
          </div>
        </div>
      );
    };
    const { notificationList } = this.props;
    if (notificationList) {
      const notifications =
        notificationList &&
        // eslint-disable-next-line react/no-array-index-key
        notificationList.map((element) => <Row item={element} />);
      return (
        <div className="custom-table-container">
          <h2 style={{ cursor: 'default' }}>Notifications</h2>
          {notifications}
        </div>
      );
    }
    return null;
  }
}

export default Notification;
