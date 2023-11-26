import Accordion from 'react-bootstrap/Accordion';
import Container from 'react-bootstrap/Container';
import React from 'react';

import Apps from './Apps';
import Education from './Education';
import Faq from './Faq';
import Projects from './Projects';
import Recommendations from './Recommendations';
import Skills from './Skills';
import Titles from './Titles';

function Resume() {
  return (
    <div className="Resume">
      <Container>
        <p class="display-6">Resume</p>
          <Accordion>
            <Accordion.Item eventKey="Skills">
              <Accordion.Header>Skills and Experience</Accordion.Header>
              <Accordion.Body>
                <Skills />
              </Accordion.Body>
            </Accordion.Item>
            <Accordion.Item eventKey="Titles">
              <Accordion.Header>Titles</Accordion.Header>
              <Accordion.Body>
                <Titles />
              </Accordion.Body>
            </Accordion.Item>
            <Accordion.Item eventKey="Apps">
              <Accordion.Header>Apps</Accordion.Header>
              <Accordion.Body>
                <Apps />
              </Accordion.Body>
            </Accordion.Item>
            <Accordion.Item eventKey="Projects">
              <Accordion.Header>Projects</Accordion.Header>
              <Accordion.Body>
                <Projects />
              </Accordion.Body>
            </Accordion.Item>
            <Accordion.Item eventKey="Education">
              <Accordion.Header>Education</Accordion.Header>
              <Accordion.Body>
                <Education />
              </Accordion.Body>
            </Accordion.Item>
            <Accordion.Item eventKey="Recommendations">
              <Accordion.Header>Recommendations</Accordion.Header>
              <Accordion.Body>
                <Recommendations />
              </Accordion.Body>
            </Accordion.Item>
            <Accordion.Item eventKey="FAQ">
              <Accordion.Header>FAQ</Accordion.Header>
              <Accordion.Body>
                <Faq />
              </Accordion.Body>
            </Accordion.Item>
          </Accordion>
      </Container>
    </div>
  );
}

export default Resume;
