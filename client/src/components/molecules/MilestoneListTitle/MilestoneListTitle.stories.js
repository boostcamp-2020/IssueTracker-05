import React from 'react';
import { withKnobs, text } from '@storybook/addon-knobs';

import MilestoneListTitle from '.';

export default {
  component: MilestoneListTitle,
  title: 'Molecules/MilestoneListTitle',
  decorators: [
    (Story) => (
      <div style={{ margin: '3em' }}>
        <Story />
      </div>
    ),
    withKnobs,
  ],
};

const Template = (args) => <MilestoneListTitle {...args} />;

export const Default = Template.bind({});
Default.args = {};
