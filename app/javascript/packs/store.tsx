import * as React from "react";
import * as ReactDOM from "react-dom";
import Store from "../store";

window.addEventListener("turbolinks:load", () => {
  const container = document.querySelector("#js-store-container");
  if (container) {
    ReactDOM.render(<Store />, container);
  }
});
