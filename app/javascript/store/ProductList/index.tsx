import * as React from "react";
import { useQuery } from "@apollo/client";
import { PRODUCT_LIST } from "../queries";
import Card from "./Card";
import { ProductList as ProductListType } from "__generated__/ProductList";

const ProductList = () => {
  const { data, loading } = useQuery<ProductListType>(PRODUCT_LIST);

  if (loading) {
    return <span>Loading...</span>;
  }

  return (
    <>
      <h1 className="text-2xl px-2">Products</h1>
      <div className="my-2 flex">
        {data.products.map((product) => (
          <Card key={product.id} product={product} />
        ))}
      </div>
    </>
  );
};

export default ProductList;
