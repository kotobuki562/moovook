import React from "react";
import SwipeableViews from "react-swipeable-views";

const Swipe = () => {
  const [swipeableActions, setSwipeableActions] = React.useState();

  return (
    <SwipeableViews
      enableMouseEvents
      action={actions => setSwipeableActions(actions)}
      resistance
      animateHeight
    >
      <div>スライド0</div>
      <div>スライド1</div>
      <div>スライド2</div>
    </SwipeableViews>
  );
};
export default Swipe;