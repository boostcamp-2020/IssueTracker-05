import React from 'react';
import { withKnobs, text } from '@storybook/addon-knobs';

import Label from './Label';

export default {
  component: Label,
  title: 'Pages/Label',
  decorators: [
    (Story) => (
      <div style={{ margin: '3em' }}>
        <Story />
      </div>
    ),
    withKnobs,
  ],
};

const Template = (args) => <Label {...args} />;

export const Default = Template.bind({});
Default.args = {};
