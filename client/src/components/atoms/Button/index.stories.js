import React from "react";
import Button from ".";

export default {
  component: Button,
  title: "Button",
};

const Template = (args) => <Button {...args}>Hello</Button>;

export const Default = Template.bind({});
Default.args = {
  height: 40,
  disabled: true,
};

export const Sample1 = Template.bind({});
Sample1.args = {
  height: 10,
  disabled: false,
};
