import React from 'react';
import { withKnobs } from '@storybook/addon-knobs';

import Tab from '.';

export default {
  component: Tab,
  title: 'Atoms/Tab',
  decorators: [withKnobs],
  args: {
    disabled: false,
  },
};

const Template = (args) => <Tab {...args} />;

export const Default = Template.bind({});
Default.args = {
  tabList: ['Label', 'Milestone'],
};
