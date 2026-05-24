<?php
/**
 * Email Header — Astra Child Boutique Africaine
 *
 * En-tête personnalisé pour les emails WooCommerce.
 * Fond sombre (#1A1A1A), logo/nom boutique en ocre (#C8842A),
 * typographie Playfair Display chargée depuis Google Fonts.
 *
 * Ce fichier surcharge : woocommerce/templates/emails/email-header.php
 *
 * @see     https://woocommerce.com/document/template-structure/
 * @package WooCommerce\Templates\Emails
 * @version 4.0.0
 */

defined( 'ABSPATH' ) || exit;

// Récupère le nom de la boutique WooCommerce
$shop_name = get_bloginfo( 'name' );
$shop_url  = home_url( '/' );

?><!DOCTYPE html>
<html <?php language_attributes(); ?> dir="<?php echo is_rtl() ? 'rtl' : 'ltr'; ?>">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=<?php bloginfo( 'charset' ); ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?php echo esc_html( $email_heading ); ?></title>
    <!--[if !mso]><!-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600;700&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <!--<![endif]-->
    <style type="text/css">
        /* ===== RESET EMAIL ===== */
        #outlook a { padding: 0; }
        body {
            margin: 0 !important;
            padding: 0 !important;
            -webkit-text-size-adjust: 100%;
            -ms-text-size-adjust: 100%;
            background-color: #F5F5F3;
            width: 100% !important;
        }
        table, td {
            mso-table-lspace: 0pt !important;
            mso-table-rspace: 0pt !important;
        }
        img {
            -ms-interpolation-mode: bicubic;
            border: 0;
            height: auto;
            line-height: 100%;
            outline: none;
            text-decoration: none;
        }
        /* ===== CONTENEUR PRINCIPAL ===== */
        .email-wrapper {
            background-color: #F5F5F3;
            padding: 24px 0;
        }
        .email-container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #ffffff;
            border-radius: 0 0 8px 8px;
            overflow: hidden;
        }

        /* ===== HEADER ===== */
        .email-header {
            background-color: #1A1A1A;
            padding: 0;
            text-align: center;
        }
        .email-header-inner {
            padding: 36px 40px 32px;
        }
        .email-header-logo-link {
            text-decoration: none;
            display: inline-block;
        }
        .email-header-shop-name {
            font-family: 'Playfair Display', Georgia, 'Times New Roman', serif;
            font-size: 28px;
            font-weight: 700;
            color: #C8842A !important;
            letter-spacing: -0.02em;
            line-height: 1.2;
            margin: 0;
            padding: 0;
            display: block;
        }
        .email-header-tagline {
            font-family: 'Inter', Arial, Helvetica, sans-serif;
            font-size: 12px;
            font-weight: 500;
            color: #6B6460;
            text-transform: uppercase;
            letter-spacing: 0.15em;
            margin: 8px 0 0;
            padding: 0;
            display: block;
        }
        .email-header-divider {
            display: block;
            height: 3px;
            background: linear-gradient(90deg, transparent 0%, #C8842A 20%, #C8842A 80%, transparent 100%);
            margin: 0;
        }
        /* Motif géométrique wax sous le header */
        .email-header-pattern {
            background-color: #111111;
            height: 8px;
            background-image: repeating-linear-gradient(
                45deg,
                transparent,
                transparent 4px,
                rgba(200,132,42,0.3) 4px,
                rgba(200,132,42,0.3) 8px
            );
        }

        /* ===== CONTENU ===== */
        .email-body {
            padding: 40px;
            background-color: #ffffff;
        }
        .email-body h1,
        .email-body h2,
        .email-body h3 {
            font-family: 'Playfair Display', Georgia, 'Times New Roman', serif;
            color: #1A1A1A;
            margin-top: 0;
        }
        .email-body p,
        .email-body td,
        .email-body th {
            font-family: 'Inter', Arial, Helvetica, sans-serif;
            font-size: 15px;
            line-height: 1.7;
            color: #3A3A3A;
        }

        /* ===== HEADING SECTION ===== */
        .email-heading-section {
            background-color: #FAFAF8;
            border-left: 4px solid #C8842A;
            padding: 20px 24px;
            margin-bottom: 32px;
            border-radius: 0 6px 6px 0;
        }
        .email-heading-section h1 {
            font-family: 'Playfair Display', Georgia, 'Times New Roman', serif;
            font-size: 22px;
            font-weight: 700;
            color: #1A1A1A;
            margin: 0;
            line-height: 1.3;
        }

        /* ===== BOUTON ===== */
        .email-button a {
            display: inline-block;
            background-color: #C8842A;
            color: #ffffff !important;
            font-family: 'Inter', Arial, Helvetica, sans-serif;
            font-size: 14px;
            font-weight: 600;
            text-decoration: none;
            text-transform: uppercase;
            letter-spacing: 0.08em;
            padding: 14px 28px;
            border-radius: 6px;
            mso-padding-alt: 14px 28px;
        }

        /* ===== RESPONSIVE ===== */
        @media only screen and (max-width: 600px) {
            .email-container {
                width: 100% !important;
                border-radius: 0 !important;
            }
            .email-header-inner {
                padding: 28px 24px 24px;
            }
            .email-header-shop-name {
                font-size: 22px;
            }
            .email-body {
                padding: 24px 20px;
            }
            .email-heading-section {
                padding: 16px 18px;
            }
            .email-heading-section h1 {
                font-size: 18px;
            }
        }
        @media only screen and (max-width: 400px) {
            .email-header-shop-name {
                font-size: 18px;
            }
            .email-header-tagline {
                font-size: 10px;
            }
        }
    </style>
</head>
<body>

<?php do_action( 'woocommerce_email_styles' ); ?>

<div class="email-wrapper">
    <table border="0" cellpadding="0" cellspacing="0" width="100%" role="presentation">
        <tr>
            <td align="center" valign="top" style="padding: 0;">

                <!-- Conteneur principal -->
                <table border="0" cellpadding="0" cellspacing="0" width="600" class="email-container" role="presentation" style="max-width:600px;">

                    <!-- ===== EN-TÊTE / HEADER ===== -->
                    <tr>
                        <td class="email-header" style="background-color:#1A1A1A;">
                            <div class="email-header-inner">
                                <a href="<?php echo esc_url( $shop_url ); ?>" class="email-header-logo-link" style="text-decoration:none;">

                                    <?php
                                    // Si un logo est défini dans la personnalisation WordPress
                                    $custom_logo_id = get_theme_mod( 'custom_logo' );
                                    if ( $custom_logo_id ) :
                                        $logo_url = wp_get_attachment_image_url( $custom_logo_id, 'medium' );
                                        if ( $logo_url ) :
                                    ?>
                                        <img src="<?php echo esc_url( $logo_url ); ?>"
                                             alt="<?php echo esc_attr( $shop_name ); ?>"
                                             style="max-height:60px; max-width:200px; height:auto; display:block; margin:0 auto 12px;">
                                    <?php
                                        endif;
                                    endif;
                                    ?>

                                    <!-- Nom boutique (affiché toujours, avec ou sans logo) -->
                                    <span class="email-header-shop-name"
                                          style="font-family:'Playfair Display',Georgia,'Times New Roman',serif;
                                                 font-size:28px;
                                                 font-weight:700;
                                                 color:#C8842A;
                                                 display:block;
                                                 letter-spacing:-0.02em;
                                                 line-height:1.2;">
                                        <?php echo esc_html( $shop_name ); ?>
                                    </span>

                                    <!-- Tagline (optionnelle — personnalisable) -->
                                    <span class="email-header-tagline"
                                          style="font-family:'Inter',Arial,Helvetica,sans-serif;
                                                 font-size:11px;
                                                 font-weight:500;
                                                 color:#6B6460;
                                                 display:block;
                                                 text-transform:uppercase;
                                                 letter-spacing:0.15em;
                                                 margin-top:8px;">
                                        <?php echo esc_html__( 'Mode africaine — Dakar, Sénégal', 'astra-child' ); ?>
                                    </span>

                                </a>
                            </div>

                            <!-- Ligne de séparation ocre -->
                            <div class="email-header-divider"
                                 style="height:3px;
                                        background:linear-gradient(90deg,transparent 0%,#C8842A 20%,#C8842A 80%,transparent 100%);
                                        display:block;">
                            </div>

                            <!-- Motif wax décoratif -->
                            <div class="email-header-pattern"
                                 style="height:8px;
                                        background-color:#111111;
                                        background-image:repeating-linear-gradient(45deg,transparent,transparent 4px,rgba(200,132,42,0.3) 4px,rgba(200,132,42,0.3) 8px);
                                        display:block;">
                            </div>
                        </td>
                    </tr>

                    <!-- ===== HEADING EMAIL ===== -->
                    <tr>
                        <td style="background-color:#FAFAF8; padding:0 40px;">
                            <table border="0" cellpadding="0" cellspacing="0" width="100%" role="presentation">
                                <tr>
                                    <td style="padding:28px 0 0;">
                                        <div class="email-heading-section"
                                             style="background-color:#FAFAF8;
                                                    border-left:4px solid #C8842A;
                                                    padding:18px 22px;
                                                    border-radius:0 6px 6px 0;
                                                    margin-bottom:0;">
                                            <h1 style="font-family:'Playfair Display',Georgia,'Times New Roman',serif;
                                                        font-size:20px;
                                                        font-weight:700;
                                                        color:#1A1A1A;
                                                        margin:0;
                                                        line-height:1.3;">
                                                <?php echo wp_kses_post( $email_heading ); ?>
                                            </h1>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <!-- ===== DÉBUT DU CONTENU PRINCIPAL ===== -->
                    <tr>
                        <td class="email-body"
                            style="background-color:#ffffff;
                                   padding:32px 40px;
                                   font-family:'Inter',Arial,Helvetica,sans-serif;
                                   font-size:15px;
                                   line-height:1.7;
                                   color:#3A3A3A;">
