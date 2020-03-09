const initialState = {
    data: ''
};

function boogleReducer(state = initialState, action) {
    switch(action.type) {
        case 'BOGGLE_ACTION_FAILURE':
        case 'BOGGLE_ACTION_SUCCESS':
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