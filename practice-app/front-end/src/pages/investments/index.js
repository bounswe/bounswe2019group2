import React, { Component } from "react";
import { connect } from "react-redux";
import { MdDelete } from "react-icons/md";
import { Table, Card } from "antd";

import * as userActionManager from "../../redux/userDetails/actions";
class Investments extends Component {
  constructor(props) {
    super(props);
    this.Columns = [
      {
        title: "Base",
        dataIndex: "baseSymbol",
        key: "baseSymbol"
      },
      {
        title: "Target",
        dataIndex: "targetSymbol",
        key: "targetSymbol"
      },
      {
        title: "Base Amount",
        dataIndex: "baseAmount",
        key: "baseAmount"
      },
      {
        title: "Target Amount",
        dataIndex: "targetAmount",
        key: "targetAmount"
      },
      {
        title: "Date",
        dataIndex: "date",
        key: "date"
      },
      {
        title: "Delete",
        key: "delete",
        render: (text, record) => (
          <MdDelete
            onClick={e => {
              this.handleDelete(record, e);
            }}
            size={24}
          />
        )
      }
    ];
    this.Investments = [
      {
        key: "1",
        baseSymbol: "USD",
        targetSymbol: "TRY",
        baseAmount: "50",
        targetAmount: "400",
        date: "02.08.2018"
      },
      {
        key: "2",
        baseSymbol: "USD",
        targetSymbol: "TRY",
        baseAmount: "50",
        targetAmount: "400",
        date: "02.08.2018"
      },
      {
        key: "3",
        baseSymbol: "USD",
        targetSymbol: "TRY",
        baseAmount: "50",
        targetAmount: "400",
        date: "02.08.2018"
      }
    ];
  }
  componentDidMount() {
    this.props.dispatch(userActionManager.api.getInvestments());
  }

  handleDelete = (record, e) => {
    e.preventDefault();
    this.props.dispatch(userActionManager.api.deleteInvestment(record));
  };
  render() {
    return (
      <div>
        <Card title="My Investments">
          <Table columns={this.Columns} dataSource={this.Investments} />
        </Card>
      </div>
    );
  }
}

const mapStateToProps = state => ({
  investmentList: state.userDetails.investmentList
});

export default connect(
  mapStateToProps,
  null
)(Investments);
