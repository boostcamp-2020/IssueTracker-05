import React from 'react';
import { withKnobs, text } from '@storybook/addon-knobs';

import LabelInform from '.';

export default {
  component: LabelInform,
  title: 'molecules/LabelInform',
  decorators: [
    (Story) => (
      <div style={{ margin: '3em' }}>
        <Story />
      </div>
    ),
    withKnobs,
  ],
};

const Template = (args) => <LabelInform {...args} />;

export const Default = Template.bind({});
Default.args = {
  name: 'test',
  explain: '설명충',
  fontSize: '1.2em',
  background: '#34d5c1',
  type: 'default',
};
