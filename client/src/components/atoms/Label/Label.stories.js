import React from 'react';
import { withKnobs, text } from '@storybook/addon-knobs';

import Label from '.';

export default {
  component: Label,
  title: 'Atoms/Label',
  decorators: [
    (Story) => (
      <div style={{ margin: '3em' }}>
        <Story />
      </div>
    ),
    withKnobs,
  ],
  argTypes: {
    background: {
      control: 'color',
    },
  },
};

const Template = (args) => <Label {...args}>{text('메세지', 'Label')}</Label>;

export const Default = Template.bind({});
Default.args = {
  background: '#34a3d5',
  fontSize: '1em',
};
