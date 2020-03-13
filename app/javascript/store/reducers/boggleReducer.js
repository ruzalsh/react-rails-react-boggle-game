const initialState = {
    data: '',
    success: false,
    point: '',
    possibleWords:null
};

function boogleReducer(state = initialState, action) {
    switch(action.type) {
        case 'BOGGLE_ACTION_FAILURE':
            return{
                ...state,
                success:false
            }
        case 'BOGGLE_WORDS':
            return {
                ...state,
                possibleWords:action.payload
            }
        case 'BOGGLE_ACTION_SUCCESS':
            return {
                ...state,
                data:action.payload,
                point: action.payload.score,
                success:true
            }
        case 'BOGGLE_ACTION':
            console.log("apple",action.payload)
            return {
                ...state,
                data:action.payload

            };



        default:
            return state;
    };
}

export default boogleReducer;

export function getPossibleWordsReducer(state = initialState, action) {
    switch(action.type) {
        case 'POSSIBLE_WORDS_FAILURE':
            return{
                ...state,
                success:false
            }
        case 'POSSIBLE_WORDS':
            return {
                ...state,
                possibleWords:action.payload
            }
        case 'POSSIBLE_WORDS_SUCCESS':
            return {
                ...state,
                data:action.payload,
                point: action.payload.score,
                success:true
            }
        case 'POSSIBLE_WORDS_ACTION':
            return {
                ...state,
                data:action.payload

            };



        default:
            return state;
    };
}