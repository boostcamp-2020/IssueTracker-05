import React from 'react';
import { withKnobs } from '@storybook/addon-knobs';

import IssueListTitle from '.';

export default {
  component: IssueListTitle,
  title: 'Molecules/IssueListTitle',
  decorators: [
    (Story) => (
      <div style={{ 'text-align': 'center' }}>
        <Story />
      </div>
    ),
    withKnobs,
  ],
};

const Template = (args) => <IssueListTitle {...args} />;

export const Default = Template.bind({});
Default.args = {};
