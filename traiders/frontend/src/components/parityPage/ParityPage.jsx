import React, { Component } from 'react';
import CanvasJSReact from '../../canvasjs.react';

class ParityPage extends Component {
  componentDidMount() {
    const { getOneParity } = this.props;
    getOneParity(this.props.base, this.props.target);
  }
  render() {
    const { oneParity } = this.props;
    const { base, target } = this.props;
    const CanvasJSChart = CanvasJSReact.CanvasJSChart;
    const dataPoints = {};
    console.log(oneParity);
    for (var i = 0; i < oneParity.length; i++) {
      dataPoints.push({
        x: new Date(oneParity[i].x),
        y: oneParity[i].y
      });
    }
    const options = {
      theme: 'light2',
      title: {
        text: base / target
      },
      axisY: {
        title: 'base / target',
        prefix: '',
        includeZero: false
      },
      data: [
        {
          type: 'line',
          xValueFormatString: 'MMM YYYY',
          yValueFormatString: '$#,##0.00',
          dataPoints: dataPoints
        }
      ]
    };
    return (
      <div>
        <CanvasJSChart options={options} onRef={(ref) => (this.chart = ref)} />
      </div>
    );
  }
}

export default ParityPage;
