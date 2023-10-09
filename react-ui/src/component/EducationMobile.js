import Container from 'react-bootstrap/Container';
import Table from 'react-bootstrap/Table';

import 'bootstrap/dist/css/bootstrap.css';

import React, { useState, useEffect } from 'react';

import apiUrl from '../helper/apiUrl';

function EducationMobile() {
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
        {education.map((education) => {
          if (education.degree === 'N/A') {
            education.degree = '';
          }
          if (education.honors === 'N/A') {
            education.honors = '';
          }
          function EducationTable() {
            if (education.degree && education.honors) {
              return EducationTableFull(education);
            }
            return EducationTableBrief(education);
          }

          function EducationTableFull() {
            return (
              <tbody>
                <tr><th><h4>{education.institution}</h4></th></tr>
                <tr><td>{education.degree}</td></tr>
                <tr><th>Honors</th><td>{education.honors}</td></tr>
              </tbody>
            )
          }

          function EducationTableBrief() {
            return (
              <tbody>
                <tr><th><h4>{education.institution}</h4></th></tr>
              </tbody>
            )
          }

          return (
            <>
              <Table>
                <tbody>
                  <tr><th><h4>{education.institution}</h4></th></tr>
                  <tr><td>{education.degree}</td></tr>
                  <tr><td>{education.honors}</td></tr>
                </tbody>
              </Table>
              <Table>
                <tbody>
                </tbody>
              </Table>
            </>
          )
        })}
      </Container>
    </div>
  );
}

export default EducationMobile;
