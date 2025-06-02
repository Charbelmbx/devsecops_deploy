# Utilise une image officielle Node.js
FROM node:20

# Crée un dossier de travail dans le conteneur
WORKDIR /app

# Copie les fichiers package.json et package-lock.json
COPY package*.json ./

# Installe les dépendances
RUN npm install

# Copie tout le projet dans le conteneur
COPY . .

# Expose le port utilisé par Express
EXPOSE 3000

# Lance le serveur
CMD ["node", "app.js"]
