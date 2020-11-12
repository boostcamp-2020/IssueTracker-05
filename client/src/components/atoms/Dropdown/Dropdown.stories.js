import React from 'react';
import { withKnobs } from '@storybook/addon-knobs';

import Dropdown from '.';

export default {
  component: Dropdown,
  title: 'Atoms/Dropdown',
  decorators: [
    (Story) => (
      <div style={{ 'text-align': 'center' }}>
        <Story />
      </div>
    ),
    withKnobs,
  ],
};

const Template = (args) => <Dropdown {...args} />;

export const Default = Template.bind({});
Default.args = {
  name: 'Dropdown',
  title: 'Filter List',
  contentList: ['Content1', 'Content2', 'Content3', 'Content4', 'Content5'],
};
