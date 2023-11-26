import Accordion from 'react-bootstrap/Accordion';
import Container from 'react-bootstrap/Container';

function Info() {
  return (
    <div className="Info" style={{"margin-top": "15px"}}>
      <Container>
        <p class="display-6">Additional Info</p>
        <Accordion>
          <Accordion.Item eventKey="0">
            <Accordion.Header>Tech Stack</Accordion.Header>
            <Accordion.Body>
              <p>This site built with:</p>
              <ul>
                <li>Google Virtual Private Cloud</li>
                <li>E2 Micro Ubuntu VM</li>
                <li>Docker</li>
                <ul>
                  <li>PostgreSQL Database</li>
                  <li>Redis Cache</li>
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
              <li>2023-11-25 19:09 0.2.2 Increase rate limit, redis for all endpoints, animated loading component, misc code cleanup</li>
              <li>2023-11-25 12:47 0.2.1 Add line breaks to FAQ answers + add React build step to deploy script</li>
              <li>2023-11-25 09:26 0.2.0 Add hostname to cron email</li>
              <li>2023-11-24 22:22 0.2.0 Dev workflow and code improvements</li>
              <li>2023-11-21 16:06 0.1.9 Add Redis cache</li>
              <li>2023-11-14 09:40 0.1.8 Add basic loading states</li>
              <li>2023-11-11 19:50 0.1.7 Add FAQ, minor README changes</li>
              <li>2023-11-02 08:02 0.1.6 Fix endpoint tests and recommendations mobile layout</li>
              <li>2023-10-21 08:35 0.1.5 Add recommendations, top margin</li>
              <li>2023-10-11 21:03 0.1.4 Fix production layout</li>
              <li>2023-10-09 11:07 0.1.3 Improve skills view</li>
              <li>2023-10-09 10:21 0.1.2 Mobile friendly layout</li>
              <li>2023-10-08 21:42 0.1.1 An actual front end sort of instead of API docs</li>
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
              <li><a href="https://github.com/bf86/resume" target="_blank" rel="noreferrer">GitHub</a></li>
              <li><a href="https://www.linkedin.com/in/briangfink/" target="_blank" rel="noreferrer">LinkedIn</a></li>
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

export default Info;
