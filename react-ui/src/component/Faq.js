import Container from 'react-bootstrap/Container';
import Table from 'react-bootstrap/Table';
import React, { useState, useEffect } from 'react';
import apiUrl from '../helper/apiUrl';

function Faq() {
  const [faq, setFaq] = useState([]);
  useEffect(() => {
    fetch(apiUrl + '/api/pg/faq')
      .then((response) => response.json())
      .then((data) => {
        data = data.map(function(record) {
          record.answer = record.answer.split('\n');
          return record;
        });
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
                {question.answer.map(line => <p>{line}</p>)}
              </> )
            })}
          </tbody>
        </Table>
      </Container>
    </div>
  );
}

export default Faq;
