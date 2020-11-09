import React from 'react';

import InputBox from '.';

export default {
  component: InputBox,
  title: 'Molecules/InputBox',
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
  },
};

const Template = (args) => <InputBox {...args} />;

export const Default = Template.bind({});
Default.args = {
  type: 'text',
  children: 'Hello',
};

export const Password = Template.bind({});
Password.args = {
  type: 'password',
  children: 'Password',
};

export const Date = Template.bind({});
Date.args = {
  type: 'date',
  children: 'Due date',
};

export const Textarea = Template.bind({});
Textarea.args = {
  type: 'textarea',
  children: 'Description',
};
