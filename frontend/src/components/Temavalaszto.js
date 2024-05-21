import { useState } from "react";
import Form from "react-bootstrap/Form";
import useDataContext from "../models/DataContext";

export default function Temavalaszto(props) {
  const [temaId, setTemaId] = useState("");
  const { szavak } = useDataContext();

  return (
    <Form>
      <Form.Group className="mb-3">
        <Form.Label>Válassz témát!</Form.Label>

        <Form.Select
          required
          value={temaId}
          onChange={(e) => setTemaId(e.target.value)}
        >
          <option value={""}>Kérlek válassz....</option>
          {szavak.map((e, i) => {
            return (
              <option value={e.temaId} key={i}>
                {e.tema}
              </option>
            );
          })}
        </Form.Select>
      </Form.Group>
    </Form>
  );
}
