import { createStore, combineReducers, applyMiddleware } from "redux";
import thunk from "redux-thunk";

import xmlRequestService from "../utils/services";
import authReducer from "./auth/reducer";
import userReducer from "./userDetails/reducer";

const reducers = combineReducers({
  auth: authReducer,
  userDetails: userReducer
});

const store = createStore(
  reducers,
  applyMiddleware(thunk.withExtraArgument(xmlRequestService))
);

export default store;
