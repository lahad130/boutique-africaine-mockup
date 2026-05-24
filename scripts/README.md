# Script d'installation WooCommerce - Boutique Africaine Sénégal

Ce script WP-CLI automatise l'installation et la configuration complète d'une boutique WooCommerce localisée pour le Sénégal.

## Prérequis

- WordPress installé sur votre serveur Hostinger
- WP-CLI disponible sur le serveur (commande `wp`)
- Accès SSH au serveur

---

## Étapes d'utilisation

### 1. Connexion SSH au serveur

```bash
ssh utilisateur@votre-serveur-hostinger.com
```

### 2. Copier le script sur le serveur

Depuis votre machine locale :

```bash
scp scripts/setup-wordpress.sh utilisateur@votre-serveur:/home/utilisateur/public_html/
```

Ou via git (si le dépôt est cloné sur le serveur) :

```bash
git clone https://github.com/votre-repo/e-commerce.git
cd e-commerce
```

### 3. Exécuter le script depuis le dossier WordPress

```bash
# Se placer à la racine de l'installation WordPress
cd /home/utilisateur/public_html

# Lancer le script
bash setup-wordpress.sh
```

> **Note :** Le script utilise `set -e`, il s'arrête à la première erreur critique. Les commandes idempotentes (catégories, coupons, etc.) utilisent `|| true` pour ignorer les doublons.

### 4. Uploader le thème enfant

Une fois le script terminé, uploadez votre thème enfant via l'interface WordPress :

- Aller dans **wp-admin > Apparence > Thèmes**
- Cliquer sur **Ajouter > Mettre en ligne un thème**
- Sélectionner l'archive `.zip` du thème enfant
- **Activer** le thème enfant

---

## Ce que fait le script

| Section | Description |
|---------|-------------|
| A | Langue française, fuseau horaire Dakar, permaliens SEO, suppression contenu par défaut |
| B | Devise XOF (FCFA), format des prix, options boutique, checkout invité |
| C | Pages : Boutique, Panier, Commander, Mon compte, À propos, Contact, Accueil |
| D | 5 catégories produits (Vêtements Femme/Homme, Chaussures, Accessoires) |
| E | Attributs Taille (16 valeurs) et Couleur (11 valeurs) |
| F | 5 zones de livraison Dakar + livraison gratuite dès 25 000 FCFA |
| G | Compte `admin-boutique` avec rôle `shop_manager` |
| H | Coupons BIENVENUE10 (-10%) et LIVRAISONGRATUITE |
| I | 10 plugins installés : WooCommerce, Elementor, Wordfence, LiteSpeed Cache... |

---

## Après l'installation

### Changer le mot de passe admin-boutique

```bash
wp user update admin-boutique --user_pass='VOTRE_NOUVEAU_MOT_DE_PASSE_SECURISE'
```

### Vérifier la configuration WooCommerce

Aller dans **wp-admin > WooCommerce > Réglages** pour vérifier :
- Onglet **Général** : pays, devise (XOF), format des prix
- Onglet **Livraison** : zones et tarifs
- Onglet **Emails** : adresse d'expédition

---

## Dépannage

**WP-CLI introuvable**
```bash
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp
```

**Erreur de permissions**
```bash
chmod +x setup-wordpress.sh
```

**Le script s'arrête sur une erreur**

Relancer après avoir corrigé le problème : les sections déjà exécutées sont idempotentes (sans effet si relancées).
