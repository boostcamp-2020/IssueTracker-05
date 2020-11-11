import React from 'react';
import { withKnobs, text } from '@storybook/addon-knobs';

import Sign from './Sign';

export default {
  component: Sign,
  title: 'Pages/Sign',
  decorators: [
    (Story) => (
      <div style={{ margin: '3em' }}>
        <Story />
      </div>
    ),
    withKnobs,
  ],
};

const Template = (args) => <Sign {...args} />;

export const Default = Template.bind({});
Default.args = {};
