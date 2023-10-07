import React, { useState, useEffect } from 'react';
import ReactDOM from 'react-dom/client';
import Container from 'react-bootstrap/Container';

import Header from './component/Header';
import Info from './component/Info';
import Resume from './component/Resume';
import Skills from './component/Skills';

import 'bootstrap/dist/css/bootstrap.min.css';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <Container>
      <Header />
      <Resume />
      <Info />
    </Container>
  </React.StrictMode>
);
