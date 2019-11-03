import React from 'react';
import Map from './Map';

const MapContainer = (props) => {
  const { google, setCity, setCountry } = props;
  return (
    <Map
      google={google}
      center={{ lat: 41.08505939148941, lng: 29.05161704948432 }}
      height="400px"
      zoom={12}
      setCity={setCity}
      setCountry={setCountry}
    />
  );
};

export default MapContainer;
