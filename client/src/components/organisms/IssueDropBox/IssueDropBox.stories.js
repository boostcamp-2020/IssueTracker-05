import React from 'react';
import { withKnobs } from '@storybook/addon-knobs';

import IssueDropBox from '.';

export default {
  component: IssueDropBox,
  title: 'Organisms/IssueDropBox',
  decorators: [withKnobs],
  args: {
    disabled: false,
  },
};

const Template = (args) => <IssueDropBox {...args} />;

export const Default = Template.bind({});
