<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    version="2.0">
    
    <xsl:output method="html"/>
    
    <!--chargement des trois fichiers xml contenant les lettres encodées via des variables globales avec la fonction document() pour pouvoir les rappeller dans les templates-->
    <xsl:variable name="lettre1" select="document('../xml/letter1_tei_all.xml')"/>
    <xsl:variable name="lettre2" select="document('../xml/Lettre_2.xml')"/>
    <xsl:variable name="lettre3" select="document('../xml/letter_3.xml')"/>
    
    <!--création d'une variable contenant le head des documents html-->
    <xsl:variable name="head">
        <head>
            <meta charset="utf-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1"/>
            <!--chargement du CSS de Bootstrap pour le placement des éléments du site-->
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"/>
            
            <!--chargement de ma feuille de style CSS et des polices utilisées pour le style global du site-->
            <link rel="stylesheet" href="style.css"/>
            <link rel="preconnect" href="https://fonts.googleapis.com"/>
            <link rel="preconnect" href="https://fonts.gstatic.com" />
            
            <title>Lettres de François Truffaut</title>
        </head>
    </xsl:variable>
    
    <!--création d'une variable qui contient le footer des documents html-->
    <xsl:variable name="footer">
        <footer style="margin: 5em 0 0 0;">
            <p>Site réalisé dans le cadre du cours de XSLT du Master TNAH de l'École nationale des chartes.</p>
        </footer>
    </xsl:variable>
    
    <!--création d'une variable header qui contient l'entête du site avec la barre de navigation-->
    <xsl:variable name="header">
        <header>
        <div class= "px-4 py-4 text-center banniere">
                <h1 class="mb-2">
                    Correspondances de <xsl:value-of select="$lettre1//titleStmt/author"/> <!-- on récupère le nom de François Truffaut via la valeur de la balise author contenue dans titre de la lettre 1 -->
                </h1>
            <!-- ajout et mise en forme de la barre de navigation -->
        </div>
                <nav class="navbar py-2">
                    <div class="container-fluid justify-content-center">
                        <ul class="navbar-nav flex-row list-unstyled gap-3 justify-content-center mb-0">
                            <li><a class="bouton-nav" href="home.html">Accueil</a></li>
                            <li><a class="bouton-nav" href="lettre1.html">1.Jean Gruault</a></li>
                            <li><a class="bouton-nav" href="lettre2.html">2.Georges Delerue</a></li>
                            <li><a class="bouton-nav" href="lettre3.html">3.Alfred Hitchcock</a></li>
                            <li><a class="bouton-nav" href="index.html">Index</a></li>
                        </ul>
                    </div>
                 </nav>
        </header>
    </xsl:variable>
    
    <!--création d'un template qui matche la racine et qui génère les fichiers html en appellant les templates un par un-->
    <xsl:template match="/">
        <xsl:call-template name="home"/>
        <xsl:call-template name="index"/>
        <xsl:call-template name="Lettre1"/>
        <xsl:call-template name="Lettre2"/>
        <xsl:call-template name="Lettre3"/>
    </xsl:template>
    
    <!--création d'un template qui crée la page d'accueil du site-->
    <xsl:template name="home">
        <xsl:result-document href="out/home.html" method="html" indent="yes"> <!-- définition du format de sortie comme une page html -->
            <html lang="fr">
                <xsl:copy-of select="$head"/> <!-- copie du head html commun à toutes les pages définit via la variable head-->
                <body>
                    <div class="container py-4">
                        <!--ajout d'un conteneur pour créer des marges autour des éléments de la page-->
                        <xsl:copy-of select="$header"/> <!-- copie de l'entête dfinie via la variable header-->
                    <h1 style="text-align: center;">Accueil</h1>
                    
                    <div class="text-center my-4">
                        
                        <p class="fst-italic text-muted">Ce site propose une transcription d'archives issues des correspondances de 
                            <xsl:value-of select="$lettre1//titleStmt/author/persName"/><!-- récupération de la valeur de la balise persName pour afficher le nom de FRançois Truffaut -->
                        </p>
                    </div>
                    <!-- intégration des images de chacune des lettres via Bootstrap en trois colonnes avec un lien cliquable pour chacune-->
                        <!-- affichage pour chacune des lettres de métadonnées globales en appellant la variable définie pour chaque lettre -->
                    <div class="row g-4 mt-3">
                        <div class="col-md-4">
                            <!-- première lettre -->
                            <a href="lettre1.html" style="text-decoration: none;">
                                <div class="card h-100">
                                    <div style="height: 200px; overflow: hidden; border-bottom: 1px solid #d4c9b0;">
                                        <img src="lettre1_screen.png" 
                                            alt="Lettre 1"
                                            style="width: 100%; object-fit: cover; object-position: top center; transition: transform 0.3s ease;"
                                            onmouseover="this.style.transform='scale(1.05)'"
                                            onmouseout="this.style.transform='scale(1)'"/>
                                    </div>
                                    <div class="card-body">
                                        <p class="card-text" style="font-size: 0.8rem; color: #c0392b; text-transform: uppercase; letter-spacing: 0.08em;">
                                            <!-- récupération de la valeur de la balise date et de son attribut @when pour afficher la date d'écriture de la lettre -->
                                            <xsl:value-of select="$lettre1//correspAction/date/@when"/>
                                        </p>
                                        <h2 class="card-title">
                                            <!-- récupération de la valeur de la balise title pour afficher le titre de la lettre -->
                                            <xsl:value-of select="$lettre1//titleStmt/title"/>
                                        </h2>
                                    </div>
                                    
                                </div>
                            </a>
                        </div>
                        
                        <!-- Lettre 2 -->
                        <div class="col-md-4">
                            <a href="lettre2.html" style="text-decoration: none;">
                                <div class="card h-100">
                                    <div style="height: 200px; overflow: hidden; border-bottom: 1px solid #d4c9b0;">
                                        <img src="lettre_2.jpg" 
                                            alt="Lettre 2"
                                            style="width: 100%; object-fit: cover; object-position: top center; transition: transform 0.3s ease;"
                                            onmouseover="this.style.transform='scale(1.05)'"
                                            onmouseout="this.style.transform='scale(1)'"/>
                                    </div>
                                    <div class="card-body">
                                        <p class="card-text" style="font-size: 0.8rem; color: #c0392b; text-transform: uppercase; letter-spacing: 0.08em;">
                                            <!-- récupération de la valeur de la balise date et de son attribut @when pour afficher la date d'écriture de la lettre -->
                                            <xsl:value-of select="$lettre2//correspAction/date/@when"/>
                                        </p>
                                        <h2 class="card-title">
                                            <!-- récupération de la valeur de la balise title pour afficher le titre de la lettre -->
                                            <xsl:value-of select="$lettre2//titleStmt/title"/>
                                        </h2>
                                    </div>
                                </div>
                            </a>
                        </div>
                        
                        <!-- Lettre 3 -->
                        <div class="col-md-4">
                            <a href="lettre3.html" style="text-decoration: none;">
                                <div class="card h-100">
                                    <div style="height: 200px; overflow: hidden; border-bottom: 1px solid #d4c9b0;">
                                        <img src="lettre3_screen.png" 
                                            alt="Lettre 3"
                                            style="width: 100%; object-fit: cover; object-position: top center; transition: transform 0.3s ease;"
                                            onmouseover="this.style.transform='scale(1.05)'"
                                            onmouseout="this.style.transform='scale(1)'"/>
                                    </div>
                                    <div class="card-body">
                                        <p class="card-text" style="font-size: 0.8rem; color: #c0392b; text-transform: uppercase; letter-spacing: 0.08em;">
                                            <!-- récupération de la valeur de la balise date et de son attribut @when pour afficher la date d'écriture de la lettre -->
                                            <xsl:value-of select="$lettre3//correspAction/date/@when"/>
                                        </p>
                                        <h2 class="card-title">
                                            <!-- récupération de la valeur de la balise title pour afficher le titre de la lettre -->
                                            <xsl:value-of select="$lettre3//titleStmt/title"/>
                                        </h2>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                    </div>
                    <xsl:copy-of select="$footer"/> <!-- copie du footer via sa variable répété pour chaque page du site -->
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- template créant la page de l'index du site -->
    <xsl:template name="index"> 
        <xsl:result-document href="out/index.html" method="html" indent="yes"><!-- définition du format de sortie comme une page html -->
            <html lang="fr">
                <xsl:copy-of select="$head"/><!-- copie du head html commun à toutes les pages du site -->
                <body class="p-3">
                    <!--ajout d'un conteneur pour créer des marges autour des éléments de la page-->
                    <div class="container py-4">
                    <xsl:copy-of select="$header"/><!-- copie de l'entête commun  toutes les pages du site -->
                    <h1 style="text-align: center;">Index</h1>
                    <div class="container-fluid px-4" style="margin: 2em 0 2em 0;">
                        <p>Cette page propose un index de noms de personnes, lieux, oeuvres et organisations mentionnés dans les trois lettres issues des correspondances de François Truffaut</p>
                    </div>
                    <div style="margin: 2em 0 2em 0;">
                        <h2>Personnes</h2>
                        <!-- utilisation de count() pour compter et afficher la valeur du nombre de personnes mentionnées dans le corpus via la balise listPerson de chaque lettreà -->
                        <p>
                            <xsl:value-of select="count($lettre1//sourceDesc/listPerson[not(@type='fictional')]/person) + 
                                count($lettre2//sourceDesc/listPerson[not(@type='fictional')]/person) + 
                                count($lettre3//sourceDesc/listPerson[not(@type='fictional')]/person)"/>
                            personnes mentionnées dans le corpus.
                        </p>
                        <ul>
                            <!--utilisation de xsl for each group afin de récupérer la liste des noms de personnes mentionnées dans chaque lettre via la balise person.-->
                            <!--Groupement de la liste des personnes pour chaque lettre par le nom en utilisant group-by="persName" et ainsi éviter que les mêmes noms apparaissent plusieurs fois--> 
                            <!-- exclusion du type 'fictional' pour les personnes, puisque les personnes fictives seront ajoutées dans une autre section de l'index, plus bas -->
                            <xsl:for-each-group select="$lettre1//sourceDesc/listPerson[not(@type='fictional')]/person | $lettre2//sourceDesc/listPerson[not(@type='fictional')]/person | $lettre3//sourceDesc/listPerson[not(@type='fictional')]/person" group-by="persName">
                                <li>
                                    <!--on récupère ici la valeur de ce sur quoi itère la boucle, c'est-à-dire la balise persName, pour afficher les noms.-->
                                    <xsl:value-of select="current-grouping-key()"/>
                                    
                                    <!-- utilisation de xsl:choose pour effectuer une condition : si la personne est contenue dans telle lettre, le numéro de la ou les lettres est mentionné entre parenthèses avec un lien cliquable -->
                                    <xsl:for-each select="current-group()">
                                        <xsl:choose>
                                            <xsl:when test=". = $lettre1//sourceDesc/listPerson/person"><!-- quand le noeud courant, c'est-à-dire la balise persName est dans la lettre 1, on affiche un lien cliquable vers la lettre 1 -->
                                                <a href="lettre1.html">
                                                    (lettre 1)
                                                </a>
                                            </xsl:when>
                                            <xsl:when test=". = $lettre2//sourceDesc/listPerson/person"><!--quand la balise persName est contenue dans la lettre 2, on affiche la lettre 2 avec un lien cliquable-->
                                                <a href="lettre2.html">
                                                    (lettre 2)
                                                </a>
                                            </xsl:when>
                                            <xsl:otherwise><!-- sinon, on affiche la lettre 3 avec un lien cliquable -->
                                                <a href="lettre3.html">
                                                    (lettre 3)
                                                </a>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:for-each>
                                    
                                    <!-- ajout d'une condition pour récupérer la valeur de la balise note, contenant la note descriptive associée à chaque nom de personne de l'index. Si la note existe, sa valeur est affichée -->
                                    <xsl:if test="note">
                                        <br/>
                                        <xsl:value-of select="note"/>
                                    </xsl:if>
                                </li>
                            </xsl:for-each-group>
                        </ul>
                        
                        <!-- création d'une autre boucle pour les personnages fictifs mentionnés -->
                        <h2>Personnages fictifs</h2>
                        <!--utilisation de count() pour afficher le nombre de personnages fictifs mentionnés-->
                        <p>
                            <xsl:value-of select="count($lettre2//sourceDesc/listPerson[@type='fictional']/person)"/>
                            personnage fictif mentionné dans le corpus.
                        </p>
                        <ul>
                            <!-- il n'y a de personnages fictifs que dans la seconde lettre, on boucle alors sur la balise listPerson et son attribut @fictional de la lettre 2 -->
                            <xsl:for-each select="$lettre2//sourceDesc/listPerson[@type='fictional']/person">
                            <li>
                                <!-- on récupère le nom du personnage et sa note descriptive -->
                                <p><xsl:value-of select="persName"/></p>
                                <p><xsl:value-of select="note"/></p>
                                    <a href="lettre2.html">
                                        (lettre 2)
                                    </a>
                            </li>
                            </xsl:for-each>
                        </ul>
                    </div>
                    
                    <div style="margin: 2em 0 2em 0;">
                        <!--même logique pour récupérer les noms de lieux-->
                        <h2>Lieux</h2>
                        <!-- utilisation de count() pour afficher le nombre de lieux mentionnées dans le corpus dont on récupère la valeur -->
                        <!-- il n'y a de lieux mentionnés que dans les lettres 1 et 2 -->
                        <p>
                            <xsl:value-of select="count($lettre1//sourceDesc/listPlace/place) + 
                                count($lettre2//sourceDesc/listPlace/place)"/>
                            lieu mentionné dans le corpus.
                        </p>
                        <ul>
                            <!--utilisation de xsl for each group afin de récupérer la liste des noms de lieux mentionnées dans chaque lettre via la balise place.-->
                            <!-- on groupe ici les lieux issus de la balise place par leur nom via la balise placeName pour éviter que les mêmes lieux apparaissent plusieurs fois -->
                            <xsl:for-each-group select="$lettre1//listPlace/place | $lettre2//listPlace/place" group-by="placeName">
                                <li>
                                    <!--on sélectionne ici la valeur de ce sur quoi itère la boucle, c'est à dire la balise placeName pour afficher les noms de lieux-->
                                    <xsl:value-of select="current-grouping-key()"/>
                                    <!-- utilisation de xsl:choose pour effectuer une condition : si le lieu est contenu dans telle lettre, le numéro de la ou les lettres est mentionné entre parenthèses avec un lien cliquable -->
                                    <xsl:for-each select="current-group()">
                                        <xsl:choose>
                                            <xsl:when test=". = $lettre1//listPlace/place"><!-- quand le noeud courant, c'est-à-dire la balise placeName est dans la lettre 1, on affiche un lien cliquable vers la lettre 1 -->
                                                 <a href="lettre1.html">
                                                     (lettre 1)
                                                 </a>
                                             </xsl:when>
                                            <xsl:when test=". = $lettre2//listPlace/place"><!-- quand le noeud courant, c'est-à-dire la balise placeName est dans la lettre 1, on affiche un lien cliquable vers la lettre 1 -->
                                                     <a href="lettre2.html">
                                                         (lettre 2)
                                                     </a>
                                             </xsl:when>
                                        </xsl:choose>
                                    </xsl:for-each>
                                    
                                </li>
                            </xsl:for-each-group>
                            <!--pas de lieux dans la troisième lettre-->
                        </ul>
                    </div>
                    
                    <div style="margin: 2em 0 2em 0;">
                        <!--même logique pour les organisations mentionnées-->
                        <h2>Organisations</h2>
                        <!-- utilisation de count() pour afficher le nombre d'organisations mentionnées dans le corpus et dont on affiche la valeur-->
                        <p>
                            <xsl:value-of select="count($lettre2//sourceDesc/listOrg/org) + 
                                count($lettre3//sourceDesc/listOrg/org)"/>
                            organisations mentionnées dans le corpus.
                        </p>
                        <!-- pas d'organisations dans la lettre 1 -->
                        <ul>
                            <!--utilisation de xsl for each group afin de sélectionner les organisations via la balise org et de les grouper par leur noms via la balise orgName et aisi éviter que les mêmes lieux apparaissent plusieurs fois-->
                            <!-- regroupement de toutes les lettres dans le select pour éviter les répétitions de lieux-->
                            <xsl:for-each-group select="$lettre2//listOrg/org | $lettre3//listOrg/org" group-by="orgName">
                                <li>
                                    <!--on affiche ici la valeur de ce sur quoi la boucle itère c'est à dire la balise orgName, et aisi afficher les noms d'organisations pour chaque lettre-->
                                    <xsl:value-of select="current-grouping-key()"/>
                                    <!-- utilisation de xsl:choose pour effectuer une condition : si l'organisation est contenue dans telle lettre, le numéro de la ou les lettres est mentionné entre parenthèses avec un lien cliquable -->
                                    <xsl:for-each select="current-group()">
                                        <xsl:choose>
                                            <xsl:when test=". = $lettre2//listOrg/org"><!-- quand le noeud courant, c'est-à-dire la balise orgName est dans la lettre 2, on affiche un lien cliquable vers la lettre 2 -->
                                                <a href="lettre2.html">
                                                    (lettre 2)
                                                </a>
                                            </xsl:when>
                                            <xsl:when test=". = $lettre3//listOrg/org"><!-- quand le noeud courant, c'est-à-dire la balise orgName est dans la lettre 3, on affiche un lien cliquable vers la lettre 3 -->
                                                <a href="lettre3.html">
                                                    (lettre 3)
                                                </a>
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:for-each>
                                    <!-- ajout d'une condition pour récupérer la valeur de la balise note contenant la note descriptive associée à chaque organisation de l'index. Si la note existe, sa valeur est affichée -->
                                <xsl:if test="note">
                                    <xsl:value-of select="note"/>
                                </xsl:if>
                                </li> 
                            </xsl:for-each-group>
                        </ul>
                    </div>
                    
                    <div style="margin: 2em 0 2em 0;">
                        <!--ajout des oeuvres mentionnées dans les lettres à l'index-->
                        <h2>Oeuvres</h2>
                        <!-- utilisation de count() pour afficher le nombre d'oeuvres mentionnées dans le corpus et dont affiche la valeur -->
                        <p>
                            <xsl:value-of select="count($lettre2//sourceDesc/listBibl/bibl)"/>
                            oeuvres mentionnées dans le corpus.
                        </p>
                        <ul>
                            <!-- utilisation d'un simple xsl:for-each pour sélectionner la balise bibl puisque seule la lettre 2 mentionne des oeuvres -->
                            <xsl:for-each select="$lettre2//listBibl/bibl">
                                <li>
                                    <!--on récupère ici la valeur de chaque balise enfant de bibl, afin d'avoir une mise en forme correcte et de pouvoir choisir uniquement les éléments pertinents-->
                                    <em><xsl:value-of select="title"/></em>, 
                                    <xsl:value-of select="author"/>
                                    (<xsl:value-of select="date"/>)
                                    - <xsl:value-of select="note"/>
                                    
                                    <!-- utilisation de xsl:choose pour effectuer une condition : si l'oeuvre est contenue dans telle lettre, le numéro de la lettre est mentionnée entre parenthèses avec un lien cliquable -->
                                        <xsl:choose>
                                            <xsl:when test=". = $lettre2//listBibl/bibl"><!-- quand le noeud courant, c'est-à-dire la balise bibl est dans la lettre 2, on affiche un lien cliquable vers la lettre 2 -->
                                                <a href="lettre2.html">
                                                    (lettre 2)
                                                </a>
                                            </xsl:when>
                                        </xsl:choose>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </div>
                    </div>
                    <xsl:copy-of select="$footer"/><!-- copie du footer commun à toutes las pages du site -->
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template name="Lettre1"> <!-- template qui renvoie la page html sur la première lettre du corpus -->
        <xsl:result-document href="out/lettre1.html" method="html" indent="yes">
            <html lang="fr">
                <xsl:copy-of select="$head"/><!-- copie du head commun à toutes les pages du site -->
                <body style="margin: 2em 20em 5em 20em; font-family: 'Roboto', serif;">
                    <!--ajout d'un conteneur pour créer des marges autour des éléments de la page-->
                    <div class="container py-4">
                    <xsl:copy-of select="$header"/><!--copie du header commun à toutes les pages-->
                    <h1 style="text-align: center;"><xsl:value-of select="$lettre1//titleStmt/title"/></h1><!-- on récupère la valeur de la balise title pour afficher le titre de la lettre -->
                        <h2>Métadonnées</h2>
                    <div class="row g-3 mt-2">
                        <!--création de trois colonnes de métadonnées réparties sur la largeur de la page-->
                        <div class="col-md-4">
                            <div class="metadonnees">
                                <h3><strong>Identification</strong></h3><!-- métadonnées d'identification générales -->
                                <ul>
                                <!--On récupère ici les métadonnées générales avec des xsl:value-of-->
                                    <li><strong>Titre : </strong>
                                        <xsl:value-of select="$lettre1//titleStmt/title"/>
                                    </li>
                                    <li><strong>Auteur : </strong>
                                        <xsl:value-of select="$lettre1//titleStmt/author/persName"/>
                                    </li>
                                    <li><strong>Destinataire : </strong>
                                        <xsl:value-of select="$lettre1//correspAction/persName[@type='recipient']"/>
                                    </li>
                                    <li><strong>Date d'écriture : </strong>
                                        <xsl:value-of select="$lettre1//correspAction/date"/>
                                    </li>
                                    <li><strong>Lieu d'écriture : </strong> 
                                        <xsl:value-of select="$lettre1//correspAction/placeName"/>
                                    </li>
                                </ul>
                         </div>
                        </div>
                        <!--métadonnées de conservation-->
                        <div class="col-md-4">
                            <div class="metadonnees">
                                <h3><strong>Conservation</strong></h3>
                                <ul>
                                    <!--on affiche la valeur des balises des métadonnées de conservation-->
                                    <li><strong>Conservée à : </strong>
                                        <xsl:value-of select="$lettre1//msIdentifier/repository"/>
                                    </li>
                                    <li><strong>Partie de : </strong>
                                        <xsl:value-of select="$lettre1//msIdentifier/collection"/>
                                    </li>
                                    <li><strong>Cote : </strong>
                                        <xsl:value-of select="$lettre1//msIdentifier/idno"/>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- métadonnées de description-->
                        <div class="col-md-4">
                            <div class="metadonnees">
                                <h3><strong>Description</strong></h3>
                                <!-- on affiche la valeur des balises de métadonnées de description -->
                                <ul>
                                    <li><strong>Support : </strong>
                                        <xsl:value-of select="$lettre1//supportDesc/@material"/>
                                    </li>
                                    <li><strong>Étendue : </strong> 
                                        <xsl:value-of select="$lettre1//supportDesc/extent"/>
                                    </li>
                                    <li><strong>État : </strong>
                                        <xsl:value-of select="$lettre1//supportDesc/condition"/>
                                    </li>
                                    <li><strong>Mise en page : </strong>
                                        <xsl:value-of select="$lettre1//layoutDesc/layout"/>
                                    </li>
                                    <li><strong>Nombre de mains : </strong>
                                        <xsl:value-of select="$lettre1//handDesc/@hands"/>
                                    </li>
                                    <li><strong>Types de mains : </strong>
                                        <xsl:value-of select="$lettre1//handDesc/handNote"/>
                                    </li>
                                    <li><strong>Particularités : </strong>
                                        <xsl:value-of select="$lettre1//additions"/>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <ul>
                            <!--Informations d'encodage-->
                            <li><strong>Encodé par : </strong>
                                <xsl:value-of select="$lettre1//respStmt/name"/>
                            </li>
                        </ul>
                        <!-- résumé de la lettre-->
                        <div>
                            <h2>Résumé</h2>
                            <p><xsl:value-of select="$lettre1//msContents/summary"/></p>
                        </div>
                    </div>
                    <div class="row mt-4"> <!-- utilisation de bootstrap pour diviser la page en deux et mettre la transcription et l'image de la lettre côte à côte-->
                        <div class="col-md-6">
                        <h2>Corps de la lettre</h2>
                        <!-- Utilisation de xsl:apply templates pour traiter les templates des balises enfant du corps du texte de la lettre et ainsi garder une mise en forme conforme pour chaque élément. 
                            Les templates pour chaque élément du corps de la lettre se situent plus bas-->
                            <xsl:apply-templates select="$lettre1//body"/>
                        </div>
                    <!--Ajout du pdf de numérisation de la lettre 1-->
                        <div class="col-md-6">
                    <h2>Tapuscrit</h2>
                    <embed src="letter_1.pdf" 
                        type="application/pdf" 
                        style="width: 100%; height: 800px;"/>
                </div>
                    </div>
                    </div>
                    <xsl:copy-of select="$footer"/><!-- copie du footer commun à toutes les pages -->
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- Création de templates pour chaque élément enfant du corps de la lettre, afin d'obtenir une mise en forme conforme à la msie en forme originale-->
    <xsl:template match="opener"><!--template pour l'ouverture de la lettre-->
        <div style="margin-bottom: 1em;">
            <!-- on applique ce template à tous les enfants de "opener" pour qu'ils soient placés en haut à gauche du corps de la lettre -->
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!--placement du lieu et de la date en haut à droite -->
    <xsl:template match="dateline">
        <p style="text-align: right; font-style: italic;">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <!-- création d'une condition pour la balise "fw", qui correspond à une entête située^t avant la balise "opener" et dont l'aspect diffère pour les lettres 2 et 3 -->
    <xsl:template match="fw">
        <xsl:choose>
            <!--si la balise fw est contenue dans la lettre 3, le texte est mis en italique, en majuscules et centré-->
            <xsl:when test=". = $lettre3//fw">
                <div style="font-style: italic; text-transform: uppercase; text-align: center; margin-bottom: 1em;">
                    <xsl:apply-templates/>
                </div>
            </xsl:when>
            <xsl:otherwise> <!-- sinon, (pour la lettre 2), le texte est seulement mis en italique -->
                <div style="font-style: italic; margin-bottom: 1em;">
                    <xsl:apply-templates/>
                </div>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    
    <!--création d'un nouveau paragraphe pour les salutations, pour qu'elles soient détachées du corps du texte-->
    <xsl:template match="salute">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <!--on matche ici les paragraphes du corps de la lettre pour qu'ils restent indépendants les uns des autres-->
    <xsl:template match="p">
        <p style="text-indent: 2em;">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <!--pour les retours à la ligne, on utilise une boucle pour créer visuellement un alinéa lorsqu'il y en a un-->
    <xsl:template match="lb">
        <xsl:choose>
            <!--quand un retour à la ligne possède l'attribut @rend dont la valeur est indent, un alinéa est créé. -->
            <xsl:when test="@rend='indent'">
                <br/>
                <span style="display: inline-block; width: 2em;"></span>
            </xsl:when>
            <!--sinon, un retour à la ligne simple est effectué-->
            <xsl:otherwise>
                <br/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!--pour les noms de personnes mentionnées dans la lettre, on crée un lien cliquable vers l'index-->
    <xsl:template match="persName">
        <a href="index.html" style="color: #8B4513; text-decoration: none;">
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    
    <!--même chose pour les noms de lieux, on crée un lien cliquable vers l'index-->
    <xsl:template match="placeName">
        <a href="index.html" style="color: #2F4F4F; text-decoration: none;">
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    
    <!--Mise en forme des titres d'oeuvre dans une couleur différente du corps du texte et en italique, avec un lien cliquable vers l'index-->
    <xsl:template match="bibl">
        <a href="index.html"><em style="color: #4B0082;">
                <xsl:apply-templates/>
        </em>
        </a>
    </xsl:template>
    
    <!--Mise en forme des noms d'organisations dans uen couleur différente avec un lien cliquable vers l'index-->
    <xsl:template match="orgName">
        <a href="index.html" style="color: #006400; text-decoration: none;">
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    
    <!--mise en forme des ajouts manuscrits dans une couleur différente du corps du texte-->
    <xsl:template match="add">
        <span style="color: #8B0000; font-style: italic;">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <!--on match ici la balise hi dont l'attribut @rend est de valeur underlined, afin de conserver le soulignement du texte tel que dans la lettre originale-->
    <xsl:template match="hi[@rend='underlined']">
        <span style="text-decoration: underline;">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <!--template de mise en forme pour la balise de fermeture de la lettre, pour le placer en bas à gauche du body-->
    <xsl:template match="closer">
        <div style="margin-top: 1em;">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!--template pour la signature de la lettre, seulement présente dans la lettre 1 et illisible. On la remplace par le texte [signature]-->
    <xsl:template match="signed">
        <p style="font-style: italic;">[signature]</p>
    </xsl:template>
    
    <!--Mise en forme de la note de bas de page dans la même couleur que l'astérisque, séparée du corps de la lettre par une barre horizontaleê-->
    <xsl:template match="note">
        <div style="margin-top: 2em; border-top: 1px solid gray; font-size: 0.9em; color: #555;">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!-- template qui renvoie la page html de la 2e lettre du corpus -->
    <xsl:template name="Lettre2"> 
        <xsl:result-document href="out/lettre2.html" method="html" indent="yes">
            <html lang="fr">
                <xsl:copy-of select="$head"/><!-- copie du head commun à toutes les pages -->
                <body style="margin: 2em 20em 5em 20em; font-family: 'Roboto', serif;">
                    <!--ajout d'un conteneur pour créer des marges autour des éléments de la page-->
                    <div class="container py-4">
                    <xsl:copy-of select="$header"/><!-- copie du header commun à toutes les pages -->
                    <h1 style="text-align: center;"><xsl:value-of select="$lettre2//titleStmt/title"/></h1> <!--on récupère la valeur de la balsie title pour afficher le titre de la lettre-->
                    <div style="margin: 2em 0 2em 0;">
                        <h2>Métadonnées</h2>
                        <div class="row g-3 mt-2">
                            <!--création de trois colonnes de métadonnées réparties sur la largeur de la page-->
                            <div class="col-md-4">
                                <div class="metadonnees">
                                    <h3><strong>Identification</strong></h3><!-- métadonnées générales d'identfication -->
                                    <ul>
                                    <!-- On récupère la valeur des balises pertinentes comme méatdonnées d'identification-->
                                        <li><strong>Titre : </strong>
                                            <xsl:value-of select="$lettre2//titleStmt/title"/>
                                        </li>
                                        <li><strong>Auteur : </strong>
                                            <xsl:value-of select="$lettre2//titleStmt/author/persName"/>
                                        </li>
                                        <li><strong>Destinataire : </strong>
                                            <xsl:value-of select="$lettre2//correspAction/persName[@type='recipient']"/>
                                        </li>
                                        <li><strong>Date d'écriture : </strong>
                                            <xsl:value-of select="$lettre2//correspAction/date"/>
                                        </li>
                                        <li><strong>Lieu d'écriture : </strong> 
                                            <xsl:value-of select="$lettre2//correspAction/placeName"/>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        <!-- métadonnées de conservation -->
                             <div class="col-md-4">
                                  <div class="metadonnees">
                                       <h3><strong>Conservation</strong></h3>
                                        <ul>
                                            <!-- on récupère la valeur des balises pertinentes comme métadonnées de conservation -->
                                            <li><strong>Conservée à : </strong> 
                                                <xsl:value-of select="$lettre2//msIdentifier/repository"/>
                                            </li>
                                            <li><strong>Partie de : </strong>
                                                <xsl:value-of select="normalize-space($lettre2//msIdentifier/collection)"/>
                                            </li>
                                            <li><strong>Cote : </strong>
                                                <xsl:value-of select="$lettre2//msIdentifier/idno"/>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                        <!--métadonnées de description physique-->
                                <div class="col-md-4">
                                     <div class="metadonnees">
                                            <h3><strong>Description</strong></h3>
                                            <ul>
                                                <!-- on récupère la valeur des balises pertinentes comme métadonnées de description -->
                                                <li><strong>Support : </strong>
                                                    <xsl:value-of select="$lettre2//supportDesc/@material"/>
                                                </li>
                                                <li><strong>Etendue : </strong>
                                                    <xsl:value-of select="$lettre2//supportDesc/extent"/>
                                                </li>
                                                <li><strong>État : </strong>
                                                    <xsl:value-of select="$lettre2//supportDesc/condition"/>
                                                </li>
                                                <li><strong>Mise en page : </strong>
                                                    <xsl:value-of select="$lettre2//layoutDesc/layout"/>
                                                </li>
                                                <li><strong>Nombre de mains : </strong>
                                                    <xsl:value-of select="$lettre2//handDesc/@hands"/>
                                                </li>
                                                <li><strong>Type d'écriture : </strong>
                                                    <xsl:value-of select="$lettre2//handDesc/handNote"/>
                                                </li>
                                                <li><strong>Particularités : </strong>
                                                    <xsl:value-of select="$lettre2//additions"/>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                        </div>
                        <!--métadonnées d'encodage-->
                        <ul>
                            <li><strong>Encodé par : </strong>
                                <xsl:value-of select="$lettre2//respStmt/name"/>
                            </li>
                        </ul>
                        <!--Résumé du contenu de la lettre-->
                        <div>
                            <h2>Résumé</h2>
                            <p><xsl:value-of select="$lettre2//msContents/summary"/></p>
                        </div>
                        
                    </div>
                    <div class="row mt-4"> <!-- utilisation de bootstrap pour diviser la page en deux et mettre la transcription et l'image de la lettre côte à côteô-->
                        <div class="col-md-6" style="padding-left: 3rem;">
                        <h2>Corps de la lettre</h2>
                        <!-- utilisation de apply templates pour traiter les balises enfant du corps du texte de la lettre et ainsi garder la mise en forme pour chaque élément -->
                        <div><xsl:apply-templates select="$lettre2//body"/></div>
                    </div>
                    <!-- affichage de l'image de la lettre 2 -->
                        <div class="col-md-6">
                             <h2>Tapuscrit</h2>
                             <img src="lettre_2.jpg" 
                                 alt="Lettre de François Truffaut à Georges Delerue" 
                                 style="width: 100%; max-width: 800px; display: block; margin: auto"/>
                         </div>
                    </div>
                    </div>
                    <xsl:copy-of select="$footer"/><!--copie du footer commun à toutes les pages-->
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>    
    
    
    <!-- template qui renvoie la page html contenant la troisième lettre du corpus -->
    <xsl:template name="Lettre3"> 
        <xsl:result-document href="out/lettre3.html" method="html" indent="yes">
            <html lang="fr">
                <xsl:copy-of select="$head"/><!-- copie du head commun à toutes les pages -->
                <body style="margin: 2em 20em 5em 20em; font-family: 'Roboto', serif;">
                    <!--ajout d'un conteneur pour créer des marges autour des éléments de la page-->
                    <div class="container py-4">
                    <xsl:copy-of select="$header"/><!-- copie du header commun à toutes les pages -->
                    <h1 style="text-align: center;"><xsl:value-of select="$lettre3//titleStmt/title"/></h1><!-- on récupère la valeur de la balise title pour afficher le titre de la lettre -->
                    <div style="margin: 2em 0 2em 0;">
                        <h2>Métadonnées</h2>
                        <div class="row g-3 mt-2">
                            <!--création de trois colonnes de métadonnées réparties sur la largeur de la page-->
                            <div class="col-md-4">
                                <div class="metadonnees">
                                  <!-- métadonnées générales d'identification-->
                                    <h3><strong>Identification</strong></h3>
                                    <ul>
                                        <!-- on récupère la valeur des balises pertinentes comme métadonnées d'identification -->
                                         <li><strong>Titre : </strong>
                                             <xsl:value-of select="$lettre3//titleStmt/title"/>
                                         </li>
                                         <li><strong>Auteur : </strong>
                                             <xsl:value-of select="$lettre3//titleStmt/author/persName"/>
                                         </li>
                                         <li><strong>Destinataire : </strong>
                                             <xsl:value-of select="$lettre3//correspAction/persName[@type='recipient']"/>
                                         </li>
                                         <li><strong>Date d'écriture : </strong>
                                             <xsl:value-of select="$lettre3//correspAction/date"/>
                                         </li>
                                     </ul>
                                </div>
                            </div>
                        <!-- métadonnées de conservation -->
                            <div class="col-md-4">
                                <div class="metadonnees">
                                    <h3><strong>Conservation</strong></h3>
                                    <ul>
                                        <!-- on récupère la valeur des balises pertinentes comme métadonnées de conservation -->
                                        <li><strong>Conservée à : </strong>
                                            <xsl:value-of select="$lettre3//msIdentifier/repository"/>
                                        </li>
                                        <li><strong>Cote : </strong>
                                            <xsl:value-of select="$lettre3//msIdentifier/idno"/>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        <!--métadonnées de description physique-->
                            <div class="col-md-4">
                                <div class="metadonnees">
                                    <h3><strong>Description</strong></h3>
                                    <ul>
                                        <!-- on récupère la valeur des balises pertinentes comme métadonnées de description -->
                                        <li><strong>Support : </strong>
                                            <xsl:value-of select="$lettre2//supportDesc/@material"/>
                                        </li>
                                        <li><strong>Étendue : </strong>
                                            <xsl:value-of select="$lettre3//supportDesc/extent"/>
                                        </li>
                                        <li><strong>Mise en page : </strong>
                                            <xsl:value-of select="$lettre3//layoutDesc/layout"/>
                                        </li>
                                        <li><strong>Nombre de mains : </strong>
                                            <xsl:value-of select="$lettre3//handDesc/@hands"/>
                                        </li>
                                        <li><strong>Type d'écriture : </strong>
                                            <xsl:value-of select="$lettre3//handDesc/handNote"/>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- métadonnées d'encodage-->
                        <ul>
                            <li><strong>Encodé par : </strong>
                                <xsl:value-of select="$lettre3//respStmt/name"/>
                            </li>
                        </ul>
                        <!-- résumé du contenu de la lettre-->
                        <div>
                            <h2>Résumé</h2>
                            <p><xsl:value-of select="$lettre3//msContents/summary"/></p>
                        </div>
                        
                    </div>
                    <div class="row mt-4 align-items-start"> <!-- utilisation de bootstrap pour diviser la page en deux et mettre la transcription et l'image de la lettre côte à côteô-->
                        <div class="col-md-6" style="padding-left: 3rem;">
                        <h2>Corps de la lettre</h2>
                        <!-- appel des templates déjà définis pour les balises enfants du body de chaque lettre-->
                        <div>
                            <xsl:apply-templates select="$lettre3//body"/>
                        </div>
                        </div>
                    
                           <!-- affichage de l'image de la lettre3 -->
                        <div class="col-md-6">
                           <h2>Tapuscrit</h2>
                           <embed src="lettre_3.pdf" 
                               type="application/pdf" 
                               style="width: 100%; height: 800px;"/>
                       </div>
                    </div>
                    </div>
                    <xsl:copy-of select="$footer"/><!-- copie du footer commun à toute les pages -->
                </body>
                
            </html>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>