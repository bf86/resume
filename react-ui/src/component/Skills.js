import Accordion from 'react-bootstrap/Accordion';
import Container from 'react-bootstrap/Container';

import 'bootstrap/dist/css/bootstrap.css';

import React, { useState, useEffect } from 'react';

import apiUrl from '../helper/apiUrl';

function Skills() {
  const [skills, setSkills] = useState([]);
  useEffect(() => {
     fetch(apiUrl + '/api/pg/skills')
        .then((response) => response.json())
        .then((data) => {
          setSkills(data);
        })
        .catch((err) => {
        });
  }, []);

  return (
    <div className="Skills">
      <Container>
          <Accordion>
            {skills.map((skill, index) => {
              return (
                <Accordion.Item eventKey={index}>
                  <Accordion.Header>{skill.name}</Accordion.Header>
                  <Accordion.Body>
                    {skill.skills.map((subSubskill, index) => {
                      return <p>{subSubskill.name}</p>
                    })}
                  </Accordion.Body>
                </Accordion.Item>
              )
            })}
          </Accordion>
      </Container>
    </div>
  );
}

export default Skills;
