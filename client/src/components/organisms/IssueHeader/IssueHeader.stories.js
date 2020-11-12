import React from 'react';
import { withKnobs } from '@storybook/addon-knobs';

import IssueHeader from '.';

export default {
  component: IssueHeader,
  title: 'organisms/IssueHeader',
  decorators: [
    (Story) => (
      <div style={{ margin: '3em' }}>
        <Story />
      </div>
    ),
    withKnobs,
  ],
};

const Template = (args) => <IssueHeader {...args} />;

export const Default = Template.bind({});
Default.args = {
  spanType: 'open',
};
