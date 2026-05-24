# Checklist de Tests Fonctionnels — Boutique Vêtements & Chaussures Africains

> Valider chaque point avant la livraison au client. Cocher chaque case une fois le test passé avec succès.

---

### 1. Tests visuels

- [ ] Page d'accueil s'affiche correctement sur mobile (375px)
- [ ] Page d'accueil s'affiche correctement sur desktop (1280px)
- [ ] Couleurs ocre #C8842A et vert #2D6A4F visibles
- [ ] Police Playfair Display chargée sur les titres
- [ ] Footer fond sombre visible
- [ ] Logo visible dans le header
- [ ] Menu hamburger fonctionnel sur mobile

---

### 2. Tests catalogue

- [ ] Page boutique `/boutique/` accessible
- [ ] 5 catégories visibles dans le menu
- [ ] Filtre par catégorie fonctionne
- [ ] Prix affichés en FCFA sans décimales (ex: 18 500 FCFA)
- [ ] Images produits s'affichent
- [ ] Bouton "Ajouter au panier" visible sur les cartes

---

### 3. Tests produit

- [ ] Page produit accessible
- [ ] Sélecteur de taille fonctionnel
- [ ] Sélecteur de couleur fonctionnel
- [ ] Avis clients visible sous la description
- [ ] Bouton "Ajouter à la liste de souhaits" visible

---

### 4. Tests panier et commande

- [ ] Produit s'ajoute au panier
- [ ] Panier affiche le bon total en FCFA
- [ ] Code promo BIENVENUE10 applique -10%
- [ ] Champ "Quartier" visible sur la page commande
- [ ] Zone de livraison sélectionnable avec tarif
- [ ] Méthode de paiement PayDunya visible
- [ ] Redirection vers PayDunya fonctionne (mode test)
- [ ] Email de confirmation reçu après commande

---

### 5. Tests compte client

- [ ] Inscription fonctionne sur `/mon-compte/`
- [ ] Email de bienvenue reçu
- [ ] Connexion fonctionne
- [ ] Historique de commandes visible

---

### 6. Tests admin

- [ ] Connexion admin-boutique fonctionne
- [ ] Tableau de bord WooCommerce visible avec stats
- [ ] Ajout d'un produit réussi
- [ ] Changement de statut commande envoie email
- [ ] Accès aux réglages WordPress avancés bloqué

---

### 7. Tests performance

- [ ] PageSpeed mobile ≥ 70 (tester sur pagespeed.web.dev)
- [ ] SSL actif (HTTPS dans la barre d'adresse)
- [ ] Score SSL A ou A+ sur ssllabs.com
- [ ] Pas d'erreurs dans la console navigateur

---

### 8. Tests newsletter

- [ ] Formulaire newsletter visible
- [ ] Inscription newsletter fonctionne
- [ ] Abonné apparaît dans MailPoet
