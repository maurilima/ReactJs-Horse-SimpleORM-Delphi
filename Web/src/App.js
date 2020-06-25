import React from 'react';
import  'bootstrap/dist/css/bootstrap.min.css';
import Header from './Componentes/Header';
import Routes from './routes';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <Header />
        <Routes />

      </header>
    </div>
  );
}

export default App;
