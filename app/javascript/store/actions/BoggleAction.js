import axios from 'axios'

export const boggle = {
    action: 'BOGGLE_ACTION',
    success: 'BOGGLE_ACTION_SUCCESS',
    failure: 'BOGGLE_ACTION_FAILURE',
}

export function boggleAction(data) {
    return {type: boggle.action, payload: data};
}

export function boggleActionResponseError(data) {
    return {type: boggle.success, payload: data}
}

export function boggleActionError(data) {
    return {type: boggle.failure, payload: data}
}

export const validate = (payload) => {
    console.log(payload)
    return (dispatch) => {
        dispatch(boggleAction)
        axios.post("/check", {
            word: 'foo',
            alphabets_on_boggle: 'bar',
            matrix_size: 1
        })
            .then(response => {
                dispatch(boggleActionResponseError(response.data))
            })
            .catch(error => {
                const errorMsg = error.message
                dispatch(boggleActionError(errorMsg));
            })
    }
}