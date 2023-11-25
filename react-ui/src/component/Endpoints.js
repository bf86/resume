import React from 'react'
import Accordion from 'react-bootstrap/Accordion';
import Container from 'react-bootstrap/Container';

import appDef from '../response-definitions/appDef';
import projectDef from '../response-definitions/projectDef';
import skillDef from '../response-definitions/skillDef';
import skillTypeDef from '../response-definitions/skillTypeDef';
import titleDef from '../response-definitions/titleDef';
import educationDef from '../response-definitions/educationDef';

const endpoints = [
  { method: 'GET', uri: '/api/pg/apps', definition: appDef },
  { method: 'GET', uri: '/api/pg/projects', definition: projectDef },
  { method: 'GET', uri: '/api/pg/skills', definition: skillDef },
  { method: 'GET', uri: '/api/pg/skill-types', definition: skillTypeDef },
  { method: 'GET', uri: '/api/pg/titles', definition: titleDef },
  { method: 'GET', uri: '/api/pg/education', definition: educationDef }
];

function Endpoints() {
  return (
    <div className="Endpoints">
      <Container>
        <p class="display-6">Reponse definitions</p>
        <Accordion defaultActiveKey="0">
          {endpoints.map((endpoint, index) => {
            return (
              <Accordion.Item eventKey={index}>
                <Accordion.Header>{endpoint.method} {endpoint.uri}</Accordion.Header>
                <Accordion.Body>
                  <textarea
                    name="name"
                    rows={endpoint.definition.split('\n').length}
                    cols="80"
                    disabled="true"
                    style={{"font-family":"monospace","max-width":"100%"}}
                  >
                    {endpoint.definition}
                  </textarea>
                  <div class="row">
                    <a href={'https://brian86.dev' + endpoint.uri} target="_blank">Try it</a>
                  </div>
                </Accordion.Body>
              </Accordion.Item>
            )
          })}
        </Accordion>
      </Container>
    </div>
  );
}

export default Endpoints;
