import { gql } from "@apollo/client";

export const PRODUCT_LIST = gql`
  query ProductList {
    products {
      id
      identifier
      title
      price
      discountedPrice
      discount
      free
    }
  }
`;

export const CART = gql`
  query Cart {
    cart {
      totalPrice
      grossPrice
      discount
      cartProducts {
        amount
        grossPrice
        totalPrice
        discount
        product {
          id
          identifier
          title
        }
      }
    }
  }
`;
