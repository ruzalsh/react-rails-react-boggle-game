import { combineReducers } from 'redux'
import boogleReducer from "./boggleReducer";

const rootReducer = combineReducers({
    boogleData:boogleReducer

})

export default rootReducer;