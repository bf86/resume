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
        data = data.map(function(record) {
          console.log(record);
          record.techStack = [
            record.db,
            record.api,
            record.frontend,
            record.webserver,
            record.os
          ]
            .filter(element => element)
            .join(', ');
          return record;
        });
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
