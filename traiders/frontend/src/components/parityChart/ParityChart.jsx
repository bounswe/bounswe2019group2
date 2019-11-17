import React, { Component } from 'react';
import CanvasJSReact from '../../canvasjs.react';

class ParityChart extends Component {
  createList = (limit, list) => {
    const datas = [];
    const size = list.length;
    const date = new Date(list[0].date);
    date.setDate(date.getDate() - limit);
    for (let i = 0; i < size; i += 1) {
      if (date >= new Date(list[i].date)) break;
      datas.push({
        x: new Date(list[i].date),
        y: Number(list[i].close)
      });
    }
    return datas;
  };

  createListMa = (ma, list) => {
    const datas = [];
    const size = list.length;
    let sum = 0;
    for (let i = 0; i < size; i += 1) {
      sum += Number(list[i].close);
      if (i < ma) {
        datas.push({
          x: new Date(list[i].date),
          y: sum / (i + 1)
        });
      } else {
        sum -= Number(list[i - ma].close);
        datas.push({
          x: new Date(list[i].date),
          y: sum / ma
        });
      }
    }
    return datas;
  };

  render() {
    const { list } = this.props;
    const { base, target, limit, ma } = this.props;
    const title = `${target}/${base}`;
    const { CanvasJSChart } = CanvasJSReact;
    let datas = [];
    if (ma === 0) {
      datas = this.createList(limit, list);
    } else {
      datas = this.createListMa(ma, list);
    }
    const options = {
      theme: 'light2',
      title: {
        text: title
      },
      axisY: {
        title,
        includeZero: false
      },
      data: [
        {
          type: 'area',
          xValueFormatString: 'MMM YYYY',
          yValueFormatString: '##0.###',
          dataPoints: datas
        }
      ]
    };
    return (
      <CanvasJSChart
        options={options} /* onRef={(ref) => (this.chart = ref)} */
      />
    );
  }
}

export default ParityChart;
