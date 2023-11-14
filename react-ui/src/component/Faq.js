import Container from 'react-bootstrap/Container';
import Table from 'react-bootstrap/Table';

import 'bootstrap/dist/css/bootstrap.css';

import React, { useState, useEffect } from 'react';

import apiUrl from '../helper/apiUrl';

function Faq() {
  const [faq, setFaq] = useState([]);
  useEffect(() => {
     fetch(apiUrl + '/api/pg/faq')
        .then((response) => response.json())
        .then((data) => {
          setFaq(data);
        })
        .catch((err) => {
        });
  }, []);

  return (
    <div className="Faq">
      <Container>
        {faq.length === 0 && <p> Loading... </p>}
        <Table>
          <tbody>
            {faq.map((question) => {
              return ( <>
                <tr><th><h4>{question.question}</h4></th></tr>
                <tr><td>{question.answer}</td></tr>
              </> )
            })}
          </tbody>
        </Table>
      </Container>
    </div>
  );
}

export default Faq;
