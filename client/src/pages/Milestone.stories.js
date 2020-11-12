import React from 'react';
import { withKnobs } from '@storybook/addon-knobs';

import Milestone from './Milestone';

export default {
  component: Milestone,
  title: 'Pages/Milestone',
  decorators: [
    (Story) => (
      <div style={{ margin: '3em' }}>
        <Story />
      </div>
    ),
    withKnobs,
  ],
};

const Template = (args) => <Milestone {...args} />;

export const Default = Template.bind({});
Default.args = {};
