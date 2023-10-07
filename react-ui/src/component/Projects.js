import Container from 'react-bootstrap/Container';
import Table from 'react-bootstrap/Table';

import 'bootstrap/dist/css/bootstrap.css';

import React, { useState, useEffect } from 'react';

import apiUrl from '../helper/apiUrl';

function Projects() {
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
        <Table>
          <thead>
            <tr>
              <th>Name</th>
              <th>Description</th>
              <th>Role</th>
              <th>Organization</th>
              {/* <th>Aprox. Number of Collaborators</th> */}
            </tr>
          </thead>
          <tbody>
            {projects.map((project) => {
              return (
                <tr>
                  <td>{project.name}</td>
                  <td>{project.description}</td>
                  <td>{project.role}</td>
                  <td>{project.organization}</td>
                  {/* <!--<td>{project.aprox_num_collaborators}</td>--> */}
                </tr>
              )
            })}
          </tbody>
        </Table>
      </Container>
    </div>
  );
}

export default Projects;
