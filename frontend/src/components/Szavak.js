import { useState } from "react";
import Col from "react-bootstrap/Col";
import Row from "react-bootstrap/Row";

export default function Szavak(props) {
  const szo = props.szo;
  // {id: 1, temaId: 3, angol: 'Ut quae velit saepe.', magyar: 'Ipsa nobis sint.', tema: 'Nisi eos.'}
  const [valaszolt, setValaszolt] = useState("");
  const [helyes, setHelyes] = useState(false);

  function ell() {
    console.log(valaszolt, szo.magyar);
    if (valaszolt === szo.magyar) {
      setHelyes(true);
    }
    console.log(helyes);
  }

  function visszajelzes() {
    let visszajelzes = "";
    if (helyes) {
      visszajelzes = "igaz";
    } else {
      visszajelzes = "hamis";
    }
    return visszajelzes;
  }

  return (
    <>
      <Row>
        <Col className={"mb-3"} sm={12} md={4}>
          {szo.angol}
        </Col>
        <Col className={"mb-3"} sm={12} md={4}>
          <input
            className="w-75"
            type="text"
            value={valaszolt}
            onChange={(e) => setValaszolt(e.target.value)}
            onBlur={() => {
              ell();
            }}
          />
        </Col>
        <Col className={"mb-3"} sm={12} md={4}>
          {visszajelzes()}
        </Col>
      </Row>
    </>
  );
}
