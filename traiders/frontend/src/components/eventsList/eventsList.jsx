import React, { Component } from 'react';
import { Table, Button } from 'antd';

import { API } from '../../redux/apiConfig';
import history from '../../common/history';
import { PatchWithAuthorization } from '../../common/http/httpUtil';
import './events-list.scss';
// import { eventsTableColumns } from '../../common/constants/generalConstants';

class EventsList extends Component {
  componentDidMount() {
    const { getEvents, user, getEventsWithAuthorization } = this.props;
    if (user) {
      getEventsWithAuthorization(user.key);
    } else {
      getEvents();
    }
  }

  onFollow = (id, follow) => {
    const { getEventsWithAuthorization, user } = this.props;
    if (user) {
      if (follow === false) {
        const url = `${API}/events/${id}/`;
        const body = {
          is_following: true
        };
        PatchWithAuthorization(url, body, user.key).then((response) => {
          if (response.status === 204) {
            // eslint-disable-next-line
          }

          setTimeout(() => getEventsWithAuthorization(user.key), 1000);
        });
      } else {
        alert("You've already followed this event.");
      }
    } else {
      history.push('/login');
    }
  };

  onUnfollow = (id, follow) => {
    const { getEventsWithAuthorization, user } = this.props;
    if (user) {
      if (follow === true) {
        const url = `${API}/events/${id}/`;
        const body = {
          is_following: false
        };
        PatchWithAuthorization(url, body, user.key).then((response) => {
          if (response.status === 204) {
            // eslint-disable-next-line
          }

          setTimeout(() => getEventsWithAuthorization(user.key), 1000);
        });
      } else {
        alert('You have to  follow this event first!');
      }
    } else {
      history.push('/login');
    }
  };

  render() {
    const eventsTableColumns = [
      {
        title: 'Event', // Header of that column
        dataIndex: 'event', // Which property of the data to read
        key: 'event'
      },
      {
        title: 'Country', // Header of that column
        dataIndex: 'country.name', // Which property of the data to read
        key: 'country'
      },
      {
        title: 'Category', // Header of that column
        dataIndex: 'category', // Which property of the data to read
        key: 'cat'
      },
      {
        title: 'Importance', // Header of that column
        dataIndex: 'importance', // Which property of the data to read
        key: 'importance'
      },
      {
        title: 'Previous', // Header of that column
        dataIndex: 'previous', // Which property of the data to read
        key: 'prev'
      },
      {
        title: 'Actual',
        dataIndex: 'actual',
        key: 'actual'
      },
      {
        title: 'Follow',
        dataIndex: 'is_following',
        key: 'id',
        render: (isFollowing, event) => {
          if (!isFollowing) {
            return (
              <div>
                <Button
                  type="primary"
                  onClick={() => {
                    this.onFollow(event.id, isFollowing);
                  }}
                >
                  Follow
                </Button>
              </div>
            );
          }
          return (
            <div>
              <Button
                type="primary"
                onClick={() => {
                  this.onUnfollow(event.id, isFollowing);
                }}
              >
                Unfollow
              </Button>
            </div>
          );
        }
      }
    ];
    const { eventsList } = this.props;
    return (
      <div className="events-table-container">
        <Table
          rowKey="id"
          columns={eventsTableColumns}
          bordered
          dataSource={eventsList}
        />
      </div>
    );
  }
}

export default EventsList;
