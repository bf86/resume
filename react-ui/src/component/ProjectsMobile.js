import Container from 'react-bootstrap/Container';
import Table from 'react-bootstrap/Table';

import 'bootstrap/dist/css/bootstrap.css';

import React, { useState, useEffect } from 'react';

import apiUrl from '../helper/apiUrl';

function ProjectsMobile() {
  const [projects, setProjects] = useState([]);
  useEffect(() => {
     fetch(apiUrl + '/api/pg/projects')
        .then((response) => response.json())
        .then((data) => {
          setProjects(data);
        })
        .catch((err) => {
        });
  }, []);

  return (
    <div className="Projects">
      <Container>
        {projects.map((project) => {
          return (
            <>
              <Table>
                <tbody>
                  <tr><th><h4>{project.name}</h4></th></tr>
                  <tr><th>Role</th><td>{project.role}</td></tr>
                  <tr><th>Organization</th><td>{project.organization}</td></tr>
                </tbody>
              </Table>
              <Table>
                <tbody>
                  <tr><td>{project.description}</td></tr>
                </tbody>
              </Table>
            </>
          )
        })}
      </Container>
    </div>
  );
}

export default ProjectsMobile;
