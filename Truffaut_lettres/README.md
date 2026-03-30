# Correspondances de François Truffaut - Transformation XML vers HTML avec XSLT

## Description du projet 
L'objectif du projet est de créer un site web à partir de trois lettres issues des correspondances archivées de François Truffaut. Les trois lettres ont été encodées en fichiers XML-TEI dans le cadre du cours "Modelling humanites data with TEI-XML" donné à l'École nationale des Chartes en 2025. La transformation de ces fichiers en html via XSLT est réalisée das le cadre du cours "Technique et chaine de publication électronique" de l'ENC. L'actuel projet consiste donc en une transformation de ces trois fichiers XML en différents fichiers de sorties HTML via un fichier XSLT, afin de produire un site web.

## Le corpus
Le corpus sur lequel se fonde le site html est constitué de trois lettres liées à François Truffaut, réalisateur français de la Nouvelle Vague : 
* Lettre de François Truffaut à Jean Gruault, 1968
* Lettre de François Truffaut à Georges Delerue, 1978
* Lettre d'Alfred Hitchcock à François Truffaut, 1976

## Contenu du site
Le site résultant de la transformation de ces trois lettres encodées en XML-TEI est constitué de quatre pages : 
* une page d'accueil, contenant une présentation visuelle de chacune des trois lettres
* une page pour chaque lettre du corpus (trois pages au total), contenant les métadonnées générales de chaque lettre, le corps du texte restitué à partir de l'encodage ainsi que l'image du tapuscrit mis côte-à-côte.
* un index, répertoriant les noms de personnes, les noms de lieux, d'organisations, et d'oeuvres. 

## Contenu du dossier 
Le dossier "Truffaut_lettres_xsl" contient un sous-dossier "xml" qui comprend les fichiers xml d'encodage des trois lettres, ainsi qu'un dossier "out" dont l'organisation brute a été conservée afin de ne pas nuire aux chemins contenus dans templates du fichier xsl. Le sous-dossier "out" contient à la fois les images des tapuscrits des trois lettres, le fichier style.css qui contient le style global du site, les cinq fichiers de sorties html ainsi que le fichier transformation_html.xsl contenant les templates de transformation.