import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './Styles/App.css';

const buttonStyle = {
  backgroundColor: '#FF1138',
  color: 'white',
  fontSize: '10px',
  padding: '5px',
  borderRadius: '3px',
  width: '20px',
};

const imageNavigateStyle = {
  display: 'flex',
  justifyContent: 'space-between',
  position: 'absolute',
  top: '50%',
  width: '97%',
  margin: '0 1%',
};

const noneDisplayStyle = {
  display: 'none',
};

const Anuncio = () => {
  const [images, setImages] = useState([]);
  const [showImagePreview, setShowImagePreview] = useState(false);
  const [currentImageIndex, setCurrentImageIndex] = useState(0);
  const [imagePreviewURLs, setImagePreviewURLs] = useState([]);
  const [carDetails, setCarDetails] = useState({
    modelo: '',
    ano: '',
    cor: '',
  });
  const [predictionResults, setPredictionResults] = useState([]);
  const [placa, setPlaca] = useState('');
  const [additionalInfo, setAdditionalInfo] = useState('');
  const [generatedDescription, setGeneratedDescription] = useState('');
  const [answer, setAnswer] = useState('');

  const handleImageUpload = async () => {
    for (const image of images) {
      try {
        const formData = new FormData();
        formData.append('image', image);
        const response = await fetch('http://tefnet-next-backend.hkdfgzhfhrahcyej.eastus.azurecontainer.io:3001/predict', {
          method: 'POST',
          body: formData,
        });
        const data = await response.json();
        console.log(data);
  
        const details = {
          modelo: { tag: '', probability: 0 },
          ano: { tag: '', probability: 0 },
          cor: { tag: '', probability: 0 },
        };
  
        data.predictions.slice(0, 3).forEach((item) => {
          console.log(details)
          const lowerTagName = item.tagName.toLowerCase();
          if (!isNaN(lowerTagName)) {
            details.ano = { tag: lowerTagName, probability: item.probability };
          } else if (['branco', 'preto', 'prata', 'vermelho'].includes(lowerTagName)) {
            details.cor = { tag: lowerTagName, probability: item.probability };
          } else {
            details.modelo = { tag: lowerTagName, probability: item.probability };
          }
        });
  
        // Verifique a probabilidade da tag do modelo
        const modeloProbability = details.modelo.probability;
        if (modeloProbability < 0.5) {
          // Mostrar um pop-up informando que não é um carro
          alert('Isso nao é um carro. Faça o upload de uma imagem de carro.');
          return; // Abortar o processamento adicional
        }
  
        setCarDetails(details);
        setPredictionResults(data.predictions);
      } catch (error) {
        console.error(error);
      }
    }
  };

  const handleImageChange = (e) => {
    const uploadedImages = Array.from(e.target.files);
    const firstFiveImages = uploadedImages.slice(0, 5);
    setImages(firstFiveImages);
    setShowImagePreview(true);
    setCurrentImageIndex(0);

    const imageURLs = firstFiveImages.map((img) => URL.createObjectURL(img));
    setImagePreviewURLs(imageURLs);
  };

  const handlePlacaChange = (e) => {
    const inputValue = e.target.value.toUpperCase();
    setPlaca(inputValue);
  };

  const handleAdditionalInfoChange = (e) => {
    setAdditionalInfo(e.target.value);
  };

  useEffect(() => {
    setGeneratedDescription(answer);
  }, [answer]);

  const handleNextImage = () => {
    const nextIndex = (currentImageIndex + 1) % imagePreviewURLs.length;
    setCurrentImageIndex(nextIndex);
  };

  const handlePreviousImage = () => {
    const previousIndex = (currentImageIndex - 1 + imagePreviewURLs.length) % imagePreviewURLs.length;
    setCurrentImageIndex(previousIndex);
  };

  const handleGenerateAndAsk = async () => {
    const description = `Gere uma descrição desse veículo de forma objetiva com as seguintes características: ${carDetails.modelo.tag} ${carDetails.ano.tag} ${carDetails.cor.tag} - ${additionalInfo}, me de uma ficha tecnica no final. ignore palavras de baixo calão e teor sexual`;
    setGeneratedDescription(description);

    const requestBody = {
      max_tokens: 300,
      messages: [
        {
          role: 'user',
          content: description,
        },
      ],
    };

    try {
      const temperature = 0.5;  // Ajuste a temperatura conforme desejado
    
      const response = await axios.post(
        'https://openai-generation-description.openai.azure.com/openai/deployments/Generation-Airton/chat/completions?api-version=2023-07-01-preview',
        {
          ...requestBody,
          temperature,  // Adiciona a temperatura ao corpo da solicitação
        },
        {
          headers: {
            'Content-Type': 'application/json',
            'api-key': '251975d562cf44bdbde5a975d7d0c31f',
          },
        }
      );
    
      setAnswer(response.data.choices[0].message.content.trim());
    } catch (error) {
      console.error('Error fetching data:', error);
    }
  };

  return (
    <div className="App">
      <div className="allContent">
      <h1>AIrton Prediction</h1>
        <div className="imageContent">
          <div className="image-preview">
            {showImagePreview && (
              <div className="image-preview">
                <img
                  src={imagePreviewURLs[currentImageIndex]}
                  alt={`Preview ${currentImageIndex}`}
                  style={{ maxWidth: '200px' }}
                />
                <div style={imageNavigateStyle} className="image-navigation">
                  <button style={buttonStyle} onClick={handlePreviousImage}>◀</button>
                  <button style={buttonStyle} onClick={handleNextImage}>▶</button>
                </div>
              </div>
            )}
          </div>

          <div className="buttonGener">
            <label className="custom-file-input">
              Inserir fotos
              <input
                type="file"
                accept="image/*"
                multiple
                onChange={handleImageChange}
              />
            </label>

            <button className="predButton" onClick={handleImageUpload}>
              Verificar
            </button>
          </div>
        </div>

        <div className="prediction">
          <h3>Seu carro a venda:</h3>
          <div className="infoContent">
            <div className="ModelIn">
              <label>Modelo</label>
              <input type="text" value={carDetails.modelo.tag}  />
            </div>
            <div className="anolIn">
              <label>Ano</label>
              <input type="text" value={carDetails.ano.tag}  />
            </div>
            <div className="corIn">
              <label>Color</label>
              <input type="text" value={carDetails.cor.tag}  />
            </div>
            <div className="placaIn">
              <label>Placa</label>
              <input
                type="text"
                value={placa}
                onChange={handlePlacaChange}
                maxLength="7"
              />
            </div>
          </div>
          
          <div className="allDisc">
            <div className="infoAdd">
              <textarea
                placeholder="Informações adicionais"
                value={additionalInfo}
                onChange={handleAdditionalInfoChange}
              ></textarea>
            </div>
            <div className="descrAdd">
              <textarea
                placeholder="Descrição"
                value={answer}
                
              ></textarea>
              <p style={noneDisplayStyle}>{generatedDescription}</p>
              <button className="generateButton" onClick={handleGenerateAndAsk}>
                Gerar descrição
              </button>
            </div>
          </div>

          <div className="predictionResults" style={noneDisplayStyle}>
            <h3>Custom Vision Results:</h3>
            <ul>
              {predictionResults.map((result, index) => (
                <li key={index}>{result.tagName}</li>
              ))}
            </ul>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Anuncio;