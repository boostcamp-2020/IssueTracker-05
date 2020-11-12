import React from 'react';
import { withKnobs } from '@storybook/addon-knobs';

import IssueCommentCreateHeader from '.';

export default {
  component: IssueCommentCreateHeader,
  title: 'molecules/IssueCommentCreateHeader',
  decorators: [withKnobs],
  args: {
    disabled: false,
  },
};

const Template = (args) => <IssueCommentCreateHeader {...args} />;

export const Default = Template.bind({});
Default.args = {};
