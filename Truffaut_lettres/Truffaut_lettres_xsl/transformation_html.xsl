<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    version="2.0">
    
    <xsl:output method="html"/>
    
    <!--création de trois variables qui appellent les trois fichiers xml source avec la fonction document()-->
    <xsl:variable name="lettre1" select="doc('../xml/letter1_tei_all.xml')"/>
    <xsl:variable name="lettre2" select="doc('../xml/Lettre_2.xml')"/>
    <xsl:variable name="lettre3" select="doc('../xml/letter_3.xml')"/>
    
    <!--création d'une variable contenant le head des documents html-->
    <xsl:variable name="head">
        <head>
            <meta charset="utf-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1"/>
            <!--chargement du CSS de Bootstrap pour le placement des éléments du site et leur style individuel-->
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"/>
            
            <!--chargement de ma feuille de style CSS pour le style global du site-->
            <link rel="stylesheet" href="style.css"/>
            <link rel="preconnect" href="https://fonts.googleapis.com"/>
            <link rel="preconnect" href="https://fonts.gstatic.com" />
            <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&amp;display=swap" rel="stylesheet"/>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
            <script src="https://openseadragon.github.io/openseadragon/openseadragon.min.js"></script>
            <title>Lettres de François Truffaut</title>
            <style>
                #navbar > ul > li {
                display: inline-block;
                list-style: none;
                }
            </style>
        </head>
    </xsl:variable>
    
    <!--création d'une variable qui contient le footer des documents html-->
    <xsl:variable name="footer"><footer style="margin: 5em 0 0 0;">
            <hr/>
            <p>Site réalisé dans le cadre du cours de XSLT du Master TNAH de l'École nationale des chartes.</p>
    </footer></xsl:variable>
    
    <!--création d'une variable header qui contient l'entête du site avec la barre de navigation-->
    <xsl:variable name="header">
        <header class="py-3 mb-4" style="background-color: #e3f2fd;">
            <div class="container">
                <h1 class="text-center mb-3" style="font-family: 'Roboto', serif; font-size: 1.5rem;">
                    Correspondances de <xsl:value-of select="//titleStmt/author"/>
                </h1>
                <nav class="navbar bg-body-tertiary" style="background-color: #e3f2fd;" data-bs-theme="light" id="navbar">
                    <div class="container-fluid justify-content-center">
                        <ul class="navbar-nav flex-row list-unstyled gap-3 justify-content-center">
                            <li><a class="nav-link" href="home.html"><button class="btn btn-sm btn-outline-secondary" type="button">Accueil</button></a></li>
                            <li><a class="nav-link" href="lettre1.html"><button class="btn btn-sm btn-outline-secondary" type="button">Lettre 1</button></a></li>
                            <li><a class="nav-link" href="lettre2.html"><button class="btn btn-sm btn-outline-secondary" type="button">Lettre 2</button></a></li>
                            <li><a class="nav-link" href="lettre3.html"><button class="btn btn-sm btn-outline-secondary" type="button">Lettre 3</button></a></li>
                            <li><a class="nav-link" href="index.html"><button class="btn btn-sm btn-outline-secondary" type="button">Index</button></a></li>
                        </ul>
                    </div>
                 </nav>
            </div>
        </header>
    </xsl:variable>
    
    <!--création d'un template qui matche la racine et qui appelle les templates correspondant aux fichiers de sortie html-->
    <xsl:template match="/">
        <xsl:call-template name="home"/>
        <xsl:call-template name="index"/>
        <xsl:call-template name="Lettre1"/>
        <xsl:call-template name="Lettre2"/>
        <xsl:call-template name="Lettre3"/>-->
    </xsl:template>
    
    <!--création d'un template qui apelle la page d'accueil du site-->
    <xsl:template name="home">
        <xsl:result-document href="out/home.html" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body style="margin: 2em 20em 5em 20em; font-family: 'Roboto', serif;">
                    <xsl:copy-of select="$header"/>
                    <h1 style="text-align: center;">Accueil</h1>
                    
                    <div style="margin: 2em 0 2em 0;">
                        <p>Ce site propose trois lettres issues des archives de <xsl:value-of select="$lettre1//titleStmt/author/persName"/></p>
                    </div>
                    <div style="margin: 2em 0 2em 0;">
                        <h2>Informations sur la collection:</h2>                        
                        <ul>
                            <li>Institution: <xsl:value-of select="$lettre1//msIdentifier/repository"/></li>
                            <li>Cote: <xsl:value-of select="$lettre1//msIdentifier/collection"/></li>
                            <li>Numérisation: <xsl:value-of select="$lettre1//msIdentifier/country"/></li>
                        </ul>
                    </div>
                    <div style="margin: 2em 0 2em 0;">
                    <h2>Lettres disponibles:</h2>
                    <ul>
                        <li><a href="lettre1.html"><xsl:value-of select="$lettre1//titleStmt/title"/>
                        </a></li>
                        <li><a href="lettre2.html"><xsl:value-of select="$lettre2//titleStmt/title"/>
                        </a></li>
                        <li><a href="lettre3.html"><xsl:value-of select="$lettre3//titleStmt/title"/>
                        </a></li>
                    </ul>
                    </div>
                </body>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- template contenant l'index du site -->
    <xsl:template name="index"> 
        <xsl:result-document href="out/index.html" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body class="p-3" style="margin: 2em 20em 5em 20em; font-family: 'Roboto', serif;">
                    <xsl:copy-of select="$header"/>
                    <h1 style="text-align: center;">Index</h1>
                    <div class="container-fluid px-4" style="margin: 2em 0 2em 0;">
                        <p>Cette page propose un index de noms de personnes, lieux, oeuvres et organisations mentionnés dans les trois lettres issues des archives de François Truffaut</p>
                    </div>
                    <div style="margin: 2em 0 2em 0;">
                        <h2>Personnes</h2>
                        <ul>
                            <!-- Boucle sur les noms de personne de la lettre 1 pour prendre la valeur de persName et faire le lien avec la lettre-->
                            <!--utilisation de xsl for each group afin de regrouper les noms de personnes par lettre et éviter qu'ils apparaissent plusieurs fois-->
                            <!-- exclusion du type 'fictional' pour les personnes, les personnes fictives serot ajoutées dans une section à part de l'index, plus bas -->
                            <xsl:for-each-group select="$lettre1//sourceDesc/listPerson[not(@type='fictional')]/person | $lettre2//sourceDesc/listPerson[not(@type='fictional')]/person | $lettre3//sourceDesc/listPerson[not(@type='fictional')]/person" group-by="persName">
                                <li>
                                    <!--on sélectionne ici la valeur de la clé d'itération du current group, c'est à dire celui de "persName" sélectionné dans la boucle-->
                                    <xsl:value-of select="current-grouping-key()"/>
                                    
                                    <!-- utilisation de xsl:choose pour effectuer une condition : si la personne est contenue dans telle lettre, le nom de la ou les lettres sont mentionnées entre parenthèses avec un lien cliquable -->
                                    <xsl:for-each select="current-group()">
                                        <xsl:choose>
                                            <xsl:when test=". = $lettre1//sourceDesc/listPerson/person">
                                                <a href="lettre1.html">
                                                    (lettre 1)
                                                </a>
                                            </xsl:when>
                                            <xsl:when test=". = $lettre2//sourceDesc/listPerson/person">
                                                <a href="lettre2.html">
                                                    (lettre 2)
                                                </a>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <a href="lettre3.html">
                                                    (lettre 3)
                                                </a>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:for-each>
                                    
                                    <!-- ajout d'une condition pour récupérer la note descriptive associée à chaque nom de personne de l'index. Si la note existe, sa valeur est affichée -->
                                    <xsl:if test="note">
                                        <br/>
                                        <xsl:value-of select="note"/>
                                    </xsl:if>
                                </li>
                            </xsl:for-each-group>
                        </ul>
                        
                        <!-- création dune autre boucle pour les personnages fictifs mentionnés -->
                        <h2>Personnages fictifs</h2>
                        <ul>
                            <xsl:for-each select="$lettre2//sourceDesc/listPerson[@type='fictional']/person">
                            <li>
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
                        <!--même logique pour les lieux-->
                        <h2>Lieux</h2>
                        <ul>
                            <!-- boucle pour récupérer la valeur de placeName -->
                            <!--utilisation de xsl for each group afin de regrouper les noms de lieux par lettre et éviter qu'ils apparaissent plusieurs fois-->
                            <!-- regroupement de toutes les lettres dans le select pour éviter les répétitions de lieux-->
                            <xsl:for-each-group select="$lettre1//listPlace/place | $lettre2//listPlace/place | $lettre3//listPlace/place" group-by="placeName">
                                <li>
                                    <!--on sélectionne ici la valeur de la clé d'itération du current group, c'est à dire celui de "placeName" sélectionné dans la boucle-->
                                    <xsl:value-of select="current-grouping-key()"/>
                                    <!-- utilisation de xsl:choose pour effectuer une condition : si le lieu est contenu dans telle lettre, le nom de la ou les lettres sont mentionnées entre parenthèses avec un lien cliquable -->
                                    <xsl:for-each select="current-group()">
                                        <xsl:choose>
                                             <xsl:when test=". = $lettre1//listPlace/place">
                                                 <a href="lettre1.html">
                                                     (lettre 1)
                                                 </a>
                                             </xsl:when>
                                                 <xsl:when test=". = $lettre2//listPlace/place">
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
                        <!-- pas d'organisations dans la lettre 1 -->
                        <ul>
                            <!-- boucle pour récupérer la valeur de orgName-->
                            <!--utilisation de xsl for each group afin de regrouper les noms des organisations par lettre et éviter qu'ils apparaissent plusieurs fois-->
                            <!-- regroupement de toutes les lettres dans le select pour éviter les répétitions de lieux-->
                            <xsl:for-each-group select="$lettre1//listOrg/org | $lettre2//listOrg/org | $lettre3//listOrg/org" group-by="orgName">
                                <li>
                                    <!--on sélectionne ici la valeur de la clé d'itération du current group, c'est à dire celui de "orgName" sélectionné dans la boucle-->
                                    <xsl:value-of select="current-grouping-key()"/>
                                    <!-- utilisation de xsl:choose pour effectuer une condition : si l'organisation est contenue dans telle lettre, le nom de la ou les lettres sont mentionnées entre parenthèses avec un lien cliquable -->
                                    <xsl:for-each select="current-group()">
                                        <xsl:choose>
                                            <xsl:when test=". = $lettre2//listOrg/org">
                                                <a href="lettre2.html">
                                                    (lettre 2)
                                                </a>
                                            </xsl:when>
                                            <xsl:when test=". = $lettre3//listOrg/org">
                                                <a href="lettre3.html">
                                                    (lettre 3)
                                                </a>
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:for-each>
                                </li>
                                
                                <!-- ajout d'une condition pour récupérer la note descriptive associée à chaque organisation de l'index. Si la note existe, sa valeur est affichée -->
                                <xsl:if test="note">
                                    <xsl:value-of select="note"/>
                                </xsl:if>
                            </xsl:for-each-group>
                        </ul>
                    </div>
                    
                    <div style="margin: 2em 0 2em 0;">
                        <!--ajout des oeuvres mentionnées dans les lettres à l'index-->
                        <h2>Oeuvres</h2>
                        <ul>
                            <!-- utilisation d'un simple xsl:for-each pour récupérer la valeur de bibl puisque seule la lettre 2 mentionne des oeuvres -->
                            <xsl:for-each select="$lettre2//listBibl/bibl">
                                <li>
                                    <!--on sélectionne ici la valeur de chaque élément de bibl, afin d'avoir une mise en forme correcte et d'uniquement choisir les éléments pertinents-->
                                    <em><xsl:value-of select="title"/></em>
                                    <xsl:value-of select="author"/>
                                    (<xsl:value-of select="date"/>)
                                    - <xsl:value-of select="note"/>
                                    
                                    <!-- utilisation de xsl:choose pour effectuer une condition : si l'oeuvre est contenue dans telle lettre, le numéro de la lettre est mentionnée entre parenthèses avec un lien cliquable -->
                                        <xsl:choose>
                                            <xsl:when test=". = $lettre2//listBibl/bibl">
                                                <a href="lettre2.html">
                                                    (lettre 2)
                                                </a>
                                            </xsl:when>
                                        </xsl:choose>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </div>
                </body>
                <xsl:copy-of select="$footer"/>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template name="Lettre1"> <!-- template contenant la première lettre du corpus -->
        <xsl:result-document href="out/lettre1.html" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body style="margin: 2em 20em 5em 20em; font-family: 'Roboto', serif;">
                    <xsl:copy-of select="$header"/>
                    <h1 style="text-align: center;">Première lettre du corpus : <xsl:value-of select="$lettre1//titleStmt/title"/></h1>
                    
                    <div style="margin: 2em 0 2em 0;">
                        <p>Cette page propose un encodage d'une lettre issue des archives de François Truffaut accompagnée de ses métadonnées</p>
                    </div>
                    <div style="margin: 2em 0 2em 0;">
                        <h2>Métadonnées</h2>
                        <!--On récupère ici les métadonnées pertinentes avec des xsl:value-of-->
                        <!--métadonnées générales-->
                        <ul>
                            <li>Titre :
                                <xsl:value-of select="$lettre1//titleStmt/title"/>
                            </li>
                            <li>Auteur :
                                <xsl:value-of select="$lettre1//titleStmt/author/persName"/>
                            </li>
                            <li>Destinataire :
                                <xsl:value-of select="$lettre1//correspAction/persName[@type='recipient']"/>
                            </li>
                            <li>Date d'écriture :
                                <xsl:value-of select="$lettre1//correspAction/date"/>
                            </li>
                            <li>Lieu d'écriture : 
                                <xsl:value-of select="$lettre1//correspAction/placeName"/>
                            </li>
                        </ul>
                        <!--métadonnées de conservation-->
                        <ul>
                            <li>Conservée à : 
                                <xsl:value-of select="$lettre1//msIdentifier/repository"/>
                            </li>
                            <li>Partie de :
                                <xsl:value-of select="normalize-space($lettre1//msIdentifier/collection)"/>
                            </li>
                            <li>Cote :
                                <xsl:value-of select="$lettre1//msIdentifier/idno"/>
                            </li>
                        </ul>
                        <!-- métadonnées de description-->
                        <ul>
                            <li><strong>Support : </strong>
                                <xsl:value-of select="$lettre1//supportDesc/@material"/>
                            </li>
                            <li>Étendue : 
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
                            <!--Informations d'encodage-->
                            <li><strong>Encodé par : </strong>
                                <xsl:value-of select="$lettre1//respStmt/name"/>
                            </li>
                            <li><strong>Description du projet : </strong>
                                <xsl:value-of select="$lettre1//projectDesc/ab"/>
                            </li>
                        </ul>
                        <!-- résumé de la lettre-->
                        <div>
                            <h2>Résumé</h2>
                            <p><xsl:value-of select="$lettre1//msContents/summary"/></p>
                        </div>
                    </div>
                    <div>
                        <h2>Corps de la lettre</h2>
                        <!-- utilisation de apply templates pour traiter les balises enfant du corps du texte de la lettre et ainsi garder la mise en forme conforme pour chaque élément de la lettre. 
                            Les templates pour chaque élément du corps de la lettre se situent plus bas-->
                        <p><xsl:apply-templates select="$lettre1//body"/></p>
                    </div>
                    <!--Ajout du pdf de numérisation de la lettre 1-->
                <div style="margin: 2em 0 2em 0;">
                    <h2>Fac-similé</h2>
                    <embed src="letter_1.pdf" 
                        type="application/pdf" 
                        width="100%" 
                        height="800px"/>
                </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- Création de templates pour chaque élément enfant du corps de la lettre, afin d'obtenir une mise en forme conforme à la msie en forme originale-->
    <!--template pour l'ouverture de la lettre-->
    <xsl:template match="opener">
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
    
    <!--On conserve les retours à la ligne intégrés au fichier xml-->
    <xsl:template match="lb">
        <br/>
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
    
    <!--ajout de l'astérisque qui renvoie à la note de bas de page, dans une couleur différente, intégrée au corps du texte-->
    <xsl:template match="add">
        <span style="color: #8B0000; font-style: italic;" title="Ajout manuscrit">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <!--on conserve ici le soulignement du texte tel que dans le xml, pour la note de bas de page-->
    <xsl:template match="hi[@rend='underlined']">
        <span style="text-decoration: underline;">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <!--template de mise en forme pour la fermeture de la lettre, en bas à gauche du body-->
    <xsl:template match="closer">
        <div style="margin-top: 1em;">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!--template pour la signature de la lettre qui est illisible-->
    <xsl:template match="signed">
        <p style="font-style: italic;">[signature]</p>
    </xsl:template>
    
    <!--Mise en forme de la note de bas de page dans la même couleur que l'astérisque, séparée du corps de la lettre par une barre horizontaleê-->
    <xsl:template match="note">
        <div style="margin-top: 2em; border-top: 1px solid gray; font-size: 0.9em; color: #555;">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!-- page pour la deuxième lettre -->
    <xsl:template name="Lettre2"> <!-- template contenant la deuxième lettre du corpus -->
        <xsl:result-document href="out/lettre2.html" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body style="margin: 2em 20em 5em 20em; font-family: 'Roboto', serif;">
                    <xsl:copy-of select="$header"/>
                    <h1 style="text-align: center;">Deuxième lettre du corpus : <xsl:value-of select="$lettre2//titleStmt/title"/></h1>
                    
                    <div style="margin: 2em 0 2em 0;">
                        <p>Cette page propose un encodage d'une lettre issue des archives de François Truffaut accompagnée de ses métadonnées</p>
                    </div>
                    <div style="margin: 2em 0 2em 0;">
                        <h2>Métadonnées</h2>
                        <!--utilisation de xsl:value-of afin de sélectionner les métadonnées pertinentes à integrer dans notre page html-->
                        <!-- métadonnées générales -->
                        <ul>
                            <li>Titre :
                                <xsl:value-of select="$lettre2//titleStmt/title"/>
                            </li>
                            <li>Auteur :
                                <xsl:value-of select="$lettre2//titleStmt/author/persName"/>
                            </li>
                            <li>Destinataire :
                                <xsl:value-of select="$lettre2//correspAction/persName[@type='recipient']"/>
                            </li>
                            <li>Date d'écriture :
                                <xsl:value-of select="$lettre2//correspAction/date"/>
                            </li>
                            <li>Lieu d'écriture : 
                                <xsl:value-of select="$lettre2//correspAction/placeName"/>
                            </li>
                        </ul>
                        <!-- conservation -->
                        <ul>
                            <li>Conservée à : 
                                <xsl:value-of select="$lettre2//msIdentifier/repository"/>
                            </li>
                            <li>Partie de :
                                <xsl:value-of select="normalize-space($lettre2//msIdentifier/collection)"/>
                            </li>
                            <li>Cote :
                                <xsl:value-of select="$lettre2//msIdentifier/idno"/>
                            </li>
                        </ul>
                        <!--métadonnées de description physique-->
                        <ul>
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
                        <!--métadonnées d'encodage-->
                        <ul>
                            <li><strong>Encodé par : </strong>
                                <xsl:value-of select="$lettre2//respStmt/name"/>
                            </li>
                            <li><strong>Description du projet : </strong>
                                <xsl:value-of select="$lettre2//projectDesc/ab"/>
                            </li>
                        </ul>
                        <!--Résumé du contenu de la lettre-->
                        <div>
                            <h2>Résumé</h2>
                            <p><xsl:value-of select="$lettre2//msContents/summary"/></p>
                        </div>
                        
                    </div>
                    <div>
                        <h2>Corps de la lettre</h2>
                        <!-- utilisation de apply templates pour traiter les balises enfant du corps du texte de la lettre et ainsi garder la mise en forme pour chaque élément -->
                        <p><xsl:apply-templates select="$lettre2//body"/></p>
                    </div>
                    <!-- affichage de l'image de la lettre 2 -->
                <div style="margin: 2em 0 2em 0;">
                    <h2>Fac-similé</h2>
                    <img src="lettre_2.jpg" 
                        alt="Lettre de François Truffaut à Georges Delerue" 
                        style="width: 100%; max-width: 800px; display: block; margin: auto"/>
                </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- On utilise ici des apply templates pour garder la mise en forme spécifique aux balises enfant du body de la lettre2 -->
    <!--mise en forme de l'entête de la lettre, en haut à gauche-->
    <xsl:template match="fw">
        <div style="font-style:;">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!--Mise en forme des titres d'oeuvre dans une couleur différente du corps du texte et en italique, avec un lien cliquable vers l'index-->
    <xsl:template match="bibl">
        <a href="index.html"><em style="color: #4B0082;">
            <xsl:apply-templates/>
        </em>
        </a>
    </xsl:template>
    
    <!--Mise en forme des noms d'orgaisations dans uen couleur différente avec un lien cliquable vers l'index-->
    <xsl:template match="orgName">
        <a href="index.html" style="color: #006400; text-decoration: none;">
            <xsl:apply-templates/>
        </a>
    </xsl:template>
    
    <!-- template contenant la troisième lettre du corpus -->
    <xsl:template name="Lettre3"> 
        <xsl:result-document href="out/lettre3.html" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body style="margin: 2em 20em 5em 20em; font-family: 'Roboto', serif;">
                    <xsl:copy-of select="$header"/>
                    <h1 style="text-align: center;">Troisième lettre du corpus : <xsl:value-of select="$lettre3//titleStmt/title"/></h1>
                    
                    <div style="margin: 2em 0 2em 0;">
                        <p>Cette page propose un encodage d'une lettre issue des archives de François Truffaut accompagnée de ses métadonnées</p>
                    </div>
                    <div style="margin: 2em 0 2em 0;">
                        <h2>Métadonnées</h2>
                        <!-- métadonnées générales -->
                        <ul>
                            <li>Titre :
                                <xsl:value-of select="$lettre3//titleStmt/title"/>
                            </li>
                            <li>Auteur :
                                <xsl:value-of select="$lettre3//titleStmt/author/persName"/>
                            </li>
                            <li>Destinataire :
                                <xsl:value-of select="$lettre3//correspAction/persName[@type='recipient']"/>
                            </li>
                            <li>Date d'écriture :
                                <xsl:value-of select="$lettre3//correspAction/date"/>
                            </li>
                            <li>Lieu d'écriture : 
                                <xsl:value-of select="$lettre3//correspAction/placeName"/>
                            </li>
                        </ul>
                        <!-- conservation -->
                        <ul>
                            <li>Conservée à : 
                                <xsl:value-of select="$lettre3//msIdentifier/repository"/>
                            </li>
                            <li>Partie de :
                                <xsl:value-of select="normalize-space($lettre3//msIdentifier/collection)"/>
                            </li>
                            <li>Cote :
                                <xsl:value-of select="$lettre3//msIdentifier/idno"/>
                            </li>
                        </ul>
                        <!--métadonnées de description physique-->
                        <ul>
                            <li><strong>Support : </strong>
                                <xsl:value-of select="$lettre3//supportDesc/extent"/>
                            </li>
                            <li><strong>État : </strong>
                                <xsl:value-of select="$lettre3//supportDesc/condition"/>
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
                            <li><strong>Particularités : </strong>
                                <xsl:value-of select="$lettre3//additions"/>
                            </li>
                        </ul>
                        <!-- métadonnées d'encodage-->
                        <ul>
                            <li><strong>Encodé par : </strong>
                                <xsl:value-of select="$lettre3//respStmt/name"/>
                            </li>
                            <li><strong>Description du projet : </strong>
                                <xsl:value-of select="$lettre3//projectDesc/ab"/>
                            </li>
                        </ul>
                        <!-- résumé du contenu de la lettre-->
                        <div>
                            <h2>Résumé</h2>
                            <p><xsl:value-of select="$lettre3//msContents/summary"/></p>
                        </div>
                        
                    </div>
                    <div>
                        <h2>Corps de la lettre</h2>
                        <!-- appel des templates déjà défini pour les balises enfant des bodys des lettres 1 et 2-->
                        <p><xsl:apply-templates select="$lettre3//body"/></p>
                    </div>
                    
                    <!-- affichage de l'image de la lettre3 -->
                <div style="margin: 2em 0 2em 0;">
                    <h2>Fac-similé</h2>
                    <embed src="lettre_3.pdf" 
                        type="application/pdf" 
                        width="100%" 
                        height="800px"/>
                </div>
                </body>
                <xsl:copy-of select="$footer"/>
                
                
            </html>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>