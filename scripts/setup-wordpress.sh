#!/bin/bash
# ============================================
# SCRIPT D'INSTALLATION BOUTIQUE AFRICAINE
# Usage : bash setup-wordpress.sh
# Prérequis : WP-CLI installé, WordPress déjà installé
# ============================================

set -e  # Arrêt sur erreur

echo "🚀 Démarrage de la configuration de la boutique WooCommerce..."
echo "============================================"

# ============================================
# A. CONFIGURATION WORDPRESS DE BASE
# ============================================
echo "⚙️ Configuration WordPress de base..."

# Langue française
wp language core install fr_FR --activate --quiet

# Fuseau horaire Dakar
wp option update timezone_string "Africa/Dakar" --quiet
wp option update date_format "j F Y" --quiet
wp option update time_format "H:i" --quiet

# Permaliens optimisés pour le SEO
wp rewrite structure '/%postname%/' --hard --quiet
wp rewrite flush --hard --quiet

# Supprimer le contenu par défaut de WordPress
wp post delete 1 --force --quiet 2>/dev/null || true  # Hello World (ignorer si déjà supprimé)
wp post delete 2 --force --quiet 2>/dev/null || true  # Sample Page (ignorer si déjà supprimé)
wp comment delete 1 --force --quiet 2>/dev/null || true  # Commentaire par défaut (ignorer si déjà supprimé)

echo "  ✓ Configuration WordPress de base terminée"

# ============================================
# B. WOOCOMMERCE - DEVISE ET RÉGLAGES GÉNÉRAUX
# ============================================
echo "⚙️ Configuration WooCommerce (devise et réglages généraux)..."

# Localisation et devise
wp option update woocommerce_default_country "SN" --quiet
wp option update woocommerce_currency "XOF" --quiet
wp option update woocommerce_currency_pos "right_space" --quiet

# Format des prix pour le FCFA
wp option update woocommerce_price_thousand_sep " " --quiet
wp option update woocommerce_price_decimal_sep "," --quiet
wp option update woocommerce_price_num_decimals "0" --quiet

# Options de la boutique
wp option update woocommerce_enable_reviews "yes" --quiet
wp option update woocommerce_enable_guest_checkout "yes" --quiet
wp option update woocommerce_enable_signup_and_login_from_checkout "yes" --quiet
wp option update woocommerce_enable_myaccount_registration "yes" --quiet
wp option update woocommerce_ship_to_countries "specific" --quiet

# Activer les emails WooCommerce principaux
wp option update woocommerce_email_from_name "Boutique Africaine" --quiet
wp option update woocommerce_email_from_address "noreply@votredomaine.com" --quiet

echo "  ✓ Configuration WooCommerce terminée"

# ============================================
# C. PAGES WOOCOMMERCE
# ============================================
echo "⚙️ Configuration des pages WooCommerce..."

# Créer les pages si elles n'existent pas
# Boutique
SHOP_PAGE_ID=$(wp post list --post_type=page --post_status=publish --name=boutique --field=ID --format=csv 2>/dev/null | head -1)
if [ -z "$SHOP_PAGE_ID" ]; then
  SHOP_PAGE_ID=$(wp post create --post_type=page --post_title='Boutique' --post_status=publish --post_name=boutique --porcelain --quiet)
  echo "  ✓ Page 'Boutique' créée (ID: $SHOP_PAGE_ID)"
else
  echo "  - Page 'Boutique' existe déjà (ID: $SHOP_PAGE_ID)"
fi
wp option update woocommerce_shop_page_id "$SHOP_PAGE_ID" --quiet

# Panier
CART_PAGE_ID=$(wp post list --post_type=page --post_status=publish --name=panier --field=ID --format=csv 2>/dev/null | head -1)
if [ -z "$CART_PAGE_ID" ]; then
  CART_PAGE_ID=$(wp post create --post_type=page --post_title='Panier' --post_status=publish --post_name=panier --porcelain --quiet)
  echo "  ✓ Page 'Panier' créée (ID: $CART_PAGE_ID)"
