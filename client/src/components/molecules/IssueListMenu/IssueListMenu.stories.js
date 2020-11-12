import React from 'react';
import { withKnobs } from '@storybook/addon-knobs';

import IssueListMenu from '.';

export default {
  component: IssueListMenu,
  title: 'Molecules/IssueListMenu',
  decorators: [
    (Story) => (
      <div style={{ 'text-align': 'center' }}>
        <Story />
      </div>
    ),
    withKnobs,
  ],
};

const Template = (args) => <IssueListMenu {...args} />;

export const Default = Template.bind({});
Default.args = {};
