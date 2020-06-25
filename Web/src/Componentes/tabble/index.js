import React, { useState, useEffect } from "react";
import api from "../../services/api";
import { Table } from "react-bootstrap";

export default function Tabela() {
  const [pedidos, setPedido] = useState([]);

  useEffect(() => {
    async function fetchData() {
      const response = await api.get("/pedido");
      setPedido(response.data);
    }
    fetchData();
  }, []);

  return (
    <>
      <Table variant="dark">
        <thead>
          <tr>
            <th>ID</th>
            <th>NOME</th>
            <th>DATA</th>
            <th>VALOR</th>
          </tr>
        </thead>
        <tbody>
          {pedidos.map(pedido => (
            <tr key={pedido.ID}>
              <td>{pedido.ID}</td>
              <td>{pedido.NOME}</td>
              <td>{pedido.DATA}</td>
              <td>{pedido.VALOR}</td>
            </tr>
          ))}
        </tbody>
      </Table>
    </>
  );
}
