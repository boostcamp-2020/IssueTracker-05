import React from 'react';
import { withKnobs, text } from '@storybook/addon-knobs';

import MilestoneInform from '.';

export default {
  component: MilestoneInform,
  title: 'Molecules/MilestoneInform',
  decorators: [
    (Story) => (
      <div style={{ margin: '3em' }}>
        <Story />
      </div>
    ),
    withKnobs,
  ],
};

const Template = (args) => <MilestoneInform {...args} />;

export const Default = Template.bind({});
Default.args = {
  name: '마일스톤',
  date: '2020-12-12',
  content: '쏼라쏼라',
  open: 2,
  close: 1,
};

  