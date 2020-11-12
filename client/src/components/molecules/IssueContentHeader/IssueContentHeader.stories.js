import React from 'react';
import { withKnobs, text } from '@storybook/addon-knobs';

import IssueContentHeader from '.';

export default {
  component: IssueContentHeader,
  title: 'molecules/IssueContentHeader',
  decorators: [
    (Story) => (
      <div style={{ margin: '3em' }}>
        <Story />
      </div>
    ),
    withKnobs,
  ],
};

const Template = (args) => <IssueContentHeader {...args} />;

export const Default = Template.bind({});
Default.args = {
  writer: true,
};
