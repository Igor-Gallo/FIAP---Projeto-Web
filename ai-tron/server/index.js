const express = require('express');
const multer = require('multer');
const axios = require('axios');
const cors = require('cors');

const app = express();
const port = process.env.PORT || 3001;

app.use(cors());
app.use(express.json());

// Configuração do multer
const upload = multer();

// Endpoint para realizar a predição de imagem
app.post('/predict', upload.single('image'), async (req, res) => {
  try {
    if (!req.file || !req.file.buffer) {
      return res.status(400).json({ message: 'No image data received' });
    }

    const imageData = req.file.buffer;
    console.log('Image Data:', imageData); // Adicione este log

    const apiKey = '4567b984f19d45c6ae4e1a1b9601cbbf';
    const projectId = '9d9383f6-042e-4ff9-b920-56d4143808f7';
    const endpoint = `https://eastus.api.cognitive.microsoft.com/customvision/v3.0/Prediction/${projectId}/classify/iterations/tefnet-pre-final/image`;

    const response = await axios.post(endpoint, imageData, {
      headers: {
        'Prediction-Key': apiKey,
        'Content-Type': 'application/octet-stream',
      },
    });

    res.json(response.data);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Internal server error' });
  }
});

// Inicia o servidor
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});