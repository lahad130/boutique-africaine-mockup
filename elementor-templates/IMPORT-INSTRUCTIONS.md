# Comment importer un template Elementor

## Prérequis
- WordPress avec Elementor (gratuit ou Pro) installé et activé
- Être connecté à l'administration WordPress

---

## Etapes d'importation

### Etape 1 — Ouvrir la bibliothèque de templates

Ouvrez ou créez une page dans WordPress, puis cliquez sur **"Modifier avec Elementor"**.
Dans l'éditeur Elementor, cliquez sur l'icône **dossier** (bibliothèque de templates) située dans la barre d'outils inférieure, ou utilisez le bouton **"Ajouter un template"** dans la section souhaitée.

### Etape 2 — Importer le fichier JSON

Dans la fenêtre de la bibliothèque, cliquez sur l'onglet **"Mes templates"**.
Cliquez ensuite sur le bouton **"Importer des templates"** (icône de flèche vers le haut, en haut à droite).
Sélectionnez le fichier JSON souhaité parmi les trois disponibles :
- `home-page.json` — Page d'accueil avec hero, catégories, nouveautés et bannière livraison
- `about-page.json` — Page À propos avec histoire, texte et valeurs
- `contact-page.json` — Page Contact avec informations et formulaire

### Etape 3 — Insérer le template dans la page

Une fois le fichier importé, il apparaît dans l'onglet **"Mes templates"**.
Survolez le template souhaité et cliquez sur **"Insérer"**.
Le template est ajouté à votre page. Vous pouvez ensuite personnaliser les textes, images et liens selon vos besoins.

---

## Notes importantes

- Les **polices Google** (Playfair Display et Inter) sont chargées automatiquement par Elementor.
- Le widget **Nouveautés** sur la page d'accueil nécessite **WooCommerce** activé pour afficher les produits récents.
- Le **formulaire de contact** nécessite le plugin **Contact Form 7** installé et un formulaire créé avec l'ID `contact-form`.
- Les **images placeholder** dans la page À propos sont à remplacer par vos propres photos via la médiathèque WordPress.
- Les liens de catégories (`/categorie-produit/...`) correspondent aux slugs WooCommerce par défaut — à adapter si vous avez des slugs différents.
