import React from "react";
import Explain from ".";
import { withKnobs, text, boolean } from "@storybook/addon-knobs";

export default {
  component: Explain,
  title: "Explain",
  decorators: [withKnobs],
};

const Template = (args) => (
  <Explain {...args}>{text("메세지", "Hello")}</Explain>
);

export const Default = Template.bind({});
Default.args = {
  ExplainBackground: 1,
};
