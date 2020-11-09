import React from 'react';
import { withKnobs, text } from '@storybook/addon-knobs';

import LabelListTitle from '.';

export default {
  component: LabelListTitle,
  title: 'molecules/LabelListTitle',
  decorators: [
    (Story) => (
      <div style={{ margin: '3em' }}>
        <Story />
      </div>
    ),
    withKnobs,
  ],
};

const Template = (args) => <LabelListTitle {...args} />;

export const Default = Template.bind({});
Default.args = {
  type: 'default',
  fontSize: '1.5em',
  name: '8 labels',
};
