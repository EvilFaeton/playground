import * as React from "react";
import { useQuery, useMutation } from "@apollo/client";
import { CART, PRODUCT_LIST } from "../queries";
import { BUY } from "store/mutations";
import {
  Cart as CartType,
  Cart_cart_cartProducts as CartProductType,
} from "__generated__/Cart";
import { ReleaseCart as ReleaseCartType } from "__generated__/ReleaseCart";

const CartProduct = ({ cartProduct }: { cartProduct: CartProductType }) => {
  const { amount, totalPrice, grossPrice, discount, product } = cartProduct;
  return (
    <div className="m-2 flex justify-between">
      <div>
        {amount} x {product.title || product.identifier}
      </div>
      <div>
        {discount > 0 ? (
          <>
            <span className="text-green-500 font-bold">{totalPrice}</span>
            <span className="text-gray-400 text-xs pl-1 line-through">
              {grossPrice}
            </span>
          </>
        ) : (
          <span>{totalPrice}</span>
        )}
      </div>
    </div>
  );
};

const Cart = () => {
  const { data, loading } = useQuery<CartType>(CART);
  const [purchaseCart] = useMutation<ReleaseCartType>(BUY, {
    refetchQueries: [{ query: PRODUCT_LIST }, { query: CART }],
  });

  if (loading) {
    return <span>Loading...</span>;
  }

  return (
    <>
      <h1 className="text-2xl px-2">Products</h1>
      {data.cart.cartProducts.length > 0 ? (
        data.cart.cartProducts.map((cartProduct) => (
          <CartProduct cartProduct={cartProduct} key={cartProduct.product.id} />
        ))
      ) : (
        <span className="p-2">You cart is empty</span>
      )}
      {data.cart.cartProducts.length > 0 && (
        <div className="mx-2 my-4 flex justify-between border-t text-xl border-gray-800 font-bold pt-2">
          <div>TOTAL:</div>
          <div>
            <div>
              {data.cart.discount > 0 ? (
                <>
                  <span className="text-green-500 font-bold">
                    {data.cart.totalPrice}
                  </span>
                  <span className="text-gray-400 text-sm pl-2 line-through">
                    {data.cart.grossPrice}
                  </span>
                </>
              ) : (
                <span>{data.cart.totalPrice}</span>
              )}
            </div>
          </div>
        </div>
      )}
      {data.cart.cartProducts.length > 0 && (
        <div>
          <button
            className="my-2 w-full bg-green-500 hover:bg-green-300 text-white rounded py-4"
            onClick={() => purchaseCart()}
          >
            Purchase!
          </button>
        </div>
      )}
    </>
  );
};

export default Cart;
