import React from 'react';
import {BrowserRouter ,Switch, Route } from 'react-router-dom';

import Login from './pages/Login';
import Pedido from './pages/Pedido';
import PedidoEditar from './pages/Pedido/PedidoEditar';

export default function Routes() {
    return (
             <BrowserRouter>
               <Switch>
                   <Route path='/' exact component={Login} /> 
                   <Route path='/pedido' component={Pedido} /> 
                   <Route path='/pedidoEditar' component={PedidoEditar} /> 
               </Switch>
             </BrowserRouter>


    )
}