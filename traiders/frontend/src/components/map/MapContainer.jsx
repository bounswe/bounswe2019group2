import React from 'react';
import Map from './Map';

const MapContainer = (props) => {
  const { google } = props;
  return (
    <Map
      google={google}
      center={{ lat: 41.015137, lng: 28.97953 }}
      height="300px"
      zoom={15}
    />
  );
};

export default MapContainer;
