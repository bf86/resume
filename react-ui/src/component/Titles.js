import Container from 'react-bootstrap/Container';
import Table from 'react-bootstrap/Table';

import 'bootstrap/dist/css/bootstrap.css';

import React, { useState, useEffect } from 'react';

import apiUrl from '../helper/apiUrl';

function Titles() {
  const [titles, setTitles] = useState([]);
  useEffect(() => {
     fetch(apiUrl + '/api/pg/titles')
        .then((response) => response.json())
        .then((data) => {
          setTitles(data);
        })
        .catch((err) => {
        });
  }, []);

  return (
    <div className="Titles">
      <Container>
        <Table>
          <thead>
            <tr><th>Internal Title</th><th>Common Title</th><th>Company</th></tr>
          </thead>
          <tbody>
            {titles.map((title, index) => {
              return (
                <tr>
                  <td>{title.internal_title}</td>
                  <td>{title.title}</td>
                  <td>{title.company}</td>
                </tr>
              )
            })}
          </tbody>
        </Table>
      </Container>
    </div>
  );
}

export default Titles;
