import React from "react";
import 
  { 
    Navbar,
    Nav,
  } from 'react-bootstrap';

export default function Header() {
  return (
    <>
<Navbar bg="dark" variant="dark">
    <Navbar.Brand href="#home">Navbar</Navbar.Brand>
    <Nav className="mr-auto">
      <Nav.Link href="#home">Home</Nav.Link>
    </Nav>
  </Navbar>
  <br />
  <br />
        
    </>
  );
}
