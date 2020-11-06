import React from "react";
import Label from ".";
import { withKnobs, text, boolean } from "@storybook/addon-knobs";

export default {
  component: Label,
  title: "Label",
  decorators: [withKnobs],
};

const Template = (args) => <Label {...args}>{text("메세지", "Hello")}</Label>;

export const Default = Template.bind({});
Default.args = {
  LabelBackground: "#4341fd",
  LabelWidth: 60,
};
