import * as React from "react";
import { ApolloClient, InMemoryCache, ApolloProvider } from "@apollo/client";
import ProductList from "./ProductList";
import Cart from "./Cart";

const client = new ApolloClient({
  uri: "/graphql",
  cache: new InMemoryCache(),
});

const Store = () => {
  return (
    <ApolloProvider client={client}>
      <div className="w-3/4 p-4">
        <ProductList />
      </div>
      <div className="w-1/4 bg-blue-100 p-4">
        <Cart />
      </div>
    </ApolloProvider>
  );
};

export default Store;
