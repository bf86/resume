import Container from 'react-bootstrap/Container';
import Table from 'react-bootstrap/Table';
import { useState, useEffect } from 'react';
import Loading from './Loading';
import apiUrl from '../helper/apiUrl';

function Titles() {
  const [titles, setTitles] = useState([]);
  useEffect(() => {
    fetch(apiUrl + '/api/pg/titles')
      .then((response) => response.json())
      .then((data) => {
        setTitles(data);
      })
      .catch((err) => {
      });
  }, []);

  return (
    <div className="Titles">
      <Container>
        {titles.length === 0 && <Loading />}
        <Table>
          <tbody>
            {titles.map((title) => {
              return ( <>
                <tr><th><h4>{title.internal_title}</h4></th></tr>
                <tr><th>Common Title</th><td>{title.title}</td></tr>
                <tr><th>Organization</th><td>{title.company}</td></tr>
              </> )
            })}
          </tbody>
        </Table>
      </Container>
    </div>
  );
}

export default Titles;
