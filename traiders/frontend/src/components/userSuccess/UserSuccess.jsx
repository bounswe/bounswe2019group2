import React, { Component } from 'react';
import { Link } from 'react-router-dom';

class UserSuccess extends Component {
  componentWillMount() {
    const { user, getParities } = this.props;
    const array = user.user.url.split('/');
    const id = array[array.length - 2];
    getParities(13);
  }

  render() {
    const Row = (props) => {
      const { item } = props;
      const { success_rate, base_equipment, target_equipment } = item;
      const link = `/parity/${base_equipment.symbol}/${target_equipment.symbol}`;
      console.log(link);
      return (
        <div className="table-row">
          <div className="parity-details">
            <div className="parity-symbols">
              {
                <Link to={link}>
                  {base_equipment.symbol} / {target_equipment.symbol}
                </Link>
              }
            </div>
            <div className="parity-names">
              {`${base_equipment.name} / ${target_equipment.name}`}
            </div>
          </div>
          <div className="rate">
            <div>{success_rate}</div>
          </div>
        </div>
      );
    };
    let { parityList } = this.props;
    console.log(parityList);
    if (parityList) {
      let parities =
        parityList &&
        parityList.map((element, index) => <Row item={element} key={index} />);
      return <div className="custom-table-container">{parities}</div>;
    }
  }
}
export default UserSuccess;
