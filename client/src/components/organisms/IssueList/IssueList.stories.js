import React from 'react';
import { withKnobs } from '@storybook/addon-knobs';

import IssueList from '.';

export default {
  component: IssueList,
  title: 'Organisms/IssueList',
  decorators: [
    (Story) => (
      <div style={{ 'text-align': 'center' }}>
        <Story />
      </div>
    ),
    withKnobs,
  ],
};

const Template = (args) => <IssueList {...args} />;

export const Default = Template.bind({});
Default.args = {};
