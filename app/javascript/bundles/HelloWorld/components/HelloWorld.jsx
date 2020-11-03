import PropTypes from 'prop-types';
import React, { useState } from 'react';

const HelloWorld = (props) => {
  const [name, setName] = useState(props.name);

  return (
    <div>
      <h3>Hello, {name}!</h3>
      <hr />
      <form>
        <label htmlFor="name">
          Say hello to:
          <input id="name" type="text" value={name} onChange={(e) => setName(e.target.value)} />
        </label>
      </form>
    </div>
  );
};

HelloWorld.propTypes = {
  name: PropTypes.string.isRequired, // this is passed from the Rails view
};

export default HelloWorld;

// import React from "react";
// import SwipeableViews from "react-swipeable-views";

// const Swipe = () => {
//   const [swipeableActions, setSwipeableActions] = React.useState();

//   return (
//     <SwipeableViews
//       enableMouseEvents
//       action={actions => setSwipeableActions(actions)}
//       resistance
//       animateHeight
//     >
//       <div>スライド0</div>
//       <div>スライド1</div>
//       <div>スライド2</div>
//     </SwipeableViews>
//   );
// };
// export default Swipe;
