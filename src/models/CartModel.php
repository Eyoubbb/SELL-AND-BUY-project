<?php

require_once PATH_CORE . 'Model.php';
require_once PATH_ENTITIES . 'Carts.php';

class CartModel extends Model {

	public function cart(int $user_id): array | false {

        $cartDAO = $this->dao('Cart');

        $resCarts = $cartDAO->getCartByUserId($user_id);

        if ($resCarts === false) {
            $this->setError('ERROR_CARTS_NOT_FOUND');
            return false;
        }

        if (empty($resCarts)) {
            return false;
        }

        $productsCart = $cartDAO->findAllProductsCart($user_id);

        $products = [];
		$creators = [];
        $product_quantity = [];

		foreach ($productsCart as $row) {
			$products[] = new Product($row);
            $cartQuantity = $cartDAO->getQuantityOneProduct($user_id, $row['product_id']);
            $products_quantity[$row['product_id']] = $cartQuantity[0];

            if (!isset($creators[$row['user_id']])) {
                $creators[$row['user_id']] = new User($row);
            }
		}

        $price = $cartDAO->getCartPrice($user_id);
        $quantity = $cartDAO->getQuantityProduct($user_id);

        return [
            'carts' => $resCarts,
            'products' => $products,
            'creators' => $creators,
            'price' =>  $price[0],
            'quantity' => $quantity[0],
            'products_quantity' => $products_quantity
        ];
	}

    public function increaseQuantity(int $user_id, int $product_id): bool {
        
        $cartDAO = $this->dao('Cart');

        $productsCart = $cartDAO->findAllProductsCart($user_id);

        foreach ($productsCart as $row) {
            if ($row['product_id'] === $product_id) {

                $resCart = $cartDAO->updateProductToCart($user_id, $product_id, $row['cart_quantity'] + 1);

                if ($resCart === false) {
                    $this->setError('ERROR_ADD_CART');
                    return false;
                }

                return true;
            }
        }

        $resCart = $cartDAO->addProductToCart($user_id, $product_id, 1);

        if ($resCart === false) {
            $this->setError('ERROR_INCREASE_QUANTITY');
            return false;
        }

        return true;
    }

    public function decreaseQuantity(int $user_id, int $product_id): bool {
        
        $cartDAO = $this->dao('Cart');

        $productsCart = $cartDAO->findAllProductsCart($user_id);

        foreach ($productsCart as $row) {
            if ($row['product_id'] === $product_id) {
                
                if ($row['cart_quantity'] === 1) {
                    $resCarts = $cartDAO->deleteProductFromCart($user_id, $product_id);
                } else {
                    $rescart = $cartDAO->updateProductToCart($user_id, $product_id, $row['cart_quantity'] - 1);
                }
                
                return true;
            }
        }
    }

    public function deleteProduct(int $user_id, int $product_id): bool {
        
        $cartDAO = $this->dao('Cart');

        $resCarts = $cartDAO->deleteProductFromCart($user_id, $product_id);

        if ($resCarts === false) {
            $this->setError('ERROR_DELETE_ALL_PRODUCT');
            return false;
        }

        return true;
    }

    public function deleteCart(int $user_id): bool {
        
        $cartDAO = $this->dao('Cart');

        $resCarts = $cartDAO->deleteAllProductFromCart($user_id);

        if ($resCarts === false) {
            $this->setError('ERROR_DELETE_ALL_CART');
            return false;
        }

        return true;
    }
}