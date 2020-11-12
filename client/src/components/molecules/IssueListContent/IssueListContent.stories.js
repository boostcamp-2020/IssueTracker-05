import React from 'react';
import { withKnobs } from '@storybook/addon-knobs';

import IssueListContent from '.';

export default {
  component: IssueListContent,
  title: 'Molecules/IssueListContent',
  decorators: [
    (Story) => (
      <div style={{ 'text-align': 'center' }}>
        <Story />
      </div>
    ),
    withKnobs,
  ],
};

const Template = (args) => <IssueListContent {...args} />;

export const Default = Template.bind({});
Default.args = {};
