import Container from 'react-bootstrap/Container';
import Table from 'react-bootstrap/Table';
import { useState, useEffect } from 'react';
import Loading from './Loading';
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
  });

  return (
    <div className="Projects">
      <Container>
        {projects.length === 0 && <Loading />}
        <Table>
          <tbody>
            {projects.map((project) => {
              return ( <>
                <tr><th><h4>{project.name}</h4></th></tr>
                <tr><th>Role</th><td>{project.role}</td></tr>
                <tr><th>Organization</th><td>{project.organization}</td></tr>
                <tr><th>Description</th><td>{project.description}</td></tr>
              </> )
            })}
          </tbody>
        </Table>
      </Container>
    </div>
  );
}

export default Projects;
