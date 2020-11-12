import React from 'react';
import { withKnobs, text } from '@storybook/addon-knobs';

import Signup from '.';

export default {
  component: Signup,
  title: 'Organisms/Signup',
  decorators: [
    (Story) => (
      <div style={{ margin: '3em' }}>
        <Story />
      </div>
    ),
    withKnobs,
  ],
};

const Template = (args) => <Signup {...args} />;

export const Default = Template.bind({});
