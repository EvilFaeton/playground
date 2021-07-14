import { gql } from "@apollo/client";

export const ADD_PRODUCT_TO_CART = gql`
  mutation AddProductToCart($productId: Int!) {
    addProductToCart(input: { productId: $productId }) {
      success
    }
  }
`;

export const BUY = gql`
  mutation ReleaseCart {
    releaseCart(input: {}) {
      success
    }
  }
`;
