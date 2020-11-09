import React from 'react';

import Input from '.';

export default {
  component: Input,
  title: 'Atoms/Complete',
  decorators: [
    (Story) => (
      <div style={{ margin: '3em' }}>
        <Story />
      </div>
    ),
  ],
};

const Template = (args) => <Input {...args} />;

export const Default = Template.bind({});
Default.args = {};
