import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';

//import React from 'react';
//import logo from './logo.svg';




import { BrowserRouter,Switch ,Route,Link } from "react-router-dom";
import Shop from './Shop';

import Home from './Home';
import Nav2 from './Nav2';
import SignIn from './Singin';
import SignUp from './SingUp';

import Infobutton from './InfoButton';
import './App.css';
import RightBar from './RightBar';

import About from './About';
import Nav from './Nav';



class App extends Component {
  render() {
    return (
        <div className="overlay">
            <BrowserRouter>
                <div className="App">



                    <Nav></Nav>

                    <Switch>

                        <Route path="/Nav2" exact component={Nav2} />

                        <Route path="/" exact component={Home} />
                        <Route path="/About" exact component={About} />

                        <Route path="/shop" exact component={Shop} />
                        <Route path="/SingIn" exact component={SignIn} />
                        <Route path="/SingUp" exact component={SignUp} />

                    </Switch>







                </div>

            </BrowserRouter>
        </div>
    );
  }
}

export default App;
