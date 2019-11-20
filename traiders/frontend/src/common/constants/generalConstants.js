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
    url: '/investments',
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

export const assetsTableConstants = [
  {
    title: 'AMOUNT',
    dataIndex: 'amount',
    key: 'amount'
  },
  {
    title: 'EQUIPMENT',
    dataIndex: 'equipment',
    key: 'equipment'
  },
  {
    title: 'ON HOLD FOR INVESTMENT',
    dataIndex: 'on_hold_for_investment',
    key: 'onhold'
  }
];

export const manualInvestmentsTableColumns = [
  {
    title: 'BASE AMOUNT',
    dataIndex: 'base_amount',
    key: 'baseAmount'
  },
  {
    title: 'BASE EQUIPMENT',
    dataIndex: 'base_equipment',
    key: 'baseEquipment'
  },
  {
    title: 'TARGET AMOUNT',
    dataIndex: 'target_amount',
    key: 'targetAmount'
  },

  {
    title: 'TARGET EQUIPMENT',
    dataIndex: 'target_equipment',
    key: 'targetEquipment'
  },

  {
    title: 'DATE',
    dataIndex: 'date',
    key: 'date'
  }
];

export const onlineInvestmentsTableColumns = [
  {
    title: 'BASE AMOUNT',
    dataIndex: 'base_amount',
    key: 'baseAmount'
  },
  {
    title: 'BASE EQUIPMENT',
    dataIndex: 'base_equipment',
    key: 'baseEquipment'
  },
  {
    title: 'TARGET AMOUNT',
    dataIndex: 'target_amount',
    key: 'targetAmount'
  },

  {
    title: 'TARGET EQUIPMENT',
    dataIndex: 'target_equipment',
    key: 'targetEquipment'
  },

  {
    title: 'DATE',
    dataIndex: 'date',
    key: 'date'
  }
];
