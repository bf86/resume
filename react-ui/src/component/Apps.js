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
              <th>Database</th>
              <th>API</th>
              <th>UI</th>
              <th>Web Server</th>
              <th>OS</th>
              <th>Role</th>
              <th>Description</th>
            </tr>
          </thead>
          <tbody>
            {apps.map((app) => {
              return (
                <tr>
                  <td>{app.name}</td>
                  <td>{app.database}</td>
                  <td>{app.api}</td>
                  <td>{app.frontend}</td>
                  <td>{app.webserver}</td>
                  <td>{app.os}</td>
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
