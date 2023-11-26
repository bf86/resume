import React from 'react';
import ReactDOM from 'react-dom/client';
import Container from 'react-bootstrap/Container';

import Buffer from './component/Buffer';
import Header from './component/Header';
import Info from './component/Info';
import Resume from './component/Resume';

import 'bootstrap/dist/css/bootstrap.min.css';
import './style/style.css'

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <Container>
      <Header />
      <Resume />
      <Info />
      <Buffer />
    </Container>
  </React.StrictMode>
);
