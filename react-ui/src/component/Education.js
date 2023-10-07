import Container from 'react-bootstrap/Container';
import Table from 'react-bootstrap/Table';

import 'bootstrap/dist/css/bootstrap.css';

import React, { useState, useEffect } from 'react';

import apiUrl from '../helper/apiUrl';

function Education() {
  const [education, setEducation] = useState([]);
  useEffect(() => {
     fetch(apiUrl + '/api/pg/education')
        .then((response) => response.json())
        .then((data) => {
          setEducation(data);
        })
        .catch((err) => {
        });
  }, []);

  return (
    <div className="Education">
      <Container>
        <Table>
          <thead>
            <tr>
              <th>Institution</th>
              <th>Degree</th>
              <th>Field</th>
              <th>Honors</th>
            </tr>
          </thead>
          <tbody>
            {education.map((education) => {
              return (
                <tr>
                  <td>{education.institution}</td>
                  <td>{education.degree}</td>
                  <td>{education.field}</td>
                  <td>{education.honors}</td>
                </tr>
              )
            })}
          </tbody>
        </Table>
      </Container>
    </div>
  );
}

export default Education;
