# tmdb-provider

## Prerequisites
* Jahia 8.0.1.0 or superior
* bootstrap 4 modules (bootstrap and bootstrap-component)
* Use the site key tmdb to be deployed

## Setup
To setup the tmdb-provider you must:
1. request an API key(API Read Access Token (v4 auth) not the API Key (v3 auth)) from TMDB and add the value in jahia.properties file, like this `com.jahia.tmdb.apiKeyValue=YOUR_API_KEY`
2. start or restart your jahia
3. deploy the module tmdb-provider
5. Now you can for example add a content reference and look for a node in the source, the source is under /digitall/contents/tmdb/...

## Augmented Search
Fully functional with Augmented Search V3

## Screenshots
### Example of bootstrap 4 cards
![picture](./src/main/resources/img/readme/tmdb-cards.png)

### Movie Content Template
![picture](./src/main/resources/img/readme/tmdb-movie.png)

### Movie Person Content Template
![picture](./src/main/resources/img/readme/tmdb-movieperson.png)

