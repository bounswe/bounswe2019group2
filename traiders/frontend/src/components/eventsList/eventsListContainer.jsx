import { connect } from 'react-redux';

import EventsList from './eventsList';
import {
  getEvents,
  getEventsWithAuthorization
} from '../../redux/events/actions';

const mapStateToProps = (state) => {
  return {
    user: state.user.currentUser,
    eventsList: state.events.eventsList
  };
};

const mapDispatchToProps = {
  getEvents,
  getEventsWithAuthorization
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(EventsList);
