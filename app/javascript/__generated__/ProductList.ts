/* tslint:disable */
/* eslint-disable */
// @generated
// This file was automatically generated and should not be edited.

// ====================================================
// GraphQL query operation: ProductList
// ====================================================

export interface ProductList_products {
  __typename: "Product";
  id: number;
  identifier: string;
  title: string | null;
  price: string;
  discountedPrice: string;
  discount: number;
  free: boolean;
}

export interface ProductList {
  products: ProductList_products[];
}
