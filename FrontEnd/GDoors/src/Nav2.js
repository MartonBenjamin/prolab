

import React, { useState } from 'react';
import { Collapse, Navbar, NavbarToggler, NavbarBrand, Nav, NavItem, NavLink } from 'reactstrap';
import 'bootstrap/dist/css/bootstrap.min.css';

const Example = (props) => {
  const [collapsed, setCollapsed] = useState(true);

  const toggleNavbar = () => setCollapsed(!collapsed);

  return (
    
    <div className="NavBarr">
      <Navbar color="faded" light >
        <NavbarBrand href="/" className="mr-auto">AFP4GarageDoors</NavbarBrand>
        <NavbarToggler onClick={toggleNavbar} className="mr-2" />
        <Collapse isOpen={!collapsed} navbar>
          <Nav navbar>

            <NavItem>
              <NavLink href="/">Home</NavLink>
            </NavItem>

            <NavItem>
              <NavLink href="/About">About</NavLink>
            </NavItem>

            <NavItem>
              <NavLink href="/Shop">Shop</NavLink>
            </NavItem>
            <NavItem>
              <NavLink href="/SingIn">SingIn</NavLink>
            </NavItem>

            <NavItem>
              <NavLink href="/SingUp">SingUp</NavLink>
            </NavItem>

            <NavItem>
              <NavLink href="/Album">Album</NavLink>
            </NavItem>

            <NavItem>
              <NavLink href="https://github.com/MartonBenjamin/prolab">GitHub</NavLink>
            </NavItem>

          </Nav>
        </Collapse>
      </Navbar>
      
    </div>
  );
}

export default Example;