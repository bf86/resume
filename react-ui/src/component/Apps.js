import Container from 'react-bootstrap/Container';
import Table from 'react-bootstrap/Table';
import React, { useState, useEffect } from 'react';
import Loading from './Loading';
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
  });

  return (
    <div className="Apps">
      <Container>
        {apps.length === 0 && <Loading />}
        <Table>
          <tbody>
            {apps.map((app) => {
              app.techStack = `
                ${app.db && app.db !== 'null' ? app.db + ',' : ''}
                ${app.api && app.api !== 'null' ? app.api + ',' : ''}
                ${app.frontend && app.frontend !== 'null' ? app.frontend + ',' : ''}
                ${app.webserver && app.webserver !== 'null' ? app.webserver + ',' : ''}
                ${app.os && app.os !== 'null' ? app.os : ''}
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
