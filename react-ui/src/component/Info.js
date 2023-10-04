import React from 'react'
import Accordion from 'react-bootstrap/Accordion';
import Container from 'react-bootstrap/Container';

function Releases() {
  return (
    <div className="Releases" style={{"margin-top": "15px"}}>
      <Container>
        <p class="display-6">Additional Info</p>
        <Accordion>
          <Accordion.Item eventKey="0">
            <Accordion.Header>Tech Stack</Accordion.Header>
            <Accordion.Body>
              <p>This API built with:</p>
              <ul>
                <li>Google Virtual Private Cloud</li>
                <li>Extremely lightweight E2 Micro Ubuntu VM</li>
                <li>Docker</li>
                <ul>
                  <li>PostgreSQL Database</li>
                  <li>NodeJS (Fastify) API</li>
                  <li>React Front-End</li>
                  <li>Nginx Reverse Proxy + SSL</li>
                </ul>
                <li>Google Cloud Firewall</li>
                <li>Custom monitoring system</li>
                <ul>
                  <li>Hourly checks for each API endpoint, disk space, malicious requests</li>
                </ul>
              </ul>
            </Accordion.Body>
          </Accordion.Item>
          <Accordion.Item eventKey="1">
            <Accordion.Header>Releases</Accordion.Header>
            <Accordion.Body>
            <ul style={{"font-family": "monospace"}}>
              <li>2023-10-07 15:20 0.1.0 Move API documentation to React</li>
              <li>2023-09-29 11:59 0.0.11 SSL for pg, create .bash_profile, add ncdu to provision script</li>
              <li>2023-09-28 11:09 0.0.10 add basic monitoring scripts</li>
              <li>2023-09-28 07:50 0.0.9 clean up response definitions</li>
              <li>2023-09-27 20:55 0.0.8 add /education, minor html cleanup</li>
              <li>2023-09-27 00:55 0.0.7 add release information</li>
              <li>2023-09-27 00:55 0.0.6 add accordions to landing page for maximum polka</li>
              <li>2023-09-26 11:40 0.0.5 add db seed script</li>
              <li>2023-09-26 11:11 0.0.4 add rate limit, fix /projects link</li>
              <li>2023-09-26 10:20 0.0.3 add /projects and /titles endpoints</li>
              <li>2023-09-25 08:43 0.0.2 add pg endpoints and remove fixture endpoints</li>
              <li>2023-09-24 09:26 0.0.1 initial release! skills and skill types endpoints, landing page</li>
            </ul>
            </Accordion.Body>
          </Accordion.Item>
          <Accordion.Item eventKey="2">
            <Accordion.Header>Contact</Accordion.Header>
            <Accordion.Body>
            <ul>
              <li><a href="https://github.com/bf86/resume" target="_blank">GitHub</a></li>
              <li><a href="https://www.linkedin.com/in/briangfink/" target="_blank">LinkedIn</a></li>
              <li>brian.g.fink@gmail.com</li>
              <li>617-460-5059</li>
            </ul>
            </Accordion.Body>
          </Accordion.Item>
        </Accordion>
      </Container>
    </div>
  );
}

export default Releases;
