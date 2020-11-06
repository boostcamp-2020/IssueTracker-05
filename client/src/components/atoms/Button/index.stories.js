import React from "react";
import Button from ".";
import { withKnobs, text, boolean, number } from "@storybook/addon-knobs";

export default {
  component: Button,
  title: "Button",
  decorators: [withKnobs],
};

const Template = (args) => <Button {...args}>{text("메세지", "Hello")}</Button>;

export const Default = Template.bind({});
Default.args = {
  ButtonFontSize: 20,
  ButtonHeight: 30,
  ButtonWidth: 50,
  ButtonDisabled: true,
};

export const Sample1 = Template.bind({});
Sample1.args = {
  ButtonFontSize: 20,
  ButtonHeight: 30,
  ButtonWidth: 50,
  ButtonDisabled: false,
};
