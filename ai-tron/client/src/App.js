import React from 'react';
// import 'App.css';

import { Outlet } from 'react-router-dom';

import Navbar from './components/Navbar';
import Header from './components/Header';

function App() {
  return (
    <div className="App">
      <Header />
      <Navbar />
      <Outlet />
    </div>
  );
}

export default App;
