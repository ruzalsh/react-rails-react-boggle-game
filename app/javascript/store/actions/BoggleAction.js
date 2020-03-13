import axios from 'axios'

export const boggle = {
    action: 'BOGGLE_ACTION',
    success: 'BOGGLE_ACTION_SUCCESS',
    failure: 'BOGGLE_ACTION_FAILURE',
    getWords: 'BOGGLE_WORDS'
}

export function boggleAction(data) {
    return {type: boggle.action, payload: data};
}

export function boggleActionResponse(data) {
    return {type: boggle.success, payload: data}
}

export function boggleActionError(data) {
    return {type: boggle.failure, payload: data}
}

export function boglePossibleWords(data) {
    return {type: boggle.getWords, payload: data}
}

export function bogglePossibleWordsError(data) {
    return {type: boggle.getWords, payload: data}
}

export const validate = (payload) => {
    return (dispatch) => {
        dispatch(boggleAction)
        return axios({
            method: 'post',
            url: "/check",
            data: payload
          }).then(response => {
                return dispatch(boggleActionResponse(response.data))
            })
            .catch(error => {
                const errorMsg = error.message
                return dispatch(boggleActionError(errorMsg));
            })
    }
}

export const getPossibleWords = (payload) => {
    return (dispatch) => {
        return axios({
            method : 'post',
            url: "/getPossibleWords",
            data:payload
        }).then(response => {
            return dispatch(boglePossibleWords(response.data))
        })
        .catch(error => {
            const errorMsg = error.message
            return dispatch(bogglePossibleWordsError(errorMsg));
        })
    }
}