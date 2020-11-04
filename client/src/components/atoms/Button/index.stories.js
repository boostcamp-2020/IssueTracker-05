import React from "react";
import { storiesOf } from "@storybook/react";
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
