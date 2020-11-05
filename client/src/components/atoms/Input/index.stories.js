import React from "react";
import Input from '.';

export default {
  component: Input,
  title: "Input",
};

const Template = args => <Input {...args} />

export const Default = Template.bind({});
Default.args = {
  background: 1,
  width: 200,
  height: 40,
};

