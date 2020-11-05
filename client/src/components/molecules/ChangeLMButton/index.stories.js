import React from "react";
import ChangeLMButton from ".";
import { withKnobs, text, boolean } from "@storybook/addon-knobs";

export default {
  component: ChangeLMButton,
  title: "ChangeLMButton",
  decorators: [withKnobs],
};

const Template = (args) => <ChangeLMButton {...args}></ChangeLMButton>;

export const Default = Template.bind({});
Default.args = {
  MilestoneButtonName: "Milestones",
  LabelButtonName: "Labels",
  disabled: true,
  height: 30,
  width: 100,
};
