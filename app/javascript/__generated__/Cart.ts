/* tslint:disable */
/* eslint-disable */
// @generated
// This file was automatically generated and should not be edited.

// ====================================================
// GraphQL query operation: Cart
// ====================================================

export interface Cart_cart_cartProducts_product {
  __typename: "Product";
  id: number;
  identifier: string;
  title: string | null;
}

export interface Cart_cart_cartProducts {
  __typename: "CartProduct";
  amount: number;
  grossPrice: string;
  totalPrice: string;
  discount: number;
  product: Cart_cart_cartProducts_product;
}

export interface Cart_cart {
  __typename: "Cart";
  totalPrice: string;
  grossPrice: string;
  discount: number;
  cartProducts: Cart_cart_cartProducts[] | null;
}

export interface Cart {
  cart: Cart_cart;
}
