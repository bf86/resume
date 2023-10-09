import Accordion from 'react-bootstrap/Accordion';
import Container from 'react-bootstrap/Container';
import React from 'react';

import Apps from './Apps';
import AppsMobile from './AppsMobile';
import Education from './Education';
import EducationMobile from './EducationMobile';
import Skills from './Skills';
import Projects from './Projects';
import ProjectsMobile from './ProjectsMobile';
import Titles from './Titles';
import TitlesMobile from './TitlesMobile';

import 'bootstrap/dist/css/bootstrap.css';

function Resume() {
  return (
    <div className="Resume">
      <Container>
        <p class="display-6">Resume</p>
          <Accordion>
            <Accordion.Item eventKey="0">
              <Accordion.Header>Skills and Experience</Accordion.Header>
              <Accordion.Body>
                <Skills />
              </Accordion.Body>
            </Accordion.Item>
            <Accordion.Item eventKey="1">
              <Accordion.Header>Titles</Accordion.Header>
              <Accordion.Body>
                <TitlesMobile />
              </Accordion.Body>
            </Accordion.Item>
            <Accordion.Item eventKey="2">
              <Accordion.Header>Apps</Accordion.Header>
              <Accordion.Body>
                <AppsMobile />
              </Accordion.Body>
            </Accordion.Item>
            <Accordion.Item eventKey="3">
              <Accordion.Header>Projects</Accordion.Header>
              <Accordion.Body>
                <ProjectsMobile />
              </Accordion.Body>
            </Accordion.Item>
            <Accordion.Item eventKey="4">
              <Accordion.Header>Education</Accordion.Header>
              <Accordion.Body>
                <EducationMobile />
              </Accordion.Body>
            </Accordion.Item>
          </Accordion>
      </Container>
    </div>
  );
}

export default Resume;
