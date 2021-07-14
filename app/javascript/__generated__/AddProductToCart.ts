/* tslint:disable */
/* eslint-disable */
// @generated
// This file was automatically generated and should not be edited.

// ====================================================
// GraphQL mutation operation: AddProductToCart
// ====================================================

export interface AddProductToCart_addProductToCart {
  __typename: "AddProductToCartPayload";
  success: boolean;
}

export interface AddProductToCart {
  addProductToCart: AddProductToCart_addProductToCart | null;
}

export interface AddProductToCartVariables {
  productId: number;
}
