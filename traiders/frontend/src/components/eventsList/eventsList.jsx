import React from 'react';
import { Table } from 'antd';

import './events-list.scss';
import { eventsTableColumns } from '../../common/constants/generalConstants';

const EventsList = (props) => {
  const { eventsList } = props;
  console.log(props);

  return (
    <div className="events-table-container">
      <Table columns={eventsTableColumns} bordered dataSource={eventsList} />
    </div>
  );
};

export default EventsList;
