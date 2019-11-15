import React, { Component } from 'react';

import Page from '../page/Page';
import CurrencyTable from '../currencyTable/CurrencyTableContainer';
import AddComment from '../addComment/AddCommentContainer';

class EquipmentPage extends Component {
  constructor(props) {
    super(props);
    this.state = {
      base: ''
    };
  }

  componentWillMount() {
    const { match } = this.props;
    const { base } = match.params;
    this.setState({
      base
    });
  }

  render() {
    const { base } = this.state;
    return (
      <Page>
        <div>
          <CurrencyTable base={base}></CurrencyTable>
        </div>
        <div>
          <AddComment></AddComment>
        </div>
      </Page>
    );
  }
}
export default EquipmentPage;
