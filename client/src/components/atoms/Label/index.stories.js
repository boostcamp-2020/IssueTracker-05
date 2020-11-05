import React from "react";
import Label from '.';
import { withKnobs, text, boolean } from '@storybook/addon-knobs';

export default {
  component: Label,
  title: "Label",
  decorators: [withKnobs],
};

const Template = args => <Label {...args}>안녕</Label>

export const Default = Template.bind({});
Default.args = {
  background: "#aa22ff"
};
