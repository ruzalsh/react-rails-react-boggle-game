import React from "react";
import { connect } from "react-redux";
import { validate, getPossibleWords } from "../store/actions/boggleAction";
import { CountdownCircleTimer } from "react-countdown-circle-timer";

const renderTime = value => {
    if (value === 0) {
        return <div className="timer">Too lale...</div>;
    }

    return (
        <div className="timer">
            <div className="text">Remaining</div>
            <div className="value">{value}</div>
            <div className="text">seconds</div>
        </div>
    );
};


class Boggle extends React.Component {

    constructor(props) {
        super(props);

        this.state = {
            points: 0,
            totalPoints: "",
            currentWord: [],
            dice: [],
            value: '',
            timeupFlag: false,
            possibleWords: []
        }
    }

    componentDidMount() {
        this.randomizer();
        this.props.getPossibleWords({
            "alphabets_on_boggle": "abcdefghi",
            "matrix_size": "3x3"
        }).then(res => {
            if (res) {
                if (res.payload) {
                    if (res.payload.data) {
                        this.setState({
                            possibleWords: res.payload.data

                        })
                    }
                }
            }
        });
    }

    randomizer = () => {
        let chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
        let dice = this.state.dice;
        for (let i = 0; i < 16; i++) {
            let result = chars[Math.floor(Math.random() * chars.length)];
            dice.push(result);
        }
        this.setState({
            dice: dice
        })
    };

    getSelectedAlphabet = (val) => {
        let value = this.state.value
        if (value === "") {
            value = "";
        }
        let s = value.concat(val)

        this.setState({
            value: s
        })
    }

    sendGameWords = () => {
        let apiData = {
            "word": this.state.value,
            "alphabets_on_boggle": this.state.dice.toString,
            "matrix_size": "4x4"
            // "word": "bed",
            // "alphabets_on_boggle": "abcdefghi",
            // "matrix_size": "3x3"
        }
        this.props.boggleAction(apiData).then(res => {
            console.log("res", res)
            if (res) {
                if (res.payload) {
                    if (res.payload.data) {
                        if (res.payload.data.score) {
                            let addScore = res.payload.data.score
                            console.log("addscore", addScore)
                            let latestScore = this.state.points + addScore
                            this.setState({
                                points: latestScore
                            })
                        }
                    }
                }

            }
        }
        )

        this.setState({
            value: ''
        })
    }


    reset = () => {
        window.location.reload();
    }

    handleTimeUp = () => {
        this.setState({
            timeupFlag: true
        })
    }

    replay = () => {
        this.setState({
            timeupFlag: false
        })
    }


    render() {
        let diceData = this.state.dice;
        console.log("state", this.state)
        return (
            <div>
                {this.state.timeupFlag &&
                    <div id="game">
                        <h1>Game Over</h1>
                        <div>
                            <button onClick={this.replay}>New Game</button>
                        </div>
                        <table id="score-table">
                            <tbody>
                                <tr>
                                    <th>Word</th>
                                    <th>Score</th>
                                </tr>
                                <tr>
                                    <td>Total:</td>
                                    <td id="total-points">{this.state.points}</td>
                                </tr>
                            </tbody>

                        </table>
                        <span>
                            <h4>Possible Words in Boggler are:</h4>
                            <ul>
                                {this.state.possibleWords.map((value, index) => {
                                    return <li key={index}>{value}</li>
                                })}
                            </ul>
                            {/* {this.state.possibleWords} */}
                        </span>
                    </div>}
                {!this.state.timeupFlag &&
                    <div>

                        <section id="game">
                            <button id="danger-btn" onClick={() => this.reset()}>Reset</button>
                            <section id="dice-grid">
                                <div className="dice">
                                    {diceData.map((data, index) => {
                                        return <button key={index} onClick={() => { this.getSelectedAlphabet(data) }}>{data}</button>
                                    })}
                                </div>
                            </section>
                            <section id="word-info">
                                <div id="word-holder">
                                    <h5>Word: {this.state.value}</h5>
                                    <p id="current-word"></p>
                                </div>
                                <button id="submit-btn" onClick={() => this.sendGameWords()}>Submit Word</button>
                            </section>
                            <table id="score-table">
                                <tbody>
                                    <tr>
                                        <th>Word</th>
                                        <th>Score</th>
                                    </tr>
                                    <tr>
                                        <td>Total:</td>
                                        <td id="total-points">{this.state.points}</td>
                                    </tr>
                                </tbody>

                            </table>
                            <span className="countdown">
                                <CountdownCircleTimer
                                    isPlaying
                                    durationSeconds={180}
                                    colors={[["#004777", 0.33], ["#F7B801", 0.33], ["#A30000"]]}
                                    renderTime={renderTime}
                                    onComplete={() => { this.handleTimeUp() }}
                                />
                            </span>
                        </section>
                    </div>
                }
            </div>
        );
    }
};

const mapStateToProps = state => {
    return {
        data: state.boogleData,
        getPossibleWordsData: state.getPossibleWordsData
    }
}

const mapDispatchToProps = {
    boggleAction: validate,
    getPossibleWords: getPossibleWords
}
export default connect(mapStateToProps, mapDispatchToProps)(Boggle);