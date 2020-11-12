import React from 'react';
import { withKnobs, text } from '@storybook/addon-knobs';

import LabelList from '.';

export default {
  component: LabelList,
  title: 'Organisms/LabelList',
  decorators: [
    (Story) => (
      <div style={{ margin: '3em' }}>
        <Story />
      </div>
    ),
    withKnobs,
  ],
};

const Template = (args) => <LabelList {...args} />;

export const Default = Template.bind({});
Default.args = {
  labelList: [
    {
      name: '라벨 1',
      desc: '첫번째 라벨입니다.',
      color: '#34d5c1',
    },
    {
      name: '라벨 2',
      desc: '두번째 라벨입니다.',
      color: '#a21a54',
    },
    {
      name: '라벨 3',
      desc: '세번째 라벨입니다.',
      color: '#5ac32b',
    },
    {
      name: '라벨 4',
      desc: '네번째 라벨입니다.',
      color: '#aaaaaa',
    },
  ],
};
