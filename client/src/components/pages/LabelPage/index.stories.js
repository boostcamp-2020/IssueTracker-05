import React from "react";
import LabelPage from ".";
import { withKnobs, text, boolean } from "@storybook/addon-knobs";

export default {
  component: LabelPage,
  title: "LabelPage",
  decorators: [withKnobs],
};

const Template = (args) => <LabelPage {...args} />;

export const Default = Template.bind({});
Default.args = {
  width: 1000,
  LMInform: {
    ButtonDisabled: true,
    ButtonHeight: 30,
    ButtonWidth: 100,
  },
  LabelsInform: {
    LabelContentsWidth: 1000,
    height: 40,
    fontSize: 20,
    LabelWidth: 80,
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
        LabelBackground: "#4341cf",
        LabelName: "frontend",
        ExplainDesc: "프론트",
      },
      {
        LabelBackground: "#33fc79",
        LabelName: "chore",
        ExplainDesc: "잡일",
      },
    ],
  },
};
