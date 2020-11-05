import React from "react";
import Input from ".";

export default {
  component: Input,
  title: "Input",
};

const Template = (args) => <Input {...args} />;

export const Default = Template.bind({});
Default.args = {
  InputBackground: 1,
  InputWidth: 200,
  InputHeight: 40,
};
