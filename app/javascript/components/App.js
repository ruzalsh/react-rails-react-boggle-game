import React from 'react'
// import '../../assets/stylesheets/App.css';
import '../../assets/stylesheets/App.css'
import Boggle from "./Boggle";
import {Provider} from "react-redux";
import store from '../store/store';

class App extends React.Component{
    render(){
        return (
            // <div>
            <Provider store={store}>
                <Boggle/>
            </Provider> 
            //  </div> 
        )
    }
}
export default App