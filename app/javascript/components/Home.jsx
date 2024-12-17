import React from "react";
import { Link } from "react-router-dom";

export default () => (
  <div className="p-4">
    <h1>Added HomePage</h1>
    <p className="p-4">
      Hello everyone
    </p>
    <hr />
    <Link
      to="/"
      className=""
      role="button"
    >
      Some link
    </Link>
  </div>
);
