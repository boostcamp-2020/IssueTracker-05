import React from 'react';
import { withKnobs, text } from '@storybook/addon-knobs';

import Button from './Button';

export default {
  component: Button,
  title: 'Atoms/Button',
  decorators: [
    (Story) => (
      <div style={{ margin: '3em' }}>
        <Story />
      </div>
    ),
    withKnobs,
  ],
  args: {
    disabled: false,
  },
  argTypes: {
    type: {
      control: {
        type: 'select',
        options: ['default', 'cancel', 'create', 'edit'],
      },
    },
  },
};

const Template = (args) => <Button {...args}>{text('메세지', 'Hello')}</Button>;

export const Default = Template.bind({});
Default.args = {
  type: 'default',
};

export const Edit = Template.bind({});
Edit.args = {
  type: 'edit',
};

export const Cancel = Template.bind({});
Cancel.args = {
  type: 'cancel',
};

export const Create = Template.bind({});
Create.args = {
  type: 'create',
};
