import React from 'react';
import Back from '../img/Rectangle5.png';
import './Styles/Responsive.css';

function Home() {

  const divContent = {
    display: 'flex',
    width: '100%',
  }

  const container = {
    margin: '0 2rem',
    marginTop: '4rem'
  }

  const contentText = {
    width: '100%',
    display: 'flex',
    justifyContent: 'end'
  }

  const fontTitle = {
    fontSize: '64px',
    textAlign: 'start',
    textTransform: 'uppercase',
    margin: '0',
    color: '#000'
  }

  const text = {
    width: '70%'
  }

  const colorSpan = {
    color: '#FF1138'
  }

  const divImg = {
    margin: '8rem 0'
  } 

  const imgBack = {
    width: '100%'
  }

  return (
    <div style={container}>
      <div style={divContent} className='Container'>
        <div className='title'>
          <h1 style={fontTitle}>Anuncie com <span style={colorSpan}>Inteligência</span></h1>
        </div>
        <div style={contentText} className='containerText'>
          <p style={text}>Venda seu carro com facilidade usando o Copiloto Web! Nossa inteligência artificial avançada reconhece os detalhes do seu veículo a partir de uma foto e preenche automaticamente os campos necessários. Torne o processo de criação de anúncios rápido e eficiente com o Copiloto Web. Experimente agora e venda seu carro com um único clique!</p>
        </div>
      </div>

      <div style={divImg} className='containerImage'>
        <img src={Back} alt="" style={imgBack} />
      </div>
      
    </div>
  );
}

export default Home;