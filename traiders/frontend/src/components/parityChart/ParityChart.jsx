import React, { Component } from 'react';
import CanvasJSReact from '../../canvasjs.react';

class ParityChart extends Component {
  componentDidMount() {
    const { getOneParity } = this.props;
    getOneParity(this.props.base, this.props.target);
  }

  render() {
    const { oneParity } = this.props;
    const { base, target, limit } = this.props;
    const title = `${target}/${base}`;
    const { CanvasJSChart } = CanvasJSReact;
    const datas = [];
    for (let i = 0; i < limit; i++) {
      datas.push({
        x: new Date(oneParity[i].date),
        y: Number(oneParity[i].close)
      });
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
      <CanvasJSChart options={options} onRef={(ref) => (this.chart = ref)} />
    );
  }
}

export default ParityChart;
