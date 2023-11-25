import Container from 'react-bootstrap/Container';
import React from 'react'

function Header() {
  return (
    <div className="Header">
      <Container style={{"margin-top": "15px"}}>
        <h1 class="display-4">Brian86.dev</h1>
        <p>A (partial but under rapid development) resume site / Rest API</p>
      </Container>
    </div>
  );
}

export default Header;
