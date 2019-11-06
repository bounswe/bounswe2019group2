import React, { Component } from 'react';
import { Table } from 'antd';

import './events-list.scss';
import { eventsTableColumns } from '../../common/constants/generalConstants';

class EventsList extends Component {
  componentDidMount() {
    const { getEvents } = this.props;
    getEvents();
  }

  render() {
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
