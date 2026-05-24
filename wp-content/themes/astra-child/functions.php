<?php
/**
 * Astra Child — Boutique Africaine
 * Fonctions du thème enfant
 *
 * @package AstraChild
 * @version 1.0.0
 */

defined( 'ABSPATH' ) || exit;

/* =============================================================================
   1. ENQUEUE STYLES : PARENT ASTRA + ENFANT
   ============================================================================= */

/**
 * Charge la feuille de style du thème parent Astra,
 * puis celle du thème enfant.
 */
function astra_child_enqueue_styles() {

    // Style parent Astra
    wp_enqueue_style(
        'astra-theme-css',
        get_template_directory_uri() . '/style.css',
        array(),
        wp_get_theme( 'astra' )->get( 'Version' )
    );

    // Style thème enfant (dépend du parent)
    wp_enqueue_style(
        'astra-child-css',
        get_stylesheet_uri(),
        array( 'astra-theme-css' ),
        wp_get_theme()->get( 'Version' )
    );
}
add_action( 'wp_enqueue_scripts', 'astra_child_enqueue_styles' );


/* =============================================================================
   2. WOOCOMMERCE — PRIX FCFA SANS DÉCIMALES
   ============================================================================= */

/**
 * Supprime les décimales inutiles sur les prix WooCommerce.
 * En FCFA, on affiche "5 000 FCFA" et non "5 000,00 FCFA".
 */
add_filter( 'woocommerce_price_trim_zeros', '__return_true' );


/* =============================================================================
   3. CHAMP "QUARTIER" AU CHECKOUT (LIVRAISON DAKAR)
   ============================================================================= */

/**
 * Ajoute un champ "Quartier" dans les champs de facturation du checkout.
 * Priorité 35 — placé après le prénom/nom (30) et avant l'email (110).
 *
 * @param array $fields Champs de facturation existants.
 * @return array Champs mis à jour.
 */
function astra_child_add_quartier_checkout_field( $fields ) {

    $fields['billing']['billing_quartier'] = array(
        'type'        => 'text',
        'label'       => __( 'Quartier', 'astra-child' ),
        'placeholder' => __( 'Ex : Plateau, Medina, Almadies…', 'astra-child' ),
        'required'    => true,
        'class'       => array( 'form-row-wide' ),
        'priority'    => 35,
        'autocomplete' => 'address-line3',
    );

    return $fields;
}
add_filter( 'woocommerce_checkout_fields', 'astra_child_add_quartier_checkout_field' );


/* =============================================================================
   4. SAUVEGARDE DU QUARTIER EN META COMMANDE
   ============================================================================= */

/**
 * Enregistre la valeur du champ "Quartier" dans les méta-données de la commande.
 * Utilise sanitize_text_field() pour sécuriser la donnée avant persistance.
 *
 * @param int $order_id Identifiant de la commande.
 */
function astra_child_save_quartier_order_meta( $order_id ) {

    if ( ! isset( $_POST['billing_quartier'] ) || '' === $_POST['billing_quartier'] ) {
        return;
    }

    $quartier = sanitize_text_field( wp_unslash( $_POST['billing_quartier'] ) );

    // Compatibilité WooCommerce HPOS (High-Performance Order Storage) + legacy
    $order = wc_get_order( $order_id );
    if ( $order instanceof WC_Order ) {
        $order->update_meta_data( '_shipping_quartier', $quartier );
        $order->save();
    } else {
        // Fallback pour anciennes versions WC
        update_post_meta( $order_id, '_shipping_quartier', $quartier );
    }
}
add_action( 'woocommerce_checkout_update_order_meta', 'astra_child_save_quartier_order_meta' );


/* =============================================================================
   5. AFFICHAGE DU QUARTIER DANS LE DÉTAIL COMMANDE (ADMIN)
   ============================================================================= */

/**
 * Affiche le champ "Quartier" dans la section facturation
 * de la page de détail d'une commande dans l'administration WordPress.
 *
 * @param WC_Order $order Objet commande WooCommerce.
 */
function astra_child_display_quartier_in_admin_order( $order ) {

    // Récupère la meta (compatible HPOS + legacy)
    if ( $order instanceof WC_Order ) {
        $quartier = $order->get_meta( '_shipping_quartier', true );
    } else {
        $quartier = get_post_meta( $order->get_id(), '_shipping_quartier', true );
    }

    if ( empty( $quartier ) ) {
        return;
    }

    echo '<p><strong>' . esc_html__( 'Quartier (livraison)', 'astra-child' ) . ' :</strong> '
        . esc_html( $quartier ) . '</p>';
}
add_action( 'woocommerce_admin_order_data_after_billing_address', 'astra_child_display_quartier_in_admin_order', 10, 1 );


/* =============================================================================
   6. AFFICHAGE DU QUARTIER DANS LES EMAILS DE COMMANDE
   ============================================================================= */

/**
 * Ajoute le quartier dans les emails de confirmation de commande (client + admin).
 *
 * @param WC_Order $order         Objet commande.
 * @param bool     $sent_to_admin Envoyé à l'admin ?
 * @param bool     $plain_text    Format texte brut ?
 */
function astra_child_display_quartier_in_emails( $order, $sent_to_admin, $plain_text ) {

    if ( $order instanceof WC_Order ) {
        $quartier = $order->get_meta( '_shipping_quartier', true );
    } else {
        $quartier = get_post_meta( $order->get_id(), '_shipping_quartier', true );
    }

    if ( empty( $quartier ) ) {
        return;
    }

    if ( $plain_text ) {
        echo "\n" . esc_html__( 'Quartier (livraison)', 'astra-child' ) . ' : ' . esc_html( $quartier ) . "\n";
    } else {
        echo '<p><strong>' . esc_html__( 'Quartier (livraison)', 'astra-child' ) . ' :</strong> '
            . esc_html( $quartier ) . '</p>';
    }
}
add_action( 'woocommerce_email_after_order_table', 'astra_child_display_quartier_in_emails', 10, 3 );


/* =============================================================================
   7. VALIDATION DU CHAMP QUARTIER AU CHECKOUT
   ============================================================================= */

/**
 * Valide que le champ "Quartier" est bien rempli avant de traiter la commande.
 * WooCommerce affiche une erreur si le champ est vide.
 */
function astra_child_validate_quartier_checkout_field() {

    if ( isset( $_POST['billing_quartier'] ) && '' === trim( $_POST['billing_quartier'] ) ) {
        wc_add_notice(
            __( 'Veuillez indiquer votre quartier pour la livraison.', 'astra-child' ),
            'error'
        );
    }
}
add_action( 'woocommerce_checkout_process', 'astra_child_validate_quartier_checkout_field' );


/* =============================================================================
   8. SUPPORT THÈME ENFANT
   ============================================================================= */

/**
 * Déclare les fonctionnalités supportées par le thème enfant.
 * Hérite des supports du thème parent Astra.
 */
function astra_child_setup() {

    // Charge les traductions du thème enfant
    load_child_theme_textdomain( 'astra-child', get_stylesheet_directory() . '/languages' );
}
add_action( 'after_setup_theme', 'astra_child_setup' );
