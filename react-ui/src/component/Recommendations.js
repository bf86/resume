import Container from 'react-bootstrap/Container';
import Table from 'react-bootstrap/Table';

import 'bootstrap/dist/css/bootstrap.css';

import React, { useState, useEffect } from 'react';

import apiUrl from '../helper/apiUrl';

function Recommendations() {
  const [recommendations, setRecommendations] = useState([]);
  useEffect(() => {
     fetch(apiUrl + '/api/pg/recommendations')
        .then((response) => response.json())
        .then((data) => {
          setRecommendations(data);
        })
        .catch((err) => {
        });
  }, []);

  return (
    <div className="Recommendations">
      <Container>
        <Table>
          <tbody>
            {recommendations.map((recommendation) => {
              return ( <>
                <tr><th><h4>{recommendation.source}</h4></th></tr>
                <tr><th>Title</th><td>{recommendation.title}</td></tr>
                <tr><th>View</th><a href={recommendation.url}>LinkedIn</a></tr>
                <tr><th>Transcript</th><td>"{recommendation.transcript}"</td></tr>
              </> )
            })}
          </tbody>
        </Table>
      </Container>
    </div>
  );
}

export default Recommendations;
