import React from 'react';
import { withKnobs, text } from '@storybook/addon-knobs';

import IssueContent from '.';

export default {
  component: IssueContent,
  title: 'organisms/IssueContent',
  decorators: [
    (Story) => (
      <div style={{ margin: '3em' }}>
        <Story />
      </div>
    ),
    withKnobs,
  ],
};

const Template = (args) => <IssueContent {...args} />;

export const Default = Template.bind({});
Default.args = {};
