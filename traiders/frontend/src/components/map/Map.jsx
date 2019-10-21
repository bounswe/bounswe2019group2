import React from 'react';
import {
  withGoogleMap,
  GoogleMap,
  withScriptjs,
  InfoWindow,
  Marker
} from 'react-google-maps';
import Autocomplete from 'react-google-autocomplete';
import Geocode from 'react-geocode';

Geocode.setApiKey('AIzaSyAKrbRQadkOa8UFprsK7MRlz41ULmx7GTY');
Geocode.setLanguage('en');
Geocode.enableDebug();

class Map extends React.Component {
  constructor(props) {
    super(props);
    const { center } = this.props;
    this.state = {
      address: '',
      city: '',
      country: '',
      mapPosition: {
        lat: center.lat,
        lng: center.lng
      },
      markerPosition: {
        lat: center.lat,
        lng: center.lng
      }
    };
  }

  /**
   * Get the current address from the default map position and set those values in the state
   */
  componentDidMount() {
    const { mapPosition } = this.state;
    Geocode.fromLatLng(mapPosition.lat, mapPosition.lng).then((response) => {
      const address = response.results[0].formatted_address;
      const addressArray = response.results[0].address_components;
      const city = this.getCity(addressArray);
      const country = this.getCountry(addressArray);

      this.setState({
        address: address || '',
        city: city || '',
        country: country || ''
      });
    });
  }

  /**
   * Component should only update ( meaning re-render ), when the user selects the address, or drags the pin
   *
   * @param nextProps
   * @param nextState
   * @return {boolean}
   */
  shouldComponentUpdate(nextProps, nextState) {
    const { center } = this.props;
    const { markerPosition, address, city, country } = this.state;
    if (
      markerPosition.lat !== center.lat ||
      address !== nextState.address ||
      city !== nextState.city ||
      country !== nextState.country
    ) {
      return true;
    }
    if (center.lat === nextProps.center.lat) {
      return false;
    }
    return false;
  }

  /**
   * Get the city and set the city input value to the one selected
   *
   * @param addressArray
   * @return {string}
   */

  getCity = (addressArray) => {
    let city = '';

    for (let i = 0; i < addressArray.length; i += 1) {
      if (
        addressArray[i].types[0] &&
        addressArray[i].types[0] === 'administrative_area_level_1'
      ) {
        city = addressArray[i].long_name;
        return city;
      }
    }
    return city;
  };

  getCountry = (addressArray) => {
    let country = '';
    for (let i = 0; i < addressArray.length; i += 1) {
      if (addressArray[i].types[0] && addressArray[i].types[0] === 'country') {
        country = addressArray[i].long_name;
        return country;
      }
    }
    return country;
  };

  /**
   * Get the address and set the address input value to the one selected
   *
   * @param addressArray
   * @return {string}
   */

  /**
   * And function for city,state and address input
   * @param event
   */
  onChange = (event) => {
    this.setState({ [event.target.name]: event.target.value });
  };

  /**
   * This Event triggers when the marker window is closed
   *
   * @param event
   */
  // onInfoWindowClose = (event) => {};

  /**
   * When the user types an address in the search box
   * @param place
   */
  onPlaceSelected = (place) => {
    const address = place.formatted_address;
    const addressArray = place.address_components;
    const city = this.getCity(addressArray);
    const country = this.getCountry(addressArray);
    const latValue = place.geometry.location.lat();
    const lngValue = place.geometry.location.lng();
    const { setCity, setCountry } = this.props;
    setCity(city);
    setCountry(country);
    // Set these values in the state.
    this.setState({
      address: address || '',
      city: city || '',
      country: country || '',
      markerPosition: {
        lat: latValue,
        lng: lngValue
      },
      mapPosition: {
        lat: latValue,
        lng: lngValue
      }
    });
  };

  /**
   * When the marker is dragged you get the lat and long using the functions available from event object.
   * Use geocode to get the address, city and country from the lat and lng positions.
   * And then set those values in the state.
   *
   * @param event
   */
  onMarkerDragEnd = (event) => {
    const newLat = event.latLng.lat();
    const newLng = event.latLng.lng();

    Geocode.fromLatLng(newLat, newLng).then((response) => {
      const address = response.results[0].formatted_address;
      const addressArray = response.results[0].address_components;
      const city = this.getCity(addressArray);
      const country = this.getCountry(addressArray);
      const { setCity, setCountry } = this.props;
      setCity(city);
      setCountry(country);
      this.setState({
        address: address || '',
        city: city || '',
        country: country || ''
      });
    });
  };

  render() {
    const { google, zoom, height, center } = this.props;
    const { mapPosition, address, country, city, markerPosition } = this.state;
    const AsyncMap = withScriptjs(
      withGoogleMap(() => (
        <GoogleMap
          google={google}
          defaultZoom={zoom}
          defaultCenter={{
            lat: mapPosition.lat,
            lng: mapPosition.lng
          }}
        >
          {/* For Auto complete Search Box */}
          <Autocomplete
            style={{
              width: '100%',
              height: '40px',
              paddingLeft: '16px',
              marginTop: '2px',
              marginBottom: '100px'
            }}
            onPlaceSelected={this.onPlaceSelected}
            types={['(regions)']}
          />
          {/* Marker */}
          <Marker
            google={google}
            name="Marker"
            draggable
            onDragEnd={this.onMarkerDragEnd}
            position={{
              lat: markerPosition.lat,
              lng: markerPosition.lng
            }}
          />
          <Marker />
          {/* InfoWindow on top of marker */}
          <InfoWindow
            onClose={this.onInfoWindowClose}
            position={{
              lat: markerPosition.lat + 0.0018,
              lng: markerPosition.lng
            }}
          >
            <div>
              <span style={{ padding: 0, margin: 0 }}>{address}</span>
            </div>
          </InfoWindow>
        </GoogleMap>
      ))
    );
    let map;
    if (center.lat !== undefined) {
      map = (
        <div>
          <div>
            <div className="form-group">
              <label htmlFor="">Country</label>
              <input
                type="text"
                name="country"
                className="form-control"
                onChange={this.onChange}
                readOnly="readOnly"
                value={country}
              />
            </div>
            <div className="form-group">
              <label htmlFor="">City</label>
              <input
                type="text"
                name="city"
                className="form-control"
                onChange={this.onChange}
                readOnly="readOnly"
                value={city}
              />
            </div>
            <div className="form-group">
              <label htmlFor="">Address</label>
              <input
                type="text"
                name="address"
                className="form-control"
                onChange={this.onChange}
                readOnly="readOnly"
                value={address}
              />
            </div>
          </div>
          <AsyncMap
            googleMapURL="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKrbRQadkOa8UFprsK7MRlz41ULmx7GTY&libraries=places&language=en"
            loadingElement={<div style={{ height: '100%' }} />}
            containerElement={<div style={{ height }} />}
            mapElement={<div style={{ height: '100%' }} />}
          />
        </div>
      );
    } else {
      map = <div style={{ height }} />;
    }
    return map;
  }
}
export default Map;
