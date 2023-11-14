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
        {education.length === 0 && <p> Loading... </p>}
        {education.map((education) => {
          if (education.degree === 'N/A') {
            education.degree = '';
          }
          if (education.honors === 'N/A') {
            education.honors = '';
          }
          education.detail = `${education.degree || education.field}`;
          if (education.honors) {
            education.detail += ` - ${education.honors}`;
          }
          return (
            <>
              <Table>
                <tbody>
                  <tr><th><h4>{education.institution}</h4></th></tr>
                  <tr><td>{education.detail}</td></tr>
                </tbody>
              </Table>
            </>
          )
        })}
      </Container>
    </div>
  );
}

export default Education;