else
  echo "  - Page 'Panier' existe déjà (ID: $CART_PAGE_ID)"
fi
wp option update woocommerce_cart_page_id "$CART_PAGE_ID" --quiet

# Commander
CHECKOUT_PAGE_ID=$(wp post list --post_type=page --post_status=publish --name=commander --field=ID --format=csv 2>/dev/null | head -1)
if [ -z "$CHECKOUT_PAGE_ID" ]; then
  CHECKOUT_PAGE_ID=$(wp post create --post_type=page --post_title='Commander' --post_status=publish --post_name=commander --porcelain --quiet)
  echo "  ✓ Page 'Commander' créée (ID: $CHECKOUT_PAGE_ID)"
else
  echo "  - Page 'Commander' existe déjà (ID: $CHECKOUT_PAGE_ID)"
fi
wp option update woocommerce_checkout_page_id "$CHECKOUT_PAGE_ID" --quiet

# Mon compte
MYACCOUNT_PAGE_ID=$(wp post list --post_type=page --post_status=publish --name=mon-compte --field=ID --format=csv 2>/dev/null | head -1)
if [ -z "$MYACCOUNT_PAGE_ID" ]; then
  MYACCOUNT_PAGE_ID=$(wp post create --post_type=page --post_title='Mon compte' --post_status=publish --post_name=mon-compte --porcelain --quiet)
  echo "  ✓ Page 'Mon compte' créée (ID: $MYACCOUNT_PAGE_ID)"
else
  echo "  - Page 'Mon compte' existe déjà (ID: $MYACCOUNT_PAGE_ID)"
fi
wp option update woocommerce_myaccount_page_id "$MYACCOUNT_PAGE_ID" --quiet

# À propos
ABOUT_PAGE_ID=$(wp post list --post_type=page --post_status=publish --name=a-propos --field=ID --format=csv 2>/dev/null | head -1)
if [ -z "$ABOUT_PAGE_ID" ]; then
  ABOUT_PAGE_ID=$(wp post create --post_type=page --post_title='À propos' --post_status=publish --post_name=a-propos --porcelain --quiet)
  echo "  ✓ Page 'À propos' créée (ID: $ABOUT_PAGE_ID)"
else
  echo "  - Page 'À propos' existe déjà (ID: $ABOUT_PAGE_ID)"
fi

# Contact
CONTACT_PAGE_ID=$(wp post list --post_type=page --post_status=publish --name=contact --field=ID --format=csv 2>/dev/null | head -1)
if [ -z "$CONTACT_PAGE_ID" ]; then
  CONTACT_PAGE_ID=$(wp post create --post_type=page --post_title='Contact' --post_status=publish --post_name=contact --porcelain --quiet)
  echo "  ✓ Page 'Contact' créée (ID: $CONTACT_PAGE_ID)"
else
  echo "  - Page 'Contact' existe déjà (ID: $CONTACT_PAGE_ID)"
fi

# Accueil
HOME_PAGE_ID=$(wp post list --post_type=page --post_status=publish --name=accueil --field=ID --format=csv 2>/dev/null | head -1)
if [ -z "$HOME_PAGE_ID" ]; then
  HOME_PAGE_ID=$(wp post create --post_type=page --post_title='Accueil' --post_status=publish --post_name=accueil --porcelain --quiet)
  echo "  ✓ Page 'Accueil' créée (ID: $HOME_PAGE_ID)"
else
  echo "  - Page 'Accueil' existe déjà (ID: $HOME_PAGE_ID)"
fi

# Définir la page d'accueil statique
wp option update show_on_front "page" --quiet
wp option update page_on_front "$HOME_PAGE_ID" --quiet
wp option update page_for_posts "0" --quiet

