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
        <Table>
          <thead>
            <tr>
              <th>Name</th>
              <th>Tech stach</th>
              <th>Role</th>
              <th>Description</th>
            </tr>
          </thead>
          <tbody>
            {apps.map((app) => {
              app.techStack = `
                ${app.database}
                ${app.api}
                ${app.frontend}
                ${app.webserver}
                ${app.os}
              `;
              return (
                <tr>
                  <td>{app.name}</td>
                  <td>{app.techStack}</td>
                  <td>{app.role}</td>
                  <td>{app.description}</td>
                </tr>
              )
            })}
          </tbody>
        </Table>
      </Container>
    </div>
  );
}

export default Apps;
