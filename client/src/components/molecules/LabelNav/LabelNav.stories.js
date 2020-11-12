import React from 'react';
import { withKnobs, text } from '@storybook/addon-knobs';

import LabelNav from '.';

export default {
  component: LabelNav,
  title: 'Molecules/LabelNav',
  decorators: [
    (Story) => (
      <div style={{ margin: '3em' }}>
        <Story />
      </div>
    ),
    withKnobs,
  ],
};

const Template = (args) => <LabelNav />;

export const Default = Template.bind({});
Default.args = {};
