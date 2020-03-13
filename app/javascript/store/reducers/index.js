import { combineReducers } from 'redux'
import boogleReducer, { getPossibleWordsReducer } from "./boggleReducer";

const rootReducer = combineReducers({
    boogleData:boogleReducer,
    getPossibleWordsData:getPossibleWordsReducer

})

export default rootReducer;