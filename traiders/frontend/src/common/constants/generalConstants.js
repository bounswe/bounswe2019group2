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
  },
  {
    title: 'TOTAL PROFIT/LOSS IN TRY',
    dataIndex: 'profit',
    key: 'profit'
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
  },
  {
    title: 'TOTAL PROFIT/LOSS IN TRY',
    dataIndex: 'profit',
    key: 'profit'
  }
];

export const buyOrderTableColumns = [
  {
    title: 'BASE EQUIPMENT',
    dataIndex: 'base_equipment',
    key: 'baseEquipment'
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
  },
  {
    title: 'BUY RATIO',
    dataIndex: 'buy_ratio',
    key: 'buyRatio'
  },
  {
    title: 'AMOUNT',
    dataIndex: 'buy_amount',
    key: 'buyAmount'
  }
];

export const stopLossOrderTableColumns = [
  {
    title: 'BASE EQUIPMENT',
    dataIndex: 'base_equipment',
    key: 'baseEquipment'
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
  },
  {
    title: 'SELL RATIO',
    dataIndex: 'sell_ratio',
    key: 'sellRatio'
  },
  {
    title: 'AMOUNT',
    dataIndex: 'sell_amount',
    key: 'sellAmount'
  }
];

export const SEARCH_RESULTS_TABLES_COLUMNS = {
  equipmentsTable: [
    {
      title: 'Symbol',
      dataIndex: 'symbol',
      key: 'symbol'
    },
    {
      title: 'Name',
      dataIndex: 'name',
      key: 'name'
    },
    {
      title: 'Category',
      dataIndex: 'category',
      key: 'category'
    }
  ],
  eventsTable: [
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
  ],
  paritiesTable: [
    {
      title: 'Base Equipment',
      dataIndex: 'base_equipment.symbol',
      key: 'baseEquipment'
    },
    {
      title: 'Target Equipment',
      dataIndex: 'target_equipment.symbol',
      key: 'targetEquipment'
    },
    {
      title: 'Daily High',
      dataIndex: 'high',
      key: 'dailyHigh'
    },
    {
      title: 'Daily Low',
      dataIndex: 'low',
      key: 'dailyLow'
    },
    {
      title: 'Ratio',
      dataIndex: 'ratio',
      key: 'ratio'
    },
    {
      title: 'Exact Date Time',
      dataIndex: 'date',
      key: 'data'
    }
  ],
  usersTable: [
    { title: 'Name', dataIndex: 'first_name', key: 'firstName' },
    {
      title: 'Surname',
      dataIndex: 'last_name',
      key: 'lastName'
    },
    {
      title: 'Username',
      dataIndex: 'username',
      key: 'username'
    }
  ]
};
