import React from "react";
import ContentHeader from ".";
import { withKnobs, text, boolean } from "@storybook/addon-knobs";

export default {
  component: ContentHeader,
  title: "ContentHeader",
  decorators: [withKnobs],
};

const Template = (args) => (
  <ContentHeader {...args}>{text("메세지", "Hello")}</ContentHeader>
);

export const Default = Template.bind({});
Default.args = {
  ContentHeaderWidth: 1000,
  ContentHeaderHeight: 50,
  ContentHeaderFontSize: 20,
};
