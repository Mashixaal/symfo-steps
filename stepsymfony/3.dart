**MAC UNIQUEMENT**
==source ~/.bash_profile==  a mettre dans terminal VS Code avant utilisation de symfony. 


- Si pas fait ajouter Script démarrage Front + Back dans package.json "scripts":
{ "start": "run-p start:**", "start:symfony": "symfony serve", "start:react": "encore dev-server", "dev": "encore dev", "watch": "encore dev --watch", "build": "encore production --progress" },

+ faire dans le terminal la commande : ==npm i npm-run-all==

## Steps

1. Installer Symfony sur vs code : 

- symfony new my_project_name --version="6.1.*" --webapp

(Twig, permet d'afficher la vue. 
Dossier "entity" permet de faire les tables).

==npm start:symfony== => pour lancer l'application symfony. (ou symfony server:start)

==npm start== pour run le projet

**CONTROLLER** permet de gérer tout les composants et leur vue.

2. **Créer un controller** =>   ==bin/console make:controller==
Les noms des dossiers en PascalCase => (HomePage)

Le controller se charge de créer la "route" Home => dans le controller on laisse juste un / pour indiquer que c'est la racine du site web. 

3. copier coller : "composer require symfony ..." dans le terminal à partir de  home_page > base.html.twig
=> permet de créer un point d'entrée. 

4. Installer React sur symfony => taper react js symfony sur google et suivre les instructions. 
ou voici la commande :
- ==npm install react react-dom prop-types --save==

(prop types permet de typer les variables. 
react-dom permet de manipuler le dom de React)

5. Aller dans webpack.config.js => décommenter la ligne 66 : .enableReactPreset()

=> Dans le terminal : ==npm run dev-server== ou ==npm start:react ==pour valider installation React. 
+ installer babel dans terminal ==npm install @babel/preset-react@^7.0.0 --save-==

6. Dans *app.js* => retirer toute les lignes garder juste "start the stimilus - bootstrap" + import. (si tu comptes utiliser Bootstrap)

- Pour commencer a utiliser React on mets dans *app.js* => 

import React from "react";

import { createRoot } from "react-dom/client";

import { createBrowserRouter, RouterProvider } from "react-router-dom";

=> dans Terminal mettre : ==npm i react -t router-dom==

L'application est dans assets et pas à la racine du projet. 
On va dans dossier assets on crée src, on src on crée un dossier pages, dans pages on crée dossier home, ensuite fichier index.jsx

**Toujours importer react dans les fichiers.** 

Pour afficher la page React, on utilise la **methode RENDER** => 

Dans *app.js* créer une variable router :

const router = createBrowserRouter ([
{
path: "/",
element: <Home />,
},
]);

7. Créer un container pour aller checker root : 
(à partir de la div root on affiche notre contenu React)

const container = document.getElementById("root");
const root = createRoot(container);

root.render(<RouterProvider router={router} />)

- Dans Home_page> index.html.twig
supprimer tout ce qui se trouve dans le block body.
Ajouter à la place :  <div id="root"><div/>

Dans fichier pages on crée un dossier product et fichier index.jsx (si besoin uniquement)

- Dans app.js ajouter :  
import Home from "./src.pages.home"; 
import Contact from "./src/pages/contact";

- Dans la fonction router on ajoute : 

{
path: "/contact",
element: <Contact />,
},

**si besoin**
dans fichier contact, retirer la partie body et ajouter a la place div root. 
<div id="root"></div>

==Aller dans Mamp/Wamp> php my admin==

**ORM : Object Relational Mapping**

=> doctrine symfony get start, doc à suivre = pour créer API. 
=> API platform get start dans google (logo site arraigné bleue)
== composer require api == dans le terminal du projet. 

On doit créer une base donnée pour commencer > .env -> aller dans les lignes de code "doctrine bundle". Décommenter la ligne 31 "database url="mysql:etc" retirer les points d'exclamation et on doit avoir -> root:root (pour MAC UNIQUEMENT, pour windows : DATABASE_URL="mysql://root:@127.0.0.1:3306/symfo_bis?serverVersion=8&charset=utf8mb4")
après le / mettre le nom de votre projet.

Port serveur base de donnée sur Mac : 8889
DATABASE_URL="mysql://root:root@127.0.0.1:8889/symfo-shop?serverVersion=8&charset=utf8mb4"
Port serveur base de donnée sur Windows : 3306
DATABASE_URL="mysql://root:@127.0.0.1:3306/symfo_bis?serverVersion=8&charset=utf8mb4"


**Retour sur la doc de doctrine**: 

bin/console doctrine:database:create => dans terminal

Pour verifier que la base de donnée a bien été crée, aller sur Php my admin. 

- Créer une entity (une table) => bin/console make:entity => Users (tjrs utilser du PascalCase) => mettre YES, oui on veut exposer le tableau à la platforme api.  
- Property name (les champs) à ajouter "name, email, city" (par exemple)
- Mettre YES pour mettre les champs nuls. (bien lire, mais même question que création base de donnée sur php my admin en vanilla) 

Checker dans users.php si les champs ont bien été ajouté.

bin/console make:migration => dans terminal pour créer migration vers base de donnée.

- Copier coller à partir du terminal => php bin/console doctrine:migrations
:migrate => mettre YES

8. Installer API platforme => composer require api
- permet d'effectuer des requêtes CRUD dans la base de donnée. 

(Le CURL c'est l'entête de la requête - code 200 ou 201 => tout ok)

Axios est une librairie pour récupérer de la donnée (pour fetch).
npm i axios => pour installer axios, qui est comme fetch (faire des requêtes de type CRUD d puis le front). 
import axios from "axios";
(les promesses = then et catch
On retourne sur notre index.jsx de homepage :

<button type="button" onClick={() =>  onSubmit()}>Envoyer</button>


- Pour supprimer une database créee : php bin/console doctrine:database:drop --force
- Pour en recréer une : bin/console doctrine:database:create

useState, permet de mettre à jour une variable de façon dynamique.

(fonction fléché avant pour confirmer qu'on utilise bien la fonction et pas une autre)

**Lors de l'utilisation d'un langage asynchrone faire une fonction asynch**