echo "  ✓ Pages WooCommerce configurées"

# ============================================
# D. CATÉGORIES PRODUITS WOOCOMMERCE
# ============================================
echo "⚙️ Configuration des catégories produits..."

# Créer les catégories (ignorer si déjà existantes)
wp term create product_cat "Vêtements Femme" \
  --description="Robes, boubous, ensembles wax" \
  --slug=vetements-femme --quiet 2>/dev/null || true  # Ignorer si déjà existant

wp term create product_cat "Vêtements Homme" \
  --description="Boubous, chemises africaines" \
  --slug=vetements-homme --quiet 2>/dev/null || true  # Ignorer si déjà existant

wp term create product_cat "Chaussures Femme" \
  --description="Sandales, ballerines africaines" \
  --slug=chaussures-femme --quiet 2>/dev/null || true  # Ignorer si déjà existant

wp term create product_cat "Chaussures Homme" \
  --description="Sandales, mocassins africains" \
  --slug=chaussures-homme --quiet 2>/dev/null || true  # Ignorer si déjà existant

wp term create product_cat "Accessoires" \
  --description="Sacs, bijoux, ceintures africains" \
  --slug=accessoires --quiet 2>/dev/null || true  # Ignorer si déjà existant

echo "  ✓ Catégories produits créées"

# ============================================
# E. ATTRIBUTS PRODUITS (TAILLE + COULEUR)
# ============================================
echo "⚙️ Configuration des attributs produits..."

# Créer l'attribut Taille
wp wc product_attribute create \
  --name="Taille" \
  --slug="taille" \
  --type="select" \
  --order_by="menu_order" \
  --has_archives=true \
  --user=1 --quiet 2>/dev/null || true  # Ignorer si déjà existant

# Récupérer l'ID de l'attribut Taille
TAILLE_ATTR_ID=$(wp wc product_attribute list --user=1 --field=id --format=csv 2>/dev/null | head -1)
TAILLE_ATTR_ID=$(wp wc product_attribute list --user=1 --format=json 2>/dev/null | python3 -c "import sys,json; attrs=json.load(sys.stdin); [print(a['id']) for a in attrs if a['slug']=='taille']" 2>/dev/null || echo "")

# Créer les termes de l'attribut Taille
for TAILLE in "XS" "S" "M" "L" "XL" "XXL" "36" "37" "38" "39" "40" "41" "42" "43" "44" "Unique"; do
  wp term create pa_taille "$TAILLE" --slug="$(echo $TAILLE | tr '[:upper:]' '[:lower:]')" --quiet 2>/dev/null || true  # Ignorer si déjà existant
done

# Créer l'attribut Couleur
wp wc product_attribute create \
  --name="Couleur" \
  --slug="couleur" \
  --type="select" \
  --order_by="menu_order" \
  --has_archives=true \
  --user=1 --quiet 2>/dev/null || true  # Ignorer si déjà existant

