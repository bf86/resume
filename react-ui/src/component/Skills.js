import Container from 'react-bootstrap/Container';
import React, { useState, useEffect } from 'react';
import Loading from './Loading';
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
        {skills.length === 0 && <Loading />}
        {skills.map((skill, index) => {
          let subskills = skill.skills.map((subskill => subskill.name));
          return ( <>
            <h3>{skill.name}</h3>
            <p>{subskills.join(', ')}</p>
          </>)
        })}
      </Container>
    </div>
  );
}

export default Skills;
