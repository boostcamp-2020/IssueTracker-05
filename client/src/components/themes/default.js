import { reversePalette } from "styled-theme/composer";
import { createGlobalStyle } from "styled-components";

const theme = {};

theme.palette = {
  primary: ["#1976d2", "#2196f3", "#71bcf7", "#c2e2fb"],
  secondary: ["#c2185b", "#e91e63", "#f06292", "#f8bbd0"],
  danger: ["#d32f2f", "#f44336", "#f8877f", "#ffcdd2"],
  alert: ["#ffa000", "#ffc107", "#ffd761", "#ffecb3"],
  success: ["#388e3c", "#4caf50", "#7cc47f", "#c8e6c9"],
  white: ["#fff", "#fff", "#eee"],
  grayscale: [
    "#212121",
    "#414141",
    "#616161",
    "#9e9e9e",
    "#bdbdbd",
    "#e0e0e0",
    "#eeeeee",
    "#ffffff",
  ],
  button: [
    "#2BB64C", // green (New Issue, Submit New Issue, New Milestone, Create Milestone, Create Label, Save Changes, Open)
    "#E8EAEC", // gray (Cancel, Count of Labels & Milestones, Edit, Close Issue, Reopen Issue, )
    "#D73A49", // red (Closed)
    "#F5F7F9", // blue (Selected 'Milestones', Selected 'Labels)
  ],
  buttonHover: [],
};

theme.reversePalette = reversePalette(theme.palette);

theme.fonts = {
  primary: "Helvetica Neue, Helvetica, Roboto, sans-serif",
  pre: "Consolas, Liberation Mono, Menlo, Courier, monospace",
  quote: "Georgia, serif",
  main: "'Jua', 'Do Hyeon', 'Noto Sans KR', sans-serif",
  secondary: "'Gamjs Flower', 'Nanum Brush Script', 'Stylish', monospace",
};

theme.sizes = {
  maxWidth: "1100px",
};

export default theme;
