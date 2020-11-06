import React from "react";
import SwipeableViews from "react-swipeable-views";
import { makeStyles } from "@material-ui/core/styles";

import Avatar from "@material-ui/core/Avatar";
import Card from "@material-ui/core/Card";
import CardActions from "@material-ui/core/CardActions";
import CardContent from "@material-ui/core/CardContent";
import CardHeader from "@material-ui/core/CardHeader";
import IconButton from "@material-ui/core/IconButton";
import Tabs from "@material-ui/core/Tabs";
import Tab from "@material-ui/core/Tab";
import Typography from "@material-ui/core/Typography";

import FavoriteIcon from "@material-ui/icons/Favorite";
import ShareIcon from "@material-ui/icons/Share";
import MoreVertIcon from "@material-ui/icons/MoreVert";

import bookLogin from "./bookLogin.png";
import commentLogin from "./commentLogin.png";
import likeLogin from "./likeLogin.png";

const useStyles = makeStyles(() => {
  const baseStyle = {
    padding: "1em",
    color: "#f2efcd"
  };
  const activeBaseStyle = {
    color: "white",
    borderTopLeftRadius: "5px",
    borderTopRightRadius: "5px"
  };

  return {
    slide0: {
      ...baseStyle,
      backgroundColor: "#72baac"
    },
    slide1: {
      ...baseStyle,
      backgroundColor: "#f5f0ae"
    },
    slide2: {
      ...baseStyle,
      backgroundColor: "#D16E5B"
    },
    image: {
      width: "100%",
      height: "auto"
    },
    active0: {
      ...activeBaseStyle,
      backgroundColor: "#f5f0ae"
    },
    active1: {
      ...activeBaseStyle,
      backgroundColor: "#D16E5B"
    },
    active2: {
      ...activeBaseStyle,
      backgroundColor: "#72baac"
    },
    card: {
      margin: "0 auto",
      width: "70%"
    },
    cardContent: {
      textAlign: "left"
    }
  };
});

const Swipe = () => {
  const [swipeableActions, setSwipeableActions] = React.useState();
  const [tabIndex, setTabIndex] = React.useState(0);
  const classes = useStyles();
  const items = [bookLogin, commentLogin, likeLogin];
  const itemInitial = ["M", "V", "K"];
  const itemNames = ["MooVooKとは", "コメント", "Book Like"];
  const itemText = ["aaaaaaaaaaa","bbbbbbbbb","cccccccccc"];
  const itemOfficialNames = [
    "MooVooKって何？？",
    "投稿にコメントを残そう！",
    "気に入った投稿はBooK Like!"
  ];

  const handleChange = index => {
    setTabIndex(index);
  };

  return (
    <React.Fragment>
      <Tabs
        value={tabIndex}
        onChange={(e, value) => handleChange(value)}
        variant="fullWidth"
        indicatorColor="primary"
      >
        {itemNames.map((itemName, i) => (
          <Tab
            className={tabIndex === i && classes[`active${i}`]}
            label={itemName}
          />
        ))}
      </Tabs>
      <SwipeableViews
        enableMouseEvents
        action={actions => setSwipeableActions(actions)}
        resistance
        animateHeight
        index={tabIndex}
        onChangeIndex={index => handleChange(index)}
      >
        {items.map((item, index) => (
          <div key={index} className={classes[`slide${index}`]}>
            <Card className={classes.card}>
              <CardHeader
                avatar={
                  <Avatar aria-label="recipe" className={classes.avatar}>
                    {itemInitial[index]}
                  </Avatar>
                }
                action={
                  <IconButton aria-label="settings">
                    <MoreVertIcon />
                  </IconButton>
                }
                title={itemOfficialNames[tabIndex]}
              />
              <img
                alt={itemOfficialNames[tabIndex]}
                className={classes.image}
                src={item}
              />
              <CardContent className={classes.cardContent}>
                <React.Fragment>
                  <Typography
                    variant="body2"
                    color="textSecondary"
                    component="p"
                  >
                    {itemText[index]}
                  </Typography>
                </React.Fragment>
              </CardContent>
              <CardActions disableSpacing>
                <IconButton>
                  <FavoriteIcon />
                </IconButton>
                <IconButton>
                  <ShareIcon />
                </IconButton>
              </CardActions>
            </Card>
          </div>
        ))}
      </SwipeableViews>
    </React.Fragment>
  );
};
export default Swipe;
