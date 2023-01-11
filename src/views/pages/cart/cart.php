<?php
    $homeUrl = $data['routes']['GET:Home#index']->getUrl();
	$deleteCart = $data['routes']['GET:Cart#deleteCart']->getUrl(['id' => unserialize($_SESSION['user'])->getId()]);
?>

<section class="cart">
    <nav>
        <h1><?= NAV_CART ?></h1>
    </nav>
    <div class="cart-items-container">
        <?php

            if (!isset($data['cart'])) {
                echo '<p>' . CART_EMPTY . '</p>';
            } else {
                $labelProduct = CART_LABEL_PRODUCT;
                $labelQuantity = CART_LABEL_QUANTITY;
                $labelPrice = CART_LABEL_PRICE;
                $labelTotal = CART_LABEL_TOTAL;
                echo <<<HTML
                <table>
                    <tr>
                        <td></th>
                        <td></th>
                        <td>$labelProduct</th>
                        <td>$labelQuantity</th>
                        <td>$labelPrice</th>
                        <td>$labelTotal</th>
                    </tr>
                HTML;

                foreach ($data['products'] as $product) {

                    $creator = $data['creators'][$product->getCreatorId()];

                    require PATH_COMPONENTS . 'cart.php';


                }

                echo <<<HTML
                </table>
                HTML;
            }
        ?>
    </div>
    <?php if(isset($data['cart'])): ?>
        <section class="info-cart">
            <div class="cart-total">
                <p><?= CART_TOTAL . " : " . $data['count']['quantity'] ?></p>
                <p><?= CART_PRICE . " : " . $data['total']['cart_price']?> €</p>
                <p><?= CART_PRICE_DISCOUNT . " : " . $data['total']['cart_price_discount']?> €</p>
            </div>
            <div class="cart-buttons">
                <button>
                    <a href="#" class="btn btn-primary"><?= CART_CHECKOUT ?></a>
                </button>
                <button>
                    <a href="<?= $deleteCart ?>" class="btn btn-primary"><?= CART_DELETE ?></a>
                </button>
                <button>
                    <a href="<?= $homeUrl ?>" class="btn btn-primary"><?= CART_CONTINUE ?></a>
                </button>
            </div>
        </section>
    <?php endif ?>
</section>