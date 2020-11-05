import React from "react";
import PropTypes from "prop-types";
class HelloWorld extends React.Component {
  render() {
    return (
      <React.Fragment>
        <h1>Hello</h1>
      </React.Fragment>
    );
  }
}

HelloWorld.propTypes = {
  greeting: PropTypes.string,
};
export default HelloWorld;
