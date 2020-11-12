import React from 'react';
import { withKnobs } from '@storybook/addon-knobs';

import IssueCommentCreate from '.';

export default {
  component: IssueCommentCreate,
  title: 'Organisms/IssueCommentCreate',
  decorators: [withKnobs],
  args: {
    disabled: false,
  },
};

const Template = (args) => <IssueCommentCreate {...args} />;

export const Default = Template.bind({});
