import * as React from "react";
import { ADD_PRODUCT_TO_CART } from "store/mutations";
import { PRODUCT_LIST, CART } from "store/queries";

import { useMutation } from "@apollo/client";
import { ProductList_products as ProductType } from "__generated__/ProductList";
import {
  AddProductToCart as AddProductToCartType,
  AddProductToCartVariables as AddProductToCartVariablesType,
} from "__generated__/AddProductToCart";

const Card = ({ product }: { product: ProductType }) => {
  const { id, identifier, title, price, free, discount, discountedPrice } =
    product;
  const [addProductToCart] = useMutation<
    AddProductToCartType,
    AddProductToCartVariablesType
  >(ADD_PRODUCT_TO_CART, {
    refetchQueries: [{ query: PRODUCT_LIST }, { query: CART }],
  });
  return (
    <div className="m-2 p-4 rounded border w-60">
      <img src={`http://placeimg.com/640/480/animals?${id}`} />
      <p className="text-lg font-bold my-2">{title || identifier}</p>
      <div className="my-2">
        {free ? (
          <>
            <span className="text-green-500 font-bold">FREE!</span>
            <span className="text-gray-400 text-sm pl-2 line-through">
              {price}
            </span>
          </>
        ) : discount > 0 ? (
          <>
            <span className="text-green-500">{discountedPrice}</span>
            <span className="text-gray-400 text-sm pl-2 line-through">
              {price}
            </span>
          </>
        ) : (
          <span>{price}</span>
        )}
      </div>
      <button
        className="my-2 w-full bg-green-500 hover:bg-green-300 text-white rounded py-4"
        onClick={() => addProductToCart({ variables: { productId: id } })}
      >
        Add to cart
      </button>
    </div>
  );
};

export default Card;
