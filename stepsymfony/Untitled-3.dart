**MAC UNIQUEMENT**
==source ~/.bash_profile== a mettre dans terminal VS Code avant utilisation de symfony.

## Steps

1. Installer Symfony sur vs code :

- symfony new my_project_name --version="6.1.\*" --webapp

(Twig, permet d'afficher la vue.
Dossier "entity" permet de faire les tables).

==symfony serve== => pour lancer l'application symfony. (ou symfony server:start)

**CONTROLLER** permet de gérer tout les composants.

2. **Créer un controller** => ==bin/console make:controller==
   Les noms des dossiers en PascalCase => (HomePage)

Le controller se charge de créer la "route" Home => dans le controller on laisse juste un / pour indiquer que c'est la racine du site web.

3. copier coller : "composer require symfony ..." dans le terminal à partir de home_page > base.html.twig
   => permet de créer un point d'entrée.

4. Installer react sur symfony => taper react js symfony sur google et suivre les instructions.

- ==npm install react react-dom prop-types --save==

(prop types permet de typer les variables.
react-dom permet de manipuler le dom de React)

5. Aller dans webpack.config.js => décommenter la ligne 66 : .enableReactPreset()

=> Dans le terminal : ==npm run dev-server== pour valider installation React.

- installer babel dans terminal ==npm install @babel/preset-react@^7.0.0 --save-==

6. Dans _app.js_ => retirer toute les lignes garder juste "start the stimilus - bootstrap" + import.

- Pour commencer a utiliser React on mets dans _app.js_ =>

import React from "react";
import {createRoot} from "react-dom/client";
import {createBrowserRouter, RouterProvider} from "react-router-dom";

=> dans terminal mettre : ==npm i react -t router-dom==

L'application est dans assets et pas à la racine du projet.
On va dans dossier src on crée un dossier pages, dans pages on crée dossier home, ensuite fichier index.jsx

**Toujours importer react dans les fichiers.**

Pour effectuer la page React, on utilise la **methode RENDER** =>

Dans _app.js_ créer une variable router :

const router = createBrowserRouter ([
{
path: "/",
element: <Home />,
},
]);

7. Créer un container :
   (à partir de la div root on affiche notre contenu React)

const container = document.getElementById("root");
const root = createRoot(container);

root.Render(<RouterProvider router={router} />)

- Dans Template dans ton fichier que ta crée index.html.twig
  supprimer tout ce qui se trouve dans le block body.
  Ajouter à la place : <div id="root"><div/>

Dans dossier assets on crée dossier src, dans src on crée pages on crée un dossier contact et fichier index.jsx (si besoin uniquement)

- Dans app.js ajouter :  
  import Home from "./pages/Home";
  import Contact from "./src/pages/contact";

- Dans la fonction router on ajoute :

{
path: "/contact",
element: <Contact />,
},

**si besoin**
dans fichier contact, retirer la partie body et ajouter a la place div root.

<div id="root"></div>

==Aller dans Mamp/Wamp> phpMyAdmin==

**ORM : Object Relational Mapping.**

=> doctrine symfony get start, doc à suivre = pour créer API.
=> API platform get start dans google (logo site arraigné bleue)
==composer require api== dans le terminal du projet.

On doit créer une base donnée pour commencer > .env -> aller dans les lignes de code "doctrine bundle". Décommenter la ligne 31 "database url="mysql:etc" retirer les points d'exclamation et on doit avoir -> root:root (pour MAC UNQUEMENT, pour windows : bonne chance)
après le / mettre le nom de votre projet.
port serveur base de donnée sur Mac : 8889

DATABASE_URL="mysql://root:root@127.0.0.1:8889/symfonyreact?serverVersion=8&charset=utf8mb4"

**Retour sur la doc de doctrine**:

bin/console doctrine:database:create => dans terminal

Pour verifier que la base de donnée a bien été crée, aller sur Php my admin.

- Créer une entity (une table) => bin/console make:entity => Users (tjrs utilser du PascalCase) => mettre YES, oui on veut exposer le tableau à la platforme api.
- Property name (les champs) à ajouter "name, email, city" (par exemple)
- Mettre YES pour mettre les champs nuls. (bien lire, mais même question que création base de donnée sur php my admin en vanilla)

Checker dans users.php si les champs ont bien été ajouté.

bin/console make:migration => dans terminal

- Copier coller à partir du terminal "php bin/console doctrine:migrations=
  :migrate => mettre YES

Installer API => composer require api

(Le CURLc'est l'entête de la requête.
code 200 ou 201 => tout ok)

Axios est une librairie pour récupérer de la donnée (pour fetch).
npm -i axios => pour installer axios, qui est comme fetch (faire des requêtes de type CRUD d puis le front).
import axios from "axios";
(les promesses = then et catch)

On retourne sur notre index.jsx de homepage :

<button type="button" onClick={() => onSubmit()}>Envoyer</button>

(fonction fléché avant pour confirmer qu'on utilse bien la fonction et pas une autre)

const Home = () => {
const onSubmit = () => {
axios.get("http://localhost:8000/api/users").then((response) => {
console.log(response);
})
.catch((error) => {
console.error(error)
});
console.log("clicked!");
};
};

**Lors de l'utilisation d'un langage asynchrone faire une fonction asynch**

dans home> index.jsx => ajouter les deux url  
const URL = "[https://jsonplaceholder.typicode.com/posts/](https://jsonplaceholder.typicode.com/posts/ "https://jsonplaceholder.typicode.com/posts/")"; const URL\_ = "[http://localhost:8000/api/posts/](http://localhost:8000/api/posts/ "http://localhost:8000/api/posts/")";

- dans fonction Home :

import React, {useEffect, useState}

const Home = () => {
const [posts, getAllPosts] = userState([]); _pour ajouter les données dans le tableau_
cont [postsSymfony, getAllPostsSymfony] = useState([]);

const getPostsSymfony = asynch () => {
await axios
.get('${URL\_}')
.then((response) => {
getAllPotstsSymfony(response.data["hydra:member"]); _pour choisir une donnée précise dans les données on utilise un tableau_
})
.catch((error) => {
error;
});
};

const getPosts = asynch () => {
await axios
.get('${URL}')
.then((reponse) => {
getAllPosts(response.data);
)}
.catch((error) => console.error(error));
};

_avec useState, ..._
_avec useEffect on execute quelque chose_
useEffect() => {
getPosts();
}, []);

return (
<>
<Navbar />
{postSymfony.map((post) => {
return(

<div key={post.id}>    *quand on fait un map on doit ajouter une clefs pour confirmer que chaque élement possède son ID*
<ul>
<li>
votre nom est  {post.name}
</li>
<li>
vous avez  {post.age} ans
</li>
</ul>
</div>
)
})}
{posts.map((post) => {
return(
<div key={post.id}>    *quand on fait un map on doit ajouter une clefs pour confirmer que chaque élement possède son ID*
<ul>
<li>
le titre du post:  {post.title}
</li>
<li>
le corps du message  {post.body}
</li>
</ul>
</div>
)
})}
</>
);
};
