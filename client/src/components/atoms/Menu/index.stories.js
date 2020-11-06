import React from "react";
import Menu from ".";
import { withKnobs, text, boolean } from "@storybook/addon-knobs";

export default {
  component: Menu,
  title: "Menu",
  decorators: [withKnobs],
};

const Template = (args) => <Menu {...args}>{text("메세지", "Hello")}</Menu>;

export const Default = Template.bind({});
Default.args = {
  MenuBackground: 1,
  MenuFontSize: 16,
  MenuWidth: 50,
  MenuHeight: 30,
};
