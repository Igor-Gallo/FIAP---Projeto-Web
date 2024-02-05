import React from 'react';
import image01 from '../img/car01.png';
import image02 from '../img/car02.png';
import image03 from '../img/car03.png';
import image04 from '../img/car04.png';
import './Styles/Responsive.css'
import './Styles/Howtowork.css'

function Howtowork() {


  return (
    <div className='content'>
      <div className='contentRight'>
        <div className='imageCar'>
          <img src={image01} alt=''/>
        </div>
        <div className='contentText'>
          <p>Inicie o seu anúncio com impacto, apresentando o seu veículo por meio de imagens que revelam sua beleza e características únicas. <br /> <br /> Destaque os melhores ângulos, detalhes e diferenciais que fazem do seu veículo uma escolha excepcional. As imagens são o primeiro contato visual com os possíveis compradores, então capriche para atrair sua atenção.</p>
        </div>
      </div>

      <div className='contentRightRv'>
        <div className='contentTextLeft'>
          <p>Aqui, a nossa inteligência artificial entra em cena para agilizar o processo. Analisando as imagens, ela reconhece e preenche automaticamente as informações do anúncio, garantindo que todos os detalhes essenciais sejam destacados de maneira precisa e atrativa.<br /><br />

Essa etapa economiza seu tempo e esforço, garantindo que seu anúncio seja informativo e completo. Aprecie a praticidade de ter a IA ao seu lado, facilitando a criação do seu anúncio.</p>
        </div>

        <div className='imageCar'>
          <img src={image02} alt=''/>
        </div>
      </div>

      <div className='contentRight'>
        <div className='imageCar'>
          <img src={image03} alt=''/>
        </div>
        <div className='contentText'>
          <p>A personalização é a chave. Nesta etapa, você tem a oportunidade de adicionar informações extras e relevantes sobre o seu veículo. Detalhes específicos, histórico de manutenção ou características especiais podem fazer a diferença.<br /><br />

Mostre o cuidado que teve com seu veículo ao fornecer informações adicionais. A transparência e a precisão aumentam a confiança dos compradores em potencial, resultando em uma venda mais rápida e eficiente.</p>
        </div>
      </div>

      <div className='contentRightRv'>
        <div className='contentTextLeft'>
          <p>A criatividade é o toque final. Se desejar, nossa inteligência artificial pode criar uma descrição envolvente e cativante para o seu veículo. Uma narrativa única que atrai os compradores, destacando as qualidades do seu veículo de forma irresistível.<br /><br />

Deixe a IA impressionar com uma descrição atraente. Maximize o potencial de venda do seu veículo com uma narrativa que destaca suas características de maneira atraente e única.</p>
        </div>

        <div className='imageCar'>
          <img src={image04} alt=''/>
        </div>
      </div>
      
    </div>
  );
}

export default Howtowork;