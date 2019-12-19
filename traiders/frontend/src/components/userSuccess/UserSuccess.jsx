import React, { Component } from 'react';
import { Link } from 'react-router-dom';

class UserSuccess extends Component {
  componentDidMount() {
    const { id, getParities } = this.props;
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
          <div style={{ cursor: 'default' }} className="table-row">
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
    if (parityList.length) {
      const parities =
        parityList &&
        // eslint-disable-next-line react/no-array-index-key
        parityList.map((element, index) => <Row item={element} key={index} />);
      return (
        <div className="custom-table-container">
          <h2 style={{ cursor: 'default' }}>Success Rates</h2>
          {parities}
        </div>
      );
    }
    return null;
  }
}
export default UserSuccess;
