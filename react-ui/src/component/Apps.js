import Container from 'react-bootstrap/Container';
import Table from 'react-bootstrap/Table';

import 'bootstrap/dist/css/bootstrap.css';

import React, { useState, useEffect } from 'react';

import apiUrl from '../helper/apiUrl';

function Apps() {
  const [apps, setApps] = useState([]);
  useEffect(() => {
     fetch(apiUrl + '/api/pg/apps')
        .then((response) => response.json())
        .then((data) => {
          setApps(data);
        })
        .catch((err) => {
        });
  }, []);

  return (
    <div className="Apps">
      <Container>
        {apps.map((app) => {
          app.techStack = `
            ${app.database || ''}
            ${app.api || ''}
            ${app.frontend || ''}
            ${app.webserver || ''}
            ${app.os || ''}
          `;
          return (
            <>
              <Table>
                <tbody>
                  <tr><th><h3>{app.name}</h3></th></tr>
                  <tr><th>Role</th><td>{app.role}</td></tr>
                  <tr><th>Tech Stack</th><td>{app.techStack}</td></tr>
                </tbody>
              </Table>
              <Table>
                <tbody>
                  <tr><td>{app.description}</td></tr>
                </tbody>
              </Table>
            </>
          )
        })}
      </Container>
    </div>
  );
}

export default Apps;
