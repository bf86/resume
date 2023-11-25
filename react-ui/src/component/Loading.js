import Container from 'react-bootstrap/Container';
import React, { useState, useEffect } from 'react';

function Loading() {
  const [dots, setDots] = useState([]);

  useEffect(() => {
    setDots('');
    setTimeout(() => setDots('.'), 1000);
    setTimeout(() => setDots('..'), 2000);
    setTimeout(() => setDots('...'), 3000);
    setTimeout(() => setDots('.'), 4000);
    setTimeout(() => setDots('..'), 5000);
    setTimeout(() => setDots('...'), 6000);
  }, []);

  return ( <span>{`Loading${dots}`}</span> );
}

export default Loading;
