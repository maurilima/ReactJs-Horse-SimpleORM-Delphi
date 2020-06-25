import React from "react";
import { Form, Col, Button, Container } from "react-bootstrap";
import useFormImput from "../../lib/FormInput";

export default function PedidoEditar() {
  const pedNome = useFormImput("");

  function handleSubmit(event) {
    event.preventDefault();
  }

  return (
    <Container>
      <Form onSubmit={handleSubmit} id="EditarPedido">
        <Form.Row>
          <Form.Group as={Col} controlId="formGridEmail">
            <Form.Label>Nome</Form.Label>
            <input
              {...pedNome}
              type="text"
              className="form-control"
              id="pedNome"
              placeholder="Entre com o Nome"
            />
          </Form.Group>

          <Form.Group as={Col} controlId="formGridPassword">
            <Form.Label>Password</Form.Label>
            <Form.Control type="password" placeholder="Password" />
          </Form.Group>
        </Form.Row>

        <Form.Group controlId="formGridAddress1">
          <Form.Label>Address</Form.Label>
          <Form.Control placeholder="1234 Main St" />
        </Form.Group>

        <Form.Group controlId="formGridAddress2">
          <Form.Label>Address 2</Form.Label>
          <Form.Control placeholder="Apartment, studio, or floor" />
        </Form.Group>

        <Form.Row>
          <Form.Group as={Col} controlId="formGridCity">
            <Form.Label>City</Form.Label>
            <Form.Control />
          </Form.Group>

          <Form.Group as={Col} controlId="formGridState">
            <Form.Label>State</Form.Label>
            <Form.Control as="select">
              <option>Choose...</option>
              <option>...</option>
            </Form.Control>
          </Form.Group>

          <Form.Group as={Col} controlId="formGridZip">
            <Form.Label>Zip</Form.Label>
            <Form.Control />
          </Form.Group>
        </Form.Row>

        <Form.Group id="formGridCheckbox">
          <Form.Check type="checkbox" label="Check me out" />
        </Form.Group>

        <Button variant="primary" type="submit">
          Submit
        </Button>
      </Form>
    </Container>
  );
}
