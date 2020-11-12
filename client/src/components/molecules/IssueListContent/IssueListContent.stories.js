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
Default.args = {
  issue: {
    title: 'sample',
    content: '내용입니다.',
    user: {
      nickname: '인간',
    },
    labels: [
      {
        color: '#123123',
        name: '라벨1',
      },
      {
        color: '#123456',
        name: '라벨2',
      },
    ],
    milestone: '마일스톤입니다',
    assignees: [1, 2, 3, 4],
  },
};
