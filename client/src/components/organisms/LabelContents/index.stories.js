import React from "react";
import LabelContents from ".";
import { withKnobs, text, boolean } from "@storybook/addon-knobs";

export default {
  component: LabelContents,
  title: "LabelContents",
  decorators: [withKnobs],
};

const Template = (args) => <LabelContents {...args}></LabelContents>;

export const Default = Template.bind({});
Default.args = {
  LabelContentsWidth: 1000,
  height: 40,
  fontSize: 20,
  LabelWidth: 50,
  ExplainBackgound: 0,
  ButtonDisabled: true,
  ButtonHeight: 30,
  ButtonWidth: 50,
  ButtonFontSize: 10,
  ButtonUpdate: "수정",
  ButtonDelete: "삭제",
  LabelsInform: [
    {
      LabelBackground: "#42dc2f",
      LabelName: "backend",
      ExplainDesc: "백엔드",
    },
    {
      LabelBackground: "#42dc2f",
      LabelName: "backend",
      ExplainDesc: "백엔드",
    },
    {
      LabelBackground: "#42dc2f",
      LabelName: "backend",
      ExplainDesc: "백엔드",
    },
  ],
};
