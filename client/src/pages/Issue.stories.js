import React from 'react';
import { withKnobs } from '@storybook/addon-knobs';

import Issue from './Issue';

export default {
  component: Issue,
  title: 'Pages/Issue',
  decorators: [
    (Story) => (
      <div style={{ margin: '3em' }}>
        <Story />
      </div>
    ),
    withKnobs,
  ],
};

const Template = (args) => <Issue {...args} />;

export const Default = Template.bind({});
Default.args = {};
