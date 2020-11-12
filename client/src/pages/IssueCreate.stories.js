import React from 'react';
import { withKnobs } from '@storybook/addon-knobs';

import IssueCreate from './IssueCreate';

export default {
  component: IssueCreate,
  title: 'Pages/IssueCreate',
  decorators: [
    (Story) => (
      <div style={{ margin: '3em' }}>
        <Story />
      </div>
    ),
    withKnobs,
  ],
};

const Template = (args) => <IssueCreate {...args} />;

export const Default = Template.bind({});
Default.args = {};
