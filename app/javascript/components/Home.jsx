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
    <button type="button" class="btn btn-primary">Primary</button>
    <button type="button" class="btn btn-secondary">Secondary</button>
    <button type="button" class="btn btn-success">Success</button>
    <button type="button" class="btn btn-danger">Danger</button>
    <button type="button" class="btn btn-warning">Warning</button>
    <button type="button" class="btn btn-info">Info</button>
    <button type="button" class="btn btn-light">Light</button>
    <button type="button" class="btn btn-dark">Dark</button>
  </div>
);
