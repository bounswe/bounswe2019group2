import { connect } from 'react-redux';

import EventsList from './eventsList';
import { getEvents } from '../../redux/events/actions';

const mapStateToProps = (state) => {
  return {
    eventsList: state.events.eventsList
  };
};

const mapDispatchToProps = {
  getEvents
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(EventsList);
