import React from 'react';
import { withKnobs, text } from '@storybook/addon-knobs';

import Img from '.';

export default {
  component: Img,
  title: 'atoms/Img',
  decorators: [
    (Story) => (
      <div style={{ margin: '3em' }}>
        <Story />
      </div>
    ),
    withKnobs,
  ],
};

const Template = (args) => <Img {...args} />;

export const Default = Template.bind({});
Default.args = {};
