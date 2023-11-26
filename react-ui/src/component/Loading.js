import { useState, useEffect } from 'react';

function Loading() {
  const [dots, setDots] = useState([]);

  useEffect(() => {
    function setDotsHelper(dots) {
      setDots(dots);
      dots.length < 3 ? dots += '.' : dots = '';
      setTimeout(() => setDotsHelper(dots), 1000);
    }
    setDotsHelper('');
  });

  return ( <span>{`Loading${dots}`}</span> );
}

export default Loading;
