import React from 'react';
import { withKnobs, text } from '@storybook/addon-knobs';

import MainHeader from '.';

export default {
  component: MainHeader,
  title: 'molecules/MainHeader',
  decorators: [
    (Story) => (
      <div style={{ margin: '3em' }}>
        <Story />
      </div>
    ),
    withKnobs,
  ],
};

const Template = (args) => <MainHeader {...args} />;

export const Default = Template.bind({});
Default.args = {
  type: 'main-header',
  fontSize: '3em',
};
