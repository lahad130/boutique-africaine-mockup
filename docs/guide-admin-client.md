# 📘 Guide d'administration — Boutique en ligne

**Boutique de vêtements et chaussures africains — Dakar, Sénégal**
Version 1.0 — Mai 2026

---

> Ce guide est rédigé pour vous aider à gérer votre boutique en ligne au quotidien, sans avoir besoin de connaissances techniques. Lisez chaque section étape par étape.

---

## Table des matières

1. [Connexion et tableau de bord](#1-connexion-et-tableau-de-bord)
2. [Gérer les produits](#2-gérer-les-produits)
3. [Gérer les commandes](#3-gérer-les-commandes)
4. [Gérer les livraisons](#4-gérer-les-livraisons)
5. [Marketing et promotions](#5-marketing-et-promotions)
6. [Clients](#6-clients)
7. [Avis clients](#7-avis-clients)
8. [Bonnes pratiques et conseils](#8-bonnes-pratiques-et-conseils)
9. [En cas de problème](#9-en-cas-de-problème)

---

## 1. 🔐 Connexion et tableau de bord

### Se connecter à l'administration

1. Ouvrez votre navigateur (Chrome, Firefox ou Edge).
2. Tapez l'adresse suivante dans la barre en haut : **https://votredomaine.com/wp-admin**
3. Sur la page de connexion, entrez :
   - **Identifiant** : `admin-boutique`
   - **Mot de passe** : *(votre mot de passe personnel)*
4. Cliquez sur **Se connecter**.

> 💡 **Conseil** : Enregistrez cette adresse dans vos favoris pour y accéder rapidement.

---

### Comprendre le tableau de bord WooCommerce

Une fois connecté, vous voyez le tableau de bord. Voici ce que signifie chaque chiffre :

| Zone | Ce que ça signifie |
|------|-------------------|
| **Ventes du jour** | Total des achats effectués aujourd'hui (en FCFA) |
| **Commandes à traiter** | Nombre de commandes qui attendent votre action |
| **Stock faible** | Produits dont la quantité disponible est presque épuisée |
| **Produits en rupture** | Produits complètement épuisés, plus vendables en ligne |

**Pour accéder à WooCommerce depuis le menu :**

1. Dans le menu à gauche, cherchez **WooCommerce**.
2. Cliquez dessus pour voir les commandes, les rapports et les réglages.

---

## 2. 📦 Gérer les produits

### Ajouter un nouveau produit

1. Dans le menu à gauche, cliquez sur **Produits**.
2. Cliquez sur **Ajouter un produit** (bouton en haut à gauche).
3. Remplissez les champs suivants :

**Nom du produit** (en haut de la page)
- Exemple : *Boubou brodé homme — Bleu*

**Description courte** (à droite, en bas)
- Quelques mots pour décrire le produit.
- Exemple : *Boubou en bazin riche, broderie dorée, disponible en plusieurs tailles.*

**Description longue** (grande zone de texte au centre)
- Tous les détails : matière, entretien, conseils de taille, etc.

**Prix et stock** (bloc en bas à gauche, onglet **Général**)
1. Dans le champ **Prix normal**, tapez le montant en FCFA (exemple : `25000`).
2. Ne tapez pas le symbole FCFA, seulement le chiffre.

**Catégorie** (colonne à droite)
1. Cochez la catégorie qui correspond au produit.
   - Exemples : *Boubous*, *Robes*, *Chaussures*, *Accessoires*
2. Si la catégorie n'existe pas encore, cliquez sur **Ajouter une nouvelle catégorie**.

**Photos du produit** (voir la section dédiée ci-dessous)

4. Une fois tout rempli, cliquez sur **Publier** (bouton bleu en haut à droite).

---

### Ajouter des variations (taille S/M/L, couleurs)

Les variations permettent à l'acheteur de choisir sa taille ou sa couleur.

1. Sur la page du produit, cliquez sur l'onglet **Variations** (dans le bloc en bas à gauche).
2. Avant d'ajouter des variations, allez d'abord dans l'onglet **Attributs**.
3. Dans le menu déroulant, choisissez **Taille** ou **Couleur**.
4. Tapez les valeurs séparées par une barre verticale `|` :
   - Taille : `S | M | L | XL | XXL`
   - Couleur : `Bleu | Rouge | Vert | Blanc | Noir`
5. Cochez la case **Utilisé pour les variations**.
6. Cliquez sur **Enregistrer les attributs**.
7. Retournez sur l'onglet **Variations**.
8. Dans le menu déroulant, choisissez **Créer des variations pour tous les attributs**.
9. Cliquez sur **OK**.
10. Pour chaque variation créée, vous pouvez indiquer :
    - Un **prix** différent si nécessaire
    - Une **quantité en stock** spécifique
11. Cliquez sur **Enregistrer les modifications**.

---

### Gérer le stock

1. Sur la page du produit, cliquez sur l'onglet **Inventaire** (dans le bloc en bas à gauche).
2. Cochez la case **Gérer le stock**.
3. Dans le champ **Quantité en stock**, tapez le nombre d'articles disponibles.
4. Dans **Seuil de stock faible**, tapez `3` (vous serez alerté quand il reste 3 articles ou moins).
5. Cliquez sur **Mettre à jour** (bouton en haut à droite).

> ⚠️ **Important** : Après chaque vente en boutique physique, pensez à réduire la quantité ici pour éviter de vendre en ligne un article que vous n'avez plus.

---

### Mettre un produit en promotion

1. Sur la page du produit, cliquez sur l'onglet **Général**.
2. Dans le champ **Prix promotionnel**, tapez le nouveau prix réduit.
   - Exemple : prix normal `25000`, prix promo `18000`
3. Pour limiter la promotion dans le temps, cliquez sur **Planifier** (à côté du prix promo).
4. Choisissez une **date de début** et une **date de fin**.
5. Cliquez sur **Mettre à jour**.

> 🎯 Le prix barré apparaîtra automatiquement sur votre boutique en ligne.

---

### Masquer un produit temporairement (sans le supprimer)

Si un produit est épuisé ou momentanément indisponible, ne le supprimez pas. Masquez-le.

1. Ouvrez la page du produit.
2. Dans la colonne à droite, repérez le bloc **Publier**.
3. À côté de **Visibilité**, cliquez sur **Modifier**.
4. Choisissez **Privé** ou **Brouillon**.
   - **Brouillon** : le produit n'est plus visible sur la boutique.
   - **Privé** : visible uniquement par vous quand vous êtes connecté.
5. Cliquez sur **OK** puis sur **Mettre à jour**.

> ✅ Pour remettre le produit en vente, repassez la visibilité sur **Public**.

---

### Ajouter des photos produit

**Format recommandé :**
- Type de fichier : **JPG** ou **PNG**
- Taille minimale : **800 x 800 pixels** (carré de préférence)
- Taille maximale du fichier : **2 Mo**
- Fond blanc ou neutre pour un rendu professionnel

**Pour ajouter la photo principale :**
1. Sur la page du produit, descendez jusqu'à la section **Image du produit** (colonne droite).
2. Cliquez sur **Définir l'image du produit**.
3. Cliquez sur **Téléverser des fichiers**, puis **Sélectionner des fichiers**.
4. Choisissez la photo depuis votre téléphone ou ordinateur.
5. Cliquez sur **Définir l'image du produit**.

**Pour ajouter plusieurs photos (galerie) :**
1. Descendez jusqu'à la section **Galerie du produit** (juste en dessous).
2. Cliquez sur **Ajouter des images à la galerie du produit**.
3. Ajoutez toutes les photos supplémentaires (dos, détails, etc.).
4. Cliquez sur **Mettre à jour**.

---

## 3. 🛒 Gérer les commandes

### Voir la liste des commandes

1. Dans le menu à gauche, cliquez sur **WooCommerce**.
2. Cliquez sur **Commandes**.
3. Vous voyez la liste de toutes les commandes, de la plus récente à la plus ancienne.

**Informations visibles dans la liste :**
- Numéro de commande
- Nom du client
- Date
- Montant total (en FCFA)
- Statut actuel

---

### Comprendre les statuts de commande

| Statut | Signification | Action à faire |
|--------|---------------|---------------|
| ⏳ **En attente de paiement** | Le client a commencé mais n'a pas encore payé | Attendre ou contacter le client |
| ✅ **En cours de traitement** | Le paiement est confirmé | Préparer la commande |
| 🚚 **En cours de livraison** | La commande est partie chez le client | Informer le client |
| ☑️ **Terminée** | Le client a reçu sa commande | Rien à faire |
| ❌ **Annulée** | Commande annulée | Remettre le stock si nécessaire |
| 🔄 **Remboursée** | Client remboursé | Archiver |

---

### Changer le statut d'une commande

**Méthode rapide (depuis la liste) :**
1. Trouvez la commande dans la liste.
2. Cliquez sur le statut actuel (colonne de droite).
3. Choisissez le nouveau statut dans le menu déroulant.
4. Cliquez sur la coche verte pour valider.

**Méthode détaillée (depuis la page de commande) :**
1. Cliquez sur le numéro de commande pour l'ouvrir.
2. En haut à droite, repérez le bloc **Statut de la commande**.
3. Choisissez le nouveau statut dans le menu déroulant.
4. Cliquez sur **Mettre à jour** (bouton bleu en haut à droite).

---

### Voir les détails d'une commande

1. Dans la liste, cliquez sur le numéro de commande.
2. Vous voyez toutes les informations :

**Section Facturation / Livraison :**
- Nom et prénom du client
- Numéro de téléphone
- Adresse et quartier de livraison

**Section Produits commandés :**
- Nom de chaque produit
- Taille et couleur choisies
- Quantité
- Prix unitaire

**Résumé financier :**
- Sous-total des produits
- Frais de livraison
- **Total à encaisser (en FCFA)**

**Mode de paiement :**
- Wave / Orange Money / Free Money (via PayDunya)

---

### Contacter un client depuis une commande

1. Ouvrez la commande.
2. Dans la section **Facturation**, notez le numéro de téléphone du client.
3. Vous pouvez aussi envoyer un email depuis la section **Notes de commande** :
   - En bas de la page, repérez la section **Notes de commande**.
   - Tapez votre message dans le champ texte.
   - Changez le type de note sur **Note à l'attention du client**.
   - Cliquez sur **Ajouter**.
   - Le client reçoit automatiquement cet email.

---

### Imprimer le bon de commande

1. Ouvrez la commande.
2. En haut de la page, cliquez sur **Autres actions** (menu déroulant).
3. Choisissez **Télécharger la facture PDF** ou **Imprimer**.
4. Une fenêtre d'impression s'ouvre — sélectionnez votre imprimante.

> 💡 Ce bon sert de bordereau pour votre livreur. Il contient l'adresse, les produits et le montant.

---

## 4. 🏍️ Gérer les livraisons

### Voir le quartier de livraison du client

1. Ouvrez la commande concernée.
2. Dans la section **Livraison**, vous voyez :
   - L'adresse complète
   - Le **quartier** saisi par le client
   - Le secteur / zone
3. Transmettez ces informations à votre livreur.

---

### Modifier les tarifs de livraison par zone

1. Dans le menu à gauche, cliquez sur **WooCommerce**.
2. Cliquez sur **Réglages**.
3. Cliquez sur l'onglet **Livraison**.
4. Vous voyez la liste des zones de livraison. Cliquez sur le nom d'une zone (exemple : *Dakar Centre*).
5. Cliquez sur **Modifier** à côté de la méthode de livraison (Livraison à tarif fixe).
6. Dans le champ **Coût**, tapez le nouveau tarif en FCFA (exemple : `1500`).
7. Cliquez sur **Enregistrer les modifications**.

---

### Ajouter une nouvelle zone de livraison

1. Allez dans **WooCommerce → Réglages → Livraison**.
2. Cliquez sur **Ajouter une zone de livraison**.
3. Dans **Nom de la zone**, tapez le nom du quartier ou secteur (exemple : *Pikine*, *Guédiawaye*).
4. Dans **Régions de la zone**, cherchez et sélectionnez **Sénégal** ou affinez selon vos besoins.
5. Cliquez sur **Ajouter une méthode de livraison**.
6. Choisissez **Tarif fixe** et cliquez sur **Ajouter une méthode de livraison**.
7. Cliquez sur **Modifier** à côté de la méthode ajoutée.
8. Tapez le tarif en FCFA dans le champ **Coût**.
9. Cliquez sur **Enregistrer les modifications**.

---

## 5. 📣 Marketing et promotions

### Créer un code promo

1. Dans le menu à gauche, cliquez sur **WooCommerce**.
2. Cliquez sur **Coupons**.
3. Cliquez sur **Ajouter un coupon**.
4. En haut, dans le champ **Code de coupon**, tapez le code que les clients utiliseront.
   - Exemple : `ETE2026`, `DAKAR10`, `LIVGRATUIT`
5. Dans la section **Données du coupon**, choisissez le type de remise :

| Type | Utilisation |
|------|------------|
| **Remise en pourcentage** | Exemple : 10% sur tout le panier |
| **Remise fixe sur le panier** | Exemple : 2000 FCFA de réduction |
| **Remise fixe sur le produit** | Réduction sur un produit précis |

6. Dans **Montant du coupon**, tapez la valeur (exemple : `10` pour 10%, ou `2000` pour 2000 FCFA).
7. Cliquez sur l'onglet **Restrictions d'utilisation** pour :
   - Définir un montant minimum de commande
   - Limiter à certains produits ou catégories
8. Cliquez sur l'onglet **Limites d'utilisation** pour :
   - Limiter le nombre total d'utilisations (exemple : `50` utilisations)
   - Limiter à 1 utilisation par client
9. Cliquez sur **Publier**.

> 🎉 Partagez le code avec vos clients par WhatsApp ou sur vos réseaux sociaux !

---

### Voir les abonnés newsletter (MailPoet)

1. Dans le menu à gauche, cherchez **MailPoet**.
2. Cliquez sur **Abonnés**.
3. Vous voyez la liste de tous vos abonnés avec leur email et leur date d'inscription.
4. Vous pouvez filtrer par liste (exemple : *Clients boutique*, *Newsletter générale*).

---

### Envoyer une newsletter

1. Dans **MailPoet**, cliquez sur **Emails**.
2. Cliquez sur **Créer un nouvel email**.
3. Choisissez le type :
   - **Newsletter standard** : pour envoyer à tous vos abonnés
   - **Email de bienvenue** : envoyé automatiquement aux nouveaux inscrits
4. Choisissez un modèle (template) et cliquez sur **Sélectionner**.
5. Dans l'éditeur :
   - Changez le titre et le texte principal
   - Ajoutez des images de vos nouveaux produits
   - Ajoutez un bouton avec un lien vers votre boutique
6. Cliquez sur **Suivant**.
7. Choisissez à qui envoyer l'email (liste d'abonnés).
8. Tapez l'**objet de l'email** (ce que le client voit dans sa boîte mail).
   - Exemple : *Nouvelles arrivées — Boubous et robes pour la Tabaski 🎊*
9. Cliquez sur **Envoyer** ou **Planifier** pour choisir une date et heure d'envoi.

---

## 6. 👥 Clients

### Voir la liste des clients inscrits

1. Dans le menu à gauche, cliquez sur **WooCommerce**.
2. Cliquez sur **Clients**.
3. Vous voyez tous vos clients avec leur nom, email, date d'inscription et montant total dépensé.

---

### Rechercher un client par nom ou email

1. En haut de la page **Clients**, cliquez dans la barre de recherche.
2. Tapez le nom ou l'adresse email du client.
3. Appuyez sur **Entrée** ou cliquez sur la loupe.
4. Le ou les résultats apparaissent dans la liste.

---

### Voir l'historique d'achat d'un client

1. Dans la liste des clients, cliquez sur le nom du client.
2. Vous voyez sa fiche complète :
   - Nom, email, téléphone
   - Adresse habituelle de livraison
   - **Historique des commandes** : toutes ses commandes passées avec les dates et montants
   - Total dépensé sur votre boutique
3. Cliquez sur un numéro de commande pour voir le détail.

---

## 7. ⭐ Avis clients

### Voir les avis en attente de modération

1. Dans le menu à gauche, cliquez sur **Commentaires**.
2. Les avis en attente sont marqués avec un fond jaune.
3. Cliquez sur l'onglet **En attente** pour ne voir que ceux-là.

---

### Approuver ou refuser un avis

**Pour approuver :**
1. Passez votre souris sur l'avis.
2. Cliquez sur **Approuver**.
3. L'avis devient visible sur la boutique.

**Pour refuser :**
1. Passez votre souris sur l'avis.
2. Cliquez sur **Indésirable** ou **Corbeille**.
3. L'avis est supprimé ou mis en spam — il n'apparaît pas sur la boutique.

> ✅ Approuvez les avis honnêtes, même s'ils sont critiques. Cela inspire confiance à vos futurs clients.

---

### Répondre à un avis

1. Cliquez sur l'avis pour l'ouvrir.
2. En bas de l'avis, cliquez sur **Répondre**.
3. Tapez votre réponse dans le champ texte.
4. Cliquez sur **Soumettre la réponse**.

> 💬 Exemple de réponse à un avis positif : *Merci beaucoup pour votre confiance ! Nous sommes ravis que la commande vous ait satisfait. À très bientôt !*

> 💬 Exemple de réponse à un avis négatif : *Nous sommes désolés pour ce désagrément. Veuillez nous contacter directement au [votre numéro] pour trouver une solution rapide.*

---

## 8. ✅ Bonnes pratiques et conseils

### Sauvegarder régulièrement

- Votre boutique est hébergée chez **Hostinger**, qui effectue des sauvegardes automatiques quotidiennes.
- Pour vérifier ou restaurer une sauvegarde :
  1. Connectez-vous à votre espace Hostinger sur [hpanel.hostinger.com](https://hpanel.hostinger.com).
  2. Allez dans la section **Hébergement → Sauvegardes**.
  3. En cas de problème, vous pouvez restaurer le site à une date précédente.

> 💾 Conseil : Avant toute modification importante, faites une sauvegarde manuelle depuis Hostinger.

---

### Ne jamais supprimer un produit

- Supprimer un produit efface aussi son historique dans les anciennes commandes.
- **À la place, mettez-le en Brouillon** (voir section 2 — Masquer un produit).
- Vous pouvez toujours le réactiver plus tard.

---

### Mettre à jour les stocks après chaque vente physique

- Quand vous vendez un article en boutique physique, pensez à **réduire la quantité en ligne**.
- Cela évite qu'un client commande en ligne un article que vous n'avez plus.

**Étapes rapides :**
1. Allez dans **Produits** dans le menu.
2. Trouvez le produit vendu.
3. Cliquez sur **Modification rapide** (apparaît quand vous passez la souris sur le produit).
4. Changez la quantité.
5. Cliquez sur **Mettre à jour**.

---

### Ne pas modifier les réglages techniques

Certaines zones de l'administration WordPress sont techniques et réservées au développeur. Évitez de toucher à :

- **Réglages → Lecture / Écriture / Discussion** (sauf si le développeur vous y autorise)
- **Extensions** : ne pas activer ou désactiver des extensions sans avis du développeur
- **Apparence → Éditeur de thème** : ne jamais toucher au code
- **WooCommerce → Réglages → Avancé**
- **Outils → Santé du site**

> ⚠️ En cas de doute sur une action, contactez votre développeur avant de procéder.

---

## 9. 🆘 En cas de problème

### Le site est inaccessible

**Symptôme** : Quand vous tapez l'adresse de la boutique, vous obtenez une erreur ou une page blanche.

**Que faire :**
1. Attendez 5 minutes et réessayez.
2. Essayez depuis un autre appareil ou réseau.
3. Si le problème persiste, contactez le support Hostinger :
   - **Site** : [hostinger.fr/support](https://www.hostinger.fr/support) ou [support.hostinger.com](https://support.hostinger.com)
   - **Chat en direct** : disponible 24h/24 depuis votre espace Hostinger
   - **Email** : depuis votre tableau de bord Hostinger → Support

---

### Un paiement est refusé ou non reçu

**Symptôme** : Un client dit avoir payé mais la commande reste en "En attente".

**Que faire :**
1. Connectez-vous à votre tableau de bord **PayDunya** : [app.paydunya.com](https://app.paydunya.com)
2. Vérifiez si le paiement apparaît dans la liste des transactions.
3. Vérifiez que votre compte Wave / Orange Money / Free Money est bien actif.
4. Si le paiement est bien arrivé dans PayDunya mais pas dans WooCommerce, changez manuellement le statut de la commande sur **En cours de traitement** (voir section 3).
5. Si le problème se répète, contactez le support PayDunya :
   - **Email** : [support@paydunya.com](mailto:support@paydunya.com)
   - **Site** : [paydunya.com](https://www.paydunya.com)

---

### Pour toute question technique

Pour tout problème lié au site (bug, erreur, fonctionnalité à modifier), contactez votre développeur :

- **Nom** : [À COMPLÉTER]
- **Téléphone / WhatsApp** : [À COMPLÉTER]
- **Email** : [À COMPLÉTER]
- **Disponibilité** : [À COMPLÉTER]

> 📌 Avant de contacter le développeur, notez le message d'erreur exact que vous voyez et, si possible, faites une capture d'écran. Cela l'aidera à résoudre le problème plus rapidement.

---

*Guide rédigé en mai 2026 — À conserver et à consulter en cas de besoin.*
