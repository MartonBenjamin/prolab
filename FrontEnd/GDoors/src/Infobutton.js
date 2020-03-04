import React from 'react';

import {Link} from'react-router-dom';
import './Infobutton.css';
import './App.css';

function Infobutton() {
  return (
  
    <div class="container">
    <div class="inner">
        <span>Login</span>
        <div className="Reginner">
        <Link to='../SingUp'>SingUp</Link>
        <Link to='./SingIn'>SingIn</Link>
        </div>
    </div>
   </div>
         
  );
};


export default Infobutton;
