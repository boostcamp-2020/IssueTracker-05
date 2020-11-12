import React from 'react';
import { withKnobs } from '@storybook/addon-knobs';

import CreateEditMilestone from '.';

export default {
  component: CreateEditMilestone,
  title: 'organisms/CreateEditMilestone',
  decorators: [
    (Story) => (
      <div style={{ margin: '3em' }}>
        <Story />
      </div>
    ),
    withKnobs,
  ],
};

const Template = (args) => <CreateEditMilestone {...args} />;

export const Default = Template.bind({});
Default.args = {
  mid: 1,
};
