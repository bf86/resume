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
        {apps.length === 0 && <p> Loading... </p>}
        <Table>
          <tbody>
            {apps.map((app) => {
              app.techStack = `
                ${app.database || ''}
                ${app.api || ''}
                ${app.frontend || ''}
                ${app.webserver || ''}
                ${app.os || ''}
              `;
              return ( <>
                <tr><th><h3>{app.name}</h3></th></tr>
                <tr><th>Role</th><td>{app.role}</td></tr>
                <tr><th>Tech Stack</th><td>{app.techStack}</td></tr>
                <tr><th>Description</th><td>{app.description}</td></tr>
              </> )
            })}
          </tbody>
        </Table>
      </Container>
    </div>
  );
}

export default Apps;
