import React from 'react';
import ReactDOM from 'react-dom/client';
import Container from 'react-bootstrap/Container';

import Endpoints from './component/Endpoints';
import Header from './component/Header';
import Info from './component/Info';

import 'bootstrap/dist/css/bootstrap.min.css';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <Container>
      <Header />
      <Endpoints />
      <Info />
    </Container>
  </React.StrictMode>
);
