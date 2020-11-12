import React from 'react';
import { withKnobs, text } from '@storybook/addon-knobs';

import MilestoneInformCreateHeader from '.';

export default {
  component: MilestoneInformCreateHeader,
  title: 'Molecules/MilestoneInformCreateHeader',
  decorators: [
    (Story) => (
      <div style={{ margin: '3em' }}>
        <Story />
      </div>
    ),
    withKnobs,
  ],
};

const Template = (args) => <MilestoneInformCreateHeader {...args} />;

export const Default = Template.bind({});
Default.args = {
  mid: 1,
};
