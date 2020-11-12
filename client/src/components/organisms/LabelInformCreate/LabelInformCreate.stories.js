import React from 'react';
import { withKnobs, text } from '@storybook/addon-knobs';

import LabelInformCreate from '.';

export default {
  component: LabelInformCreate,
  title: 'Organisms/LabelInformCreate',
  decorators: [
    (Story) => (
      <div style={{ margin: '3em' }}>
        <Story />
      </div>
    ),
    withKnobs,
  ],
};

const Template = (args) => <LabelInformCreate {...args} />;

export const Default = Template.bind({});
Default.args = {
  type: 'default',
  state: {
    name: '',
    color: '',
    desc: '',
  },
};
