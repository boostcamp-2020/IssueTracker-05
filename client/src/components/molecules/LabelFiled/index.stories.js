import React from "react";
import LabelField from ".";
import { withKnobs, text, boolean } from "@storybook/addon-knobs";

export default {
  component: LabelField,
  title: "LabelField",
  decorators: [withKnobs],
};

const Template = (args) => <LabelField {...args} />;

export const Default = Template.bind({});
Default.args = {
  LabelBackground: "#3d2f0d",
  LabelWidth: 80,
  ButtonDisabled: true,
  ButtonWidth: 30,
  ButtonHeight: 50,
  ButtonFontSize: 20,
  LabelName: "라벨이름",
  ExplainDesc: "라벨 설명",
  ButtonUpdate: "수정",
  ButtonDelete: "삭제",
  LabelFieldWidth: 1000,
};
