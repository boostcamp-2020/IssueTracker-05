import React from 'react';

import Input from '.';

export default {
  component: Input,
  title: 'Atoms/Input',
  decorators: [
    (Story) => (
      <div style={{ margin: '3em' }}>
        <Story />
      </div>
    ),
  ],
  argTypes: {
    type: {
      control: {
        type: 'select',
        options: ['text', 'password', 'date', 'textarea'],
      },
    },
    height: {
      control: 'number',
    },
  },
};

const Template = (args) => <Input {...args} />;

export const Text = Template.bind({});
Text.args = {
  type: 'text',
  height: 40,
};

export const Password = Template.bind({});
Password.args = {
  type: 'password',
  height: 40,
};

export const Date = Template.bind({});
Date.args = {
  type: 'date',
  height: 40,
};

export const TextArea = Template.bind({});
TextArea.args = {
  type: 'textarea',
  height: 40,
};