# Créer les termes de l'attribut Couleur
for COULEUR in "Bleu" "Rouge" "Vert" "Jaune" "Orange" "Blanc" "Noir" "Multicolore" "Wax classique" "Wax bordeaux" "Indigo"; do
  COULEUR_SLUG=$(echo "$COULEUR" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | iconv -f utf-8 -t ascii//TRANSLIT 2>/dev/null || echo "$COULEUR" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
  wp term create pa_couleur "$COULEUR" --slug="$COULEUR_SLUG" --quiet 2>/dev/null || true  # Ignorer si déjà existant
done

echo "  ✓ Attributs produits configurés"

# ============================================
# F. ZONES DE LIVRAISON DAKAR
# ============================================
echo "⚙️ Configuration des zones de livraison..."

# Zone 1 : Centre Dakar - 1000 FCFA
ZONE1_ID=$(wp wc shipping_zone create \
  --name="Centre Dakar" \
  --order=1 \
  --user=1 --porcelain --quiet 2>/dev/null)

if [ -n "$ZONE1_ID" ]; then
  # Ajouter la région Sénégal à la zone
  wp wc shipping_zone_location create "$ZONE1_ID" \
    --code="SN" \
    --type="country" \
    --user=1 --quiet 2>/dev/null || true

  # Méthode tarif fixe : 1000 FCFA
  ZONE1_METHOD_ID=$(wp wc shipping_zone_method create "$ZONE1_ID" \
    --method_id="flat_rate" \
    --user=1 --porcelain --quiet 2>/dev/null)
  wp wc shipping_zone_method update "$ZONE1_ID" "$ZONE1_METHOD_ID" \
    --settings='{"title":{"value":"Livraison Centre Dakar"},"cost":{"value":"1000"}}' \
    --user=1 --quiet 2>/dev/null || true

  # Méthode livraison gratuite à partir de 25000 FCFA
  ZONE1_FREE_ID=$(wp wc shipping_zone_method create "$ZONE1_ID" \
    --method_id="free_shipping" \
    --user=1 --porcelain --quiet 2>/dev/null)
  wp wc shipping_zone_method update "$ZONE1_ID" "$ZONE1_FREE_ID" \
    --settings='{"title":{"value":"Livraison gratuite (dès 25 000 FCFA)"},"requires":{"value":"min_amount"},"min_amount":{"value":"25000"}}' \
    --user=1 --quiet 2>/dev/null || true

  echo "  ✓ Zone 'Centre Dakar' créée"
fi

# Zone 2 : Banlieue Proche (Ouakam, Almadies) - 1500 FCFA
ZONE2_ID=$(wp wc shipping_zone create \
  --name="Banlieue Proche (Ouakam, Almadies)" \
  --order=2 \
  --user=1 --porcelain --quiet 2>/dev/null)

if [ -n "$ZONE2_ID" ]; then
  ZONE2_METHOD_ID=$(wp wc shipping_zone_method create "$ZONE2_ID" \
    --method_id="flat_rate" \
    --user=1 --porcelain --quiet 2>/dev/null)
  wp wc shipping_zone_method update "$ZONE2_ID" "$ZONE2_METHOD_ID" \
    --settings='{"title":{"value":"Livraison Banlieue Proche"},"cost":{"value":"1500"}}' \
    --user=1 --quiet 2>/dev/null || true

  ZONE2_FREE_ID=$(wp wc shipping_zone_method create "$ZONE2_ID" \
    --method_id="free_shipping" \
    --user=1 --porcelain --quiet 2>/dev/null)
  wp wc shipping_zone_method update "$ZONE2_ID" "$ZONE2_FREE_ID" \
    --settings='{"title":{"value":"Livraison gratuite (dès 25 000 FCFA)"},"requires":{"value":"min_amount"},"min_amount":{"value":"25000"}}' \
    --user=1 --quiet 2>/dev/null || true

  echo "  ✓ Zone 'Banlieue Proche' créée"
fi

# Zone 3 : Pikine / Guédiawaye - 2000 FCFA
ZONE3_ID=$(wp wc shipping_zone create \
  --name="Pikine / Guédiawaye" \
  --order=3 \
  --user=1 --porcelain --quiet 2>/dev/null)

if [ -n "$ZONE3_ID" ]; then
  ZONE3_METHOD_ID=$(wp wc shipping_zone_method create "$ZONE3_ID" \
    --method_id="flat_rate" \
    --user=1 --porcelain --quiet 2>/dev/null)
  wp wc shipping_zone_method update "$ZONE3_ID" "$ZONE3_METHOD_ID" \
    --settings='{"title":{"value":"Livraison Pikine / Guédiawaye"},"cost":{"value":"2000"}}' \
    --user=1 --quiet 2>/dev/null || true

  ZONE3_FREE_ID=$(wp wc shipping_zone_method create "$ZONE3_ID" \
    --method_id="free_shipping" \
    --user=1 --porcelain --quiet 2>/dev/null)
  wp wc shipping_zone_method update "$ZONE3_ID" "$ZONE3_FREE_ID" \
    --settings='{"title":{"value":"Livraison gratuite (dès 25 000 FCFA)"},"requires":{"value":"min_amount"},"min_amount":{"value":"25000"}}' \
    --user=1 --quiet 2>/dev/null || true

  echo "  ✓ Zone 'Pikine / Guédiawaye' créée"
fi

# Zone 4 : Rufisque - 2500 FCFA
ZONE4_ID=$(wp wc shipping_zone create \
  --name="Rufisque" \
  --order=4 \
  --user=1 --porcelain --quiet 2>/dev/null)

if [ -n "$ZONE4_ID" ]; then
  ZONE4_METHOD_ID=$(wp wc shipping_zone_method create "$ZONE4_ID" \
    --method_id="flat_rate" \
    --user=1 --porcelain --quiet 2>/dev/null)
  wp wc shipping_zone_method update "$ZONE4_ID" "$ZONE4_METHOD_ID" \
    --settings='{"title":{"value":"Livraison Rufisque"},"cost":{"value":"2500"}}' \
    --user=1 --quiet 2>/dev/null || true

  ZONE4_FREE_ID=$(wp wc shipping_zone_method create "$ZONE4_ID" \
    --method_id="free_shipping" \
    --user=1 --porcelain --quiet 2>/dev/null)
  wp wc shipping_zone_method update "$ZONE4_ID" "$ZONE4_FREE_ID" \
    --settings='{"title":{"value":"Livraison gratuite (dès 25 000 FCFA)"},"requires":{"value":"min_amount"},"min_amount":{"value":"25000"}}' \
    --user=1 --quiet 2>/dev/null || true

  echo "  ✓ Zone 'Rufisque' créée"
fi

# Zone 5 : Thiès / Mbour - 3500 FCFA
ZONE5_ID=$(wp wc shipping_zone create \
  --name="Thiès / Mbour" \
  --order=5 \
  --user=1 --porcelain --quiet 2>/dev/null)

if [ -n "$ZONE5_ID" ]; then
  ZONE5_METHOD_ID=$(wp wc shipping_zone_method create "$ZONE5_ID" \
    --method_id="flat_rate" \
    --user=1 --porcelain --quiet 2>/dev/null)
  wp wc shipping_zone_method update "$ZONE5_ID" "$ZONE5_METHOD_ID" \
    --settings='{"title":{"value":"Livraison Thiès / Mbour"},"cost":{"value":"3500"}}' \
    --user=1 --quiet 2>/dev/null || true

  ZONE5_FREE_ID=$(wp wc shipping_zone_method create "$ZONE5_ID" \
    --method_id="free_shipping" \
    --user=1 --porcelain --quiet 2>/dev/null)
  wp wc shipping_zone_method update "$ZONE5_ID" "$ZONE5_FREE_ID" \
    --settings='{"title":{"value":"Livraison gratuite (dès 25 000 FCFA)"},"requires":{"value":"min_amount"},"min_amount":{"value":"25000"}}' \
    --user=1 --quiet 2>/dev/null || true

  echo "  ✓ Zone 'Thiès / Mbour' créée"
fi

echo "  ✓ Zones de livraison configurées"

# ============================================
# G. COMPTE UTILISATEUR ADMIN CLIENT
# ============================================
echo "⚙️ Création du compte administrateur boutique..."

# Créer le compte admin-boutique (ignorer si déjà existant)
wp user create admin-boutique admin@votredomaine.com \
  --role=shop_manager \
  --display_name="Admin Boutique" \
  --user_pass="CHANGER_CE_MOT_DE_PASSE" --quiet 2>/dev/null || true  # Ignorer si déjà existant

echo "  ✓ Compte 'admin-boutique' créé (ou déjà existant)"

# ============================================
# H. COUPONS PROMOTIONNELS
# ============================================
echo "⚙️ Création des coupons promotionnels..."

# Coupon de bienvenue : 10% de réduction (usage unique par client)
wp wc shop_coupon create --user=1 \
  --code="BIENVENUE10" \
  --discount_type="percent" \
  --amount="10" \
  --usage_limit_per_user=1 \
  --quiet 2>/dev/null || true  # Ignorer si déjà existant

# Coupon livraison gratuite à partir de 15000 FCFA
wp wc shop_coupon create --user=1 \
  --code="LIVRAISONGRATUITE" \
  --discount_type="percent" \
  --amount="0" \
  --free_shipping=true \
  --minimum_amount="15000" \
  --quiet 2>/dev/null || true  # Ignorer si déjà existant

echo "  ✓ Coupons promotionnels créés"

# ============================================
# I. INSTALLATION ET ACTIVATION DES PLUGINS
# ============================================
echo "⚙️ Installation et activation des plugins..."

# Plugin e-commerce principal
wp plugin install woocommerce --activate --quiet
echo "  ✓ WooCommerce installé et activé"

# Thème Astra (haute compatibilité WooCommerce)
wp theme install astra --activate --quiet
echo "  ✓ Thème Astra installé et activé"

# Constructeur de pages
wp plugin install elementor --activate --quiet
echo "  ✓ Elementor installé et activé"

# Avis clients
wp plugin install customer-reviews-woocommerce --activate --quiet
echo "  ✓ Customer Reviews WooCommerce installé et activé"

# Liste de souhaits
wp plugin install yith-woocommerce-wishlist --activate --quiet
echo "  ✓ YITH WooCommerce Wishlist installé et activé"

# Email marketing
wp plugin install mailpoet --activate --quiet
echo "  ✓ MailPoet installé et activé"

# Sécurité
wp plugin install wordfence --activate --quiet
echo "  ✓ Wordfence installé et activé"

# Optimisation des images
wp plugin install smush --activate --quiet
echo "  ✓ Smush installé et activé"

# Cache et performance (compatible Hostinger LiteSpeed)
wp plugin install litespeed-cache --activate --quiet
echo "  ✓ LiteSpeed Cache installé et activé"

# Gestion du menu admin
wp plugin install admin-menu-editor --activate --quiet
echo "  ✓ Admin Menu Editor installé et activé"

echo "  ✓ Tous les plugins installés et activés"

# ============================================
# FINALISATION
# ============================================
echo ""
echo "============================================"
echo "✅ Configuration terminée !"
echo "============================================"
echo ""
echo "📋 Résumé de la configuration :"
echo "  - Langue : Français (fr_FR)"
echo "  - Fuseau horaire : Africa/Dakar"
echo "  - Devise : XOF (FCFA)"
echo "  - Pays : Sénégal (SN)"
echo "  - Pages créées : Boutique, Panier, Commander, Mon compte, À propos, Contact, Accueil"
echo "  - Catégories : Vêtements Femme, Vêtements Homme, Chaussures Femme, Chaussures Homme, Accessoires"
echo "  - Attributs : Taille (16 valeurs), Couleur (11 valeurs)"
echo "  - Zones de livraison : 5 zones Dakar + Thiès/Mbour"
echo "  - Coupons : BIENVENUE10 (-10%), LIVRAISONGRATUITE"
echo "  - Plugins : 10 plugins installés et activés"
echo ""
echo "🔐 IMPORTANT : N'oubliez pas de changer le mot de passe admin-boutique !"
echo "   wp user update admin-boutique --user_pass='VOTRE_NOUVEAU_MOT_DE_PASSE'"
echo ""
echo "📦 Prochaine étape : Uploader votre thème enfant via wp-admin > Apparence > Thèmes"
echo "============================================"
