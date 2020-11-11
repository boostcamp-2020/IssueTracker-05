import React from 'react';
import { withKnobs, text } from '@storybook/addon-knobs';

import MilestoneList from '.';

export default {
  component: MilestoneList,
  title: 'Organisms/MilestoneList',
  decorators: [
    (Story) => (
      <div style={{ margin: '3em' }}>
        <Story />
      </div>
    ),
    withKnobs,
  ],
};

const Template = (args) => <MilestoneList {...args} />;

export const Default = Template.bind({});
Default.args = {
  milestoneList: [
    {
      name: '마일스톤1',
      date: '2020-12-12',
      content: '쏼라쏼라1',
      open: 2,
      close: 1,
      mid: 1,
    },
    {
      name: '마일스톤2',
      date: '2020-12-13',
      content: '쏼라쏼라2',
      open: 2,
      close: 5,
      mid: 2,
    },
    {
      name: '마일스톤3',
      date: '2020-12-14',
      content: '쏼라쏼라3',
      open: 3,
      close: 1,
      mid: 3,
    },
  ],
};
