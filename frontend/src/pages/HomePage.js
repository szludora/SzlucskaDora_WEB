import Container from "react-bootstrap/Container";
import Col from "react-bootstrap/Col";
import Row from "react-bootstrap/Row";

import { useEffect } from "react";
import useDataContext from "../models/DataContext";
import Szavak from "../components/Szavak";
import Temavalaszto from "../components/Temavalaszto";

export default function HomePage() {
  const { szavak, szavakLekerdez } = useDataContext();

  useEffect(() => {
    szavakLekerdez();
  }, []);

  return (
    <Container fluid className="h4 bg-light">
      <Temavalaszto />
      <Row className="hideOnMobile">
        <Col>ANGOL</Col>
        <Col>MAGYAR</Col>
        <Col>visszajelzés</Col>
      </Row>
      {szavak.map((e, i) => {
        return <Szavak szo={e} key={i}></Szavak>;
      })}
    </Container>
  );
}
