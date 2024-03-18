# Use a imagem Node.js para ARM64 como base
FROM arm64v8/node:latest

# Crie um diretório de trabalho dentro da imagem
WORKDIR /app

# Copie o package.json e o package-lock.json (se existirem) para o diretório de trabalho
COPY package*.json ./

# Instale as dependências do projeto
RUN npm install

# Copie o restante do código fonte para o diretório de trabalho
COPY . .

# Exponha a porta em que a aplicação vai rodar
EXPOSE 3000

# Comando para iniciar a aplicação
CMD ["npm", "start"]
