import React from "react";
import {connect} from "react-redux";
import {validate} from "../store/actions/BoggleAction";


class Boggle extends React.Component {

    constructor(props) {
        super(props);

        this.state = {
            points: "",
            totalPoints: "",
            currentWord : [],
            dice: [],
            value:''
        }
    }

    componentDidMount() {
        this.randomizer();
    }

    randomizer = () => {
        let chars ='ABCDEFGHIJKLMNOPQRSTUVWXYZ';
        let dice = this.state.dice;
        for (let i = 0; i < 25; i++) {
            let result = chars[Math.floor(Math.random() * chars.length)];
            dice.push(result);
        }
        this.setState({
            dice : dice
        })
    };

    getSelectedAlphabet = (val)  => {
        let value = this.state.value
        if (value==="") {
            value = "";
        }
        let s =value.concat(val)

        this.setState({
            value : s
        })
    }

    render() {
        let diceData = this.state.dice;
        return (

            <div>

                <section id="game">
                    <header>
                    </header>
                    <section id="dice-grid">
                        <div className="dice">
                            {diceData.map((data,index)=>{
                                return <button key={index} onClick={()=>{this.getSelectedAlphabet(data)}}>{data}</button>
                            })}
                        </div>
                    </section>
                    <section id="word-info">
                        <div id="word-holder">
                            <h5>Word: {this.state.value}</h5>
                            <p id="current-word"></p>
                        </div>
                        <button id="submit-btn" onClick={()=>{this.props.boggleAction(data)}}>Submit Word</button>
                    </section>
                    <table id="score-table">
                        <tbody>
                        <tr>
                            <th>Word</th>
                            <th>Score</th>
                        </tr>
                        <tr>
                            <td>Total:</td>
                            <td id="total-points">0</td>
                        </tr>
                        </tbody>

                    </table>
                </section>
            </div>
        );
    }
};

const mapStateToProps= state => {
    return{
        data: state.boogleData
    }
}

const mapDispatchToProps={
    boggleAction:validate
}
export default connect(mapStateToProps,mapDispatchToProps)(Boggle);