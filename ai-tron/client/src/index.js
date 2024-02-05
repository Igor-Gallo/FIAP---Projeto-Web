import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App'; // Certifique-se de importar o componente App corretamente

import {createBrowserRouter, RouterProvider} from 'react-router-dom';

import Home from './routes/Home';
import Anuncio from './routes/Anuncio';
import Error from './routes/Error';
import Howtowork from './routes/Howtowork';

const router = createBrowserRouter([
  {
    path: '/',
    element: <App />,  // Aqui você está usando o componente App, mas ele não foi importado.
    errorElement: <Error />,
    children: [
      {
        path: '/',
        element: <Home />
      },
      {
        path: 'Anuncio',
        element: <Anuncio />
      },
      {
        path: 'Sobre',
        element: <Howtowork />
      }
    ]
  }
]);

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <RouterProvider router={router}/>
  </React.StrictMode>
);

