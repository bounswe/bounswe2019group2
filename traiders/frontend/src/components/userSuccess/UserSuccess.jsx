import React, { Component } from 'react';
import { Link } from 'react-router-dom';

class UserSuccess extends Component {
  componentWillMount() {
    const { user, getParities } = this.props;
    const array = user.user.url.split('/');
    const id = array[array.length - 2];
    getParities(id);
  }

  render() {
    const Row = (props) => {
      const { item } = props;
      // eslint-disable-next-line camelcase
      const { success_rate, base_equipment, target_equipment } = item;
      const link = `/parity/${base_equipment.symbol}/${target_equipment.symbol}`;
      return (
        <div>
          <h1>Success Rates</h1>
          <div className="table-row">
            <div className="parity-details">
              <div className="parity-symbols">
                <Link to={link}>
                  {base_equipment.symbol} / {target_equipment.symbol}
                </Link>
              </div>
              <div className="parity-names">
                {`${base_equipment.name} / ${target_equipment.name}`}
              </div>
            </div>
            <div className="rate">
              <div>{success_rate}</div>
            </div>
          </div>
        </div>
      );
    };
    const { parityList } = this.props;
    if (parityList) {
      const parities =
        parityList &&
        // eslint-disable-next-line react/no-array-index-key
        parityList.map((element, index) => <Row item={element} key={index} />);
      return <div className="custom-table-container">{parities}</div>;
    }
    return null;
  }
}
export default UserSuccess;
