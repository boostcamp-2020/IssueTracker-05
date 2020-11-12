import React from 'react';
import { withKnobs, text } from '@storybook/addon-knobs';

import IssueInform from './IssueInform';

export default {
  component: IssueInform,
  title: 'Pages/IssueInform',
  decorators: [
    (Story) => (
      <div style={{ margin: '3em' }}>
        <Story />
      </div>
    ),
    withKnobs,
  ],
};

const Template = (args) => <IssueInform {...args} />;

export const Default = Template.bind({});
Default.args = {};
