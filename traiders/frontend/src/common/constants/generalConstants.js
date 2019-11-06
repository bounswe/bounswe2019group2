// eslint-disable-next-line import/prefer-default-export
export const navbarOptions = [
  {
    name: 'SOCIAL',
    url: '/social',
    id: 1
  },
  {
    name: 'MARKETS',
    url: '/',
    id: 2
  },
  {
    name: 'INVESTMENTS',
    url: '/',
    id: 3
  },
  {
    name: 'PORTFOLIO',
    url: '/',
    id: 4
  }
];

export const eventsTableColumns = [
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
  }
];
