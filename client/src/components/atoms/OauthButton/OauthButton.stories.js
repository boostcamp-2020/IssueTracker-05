import React from 'react';
import { withKnobs, text } from '@storybook/addon-knobs';

import OauthButton from './OauthButton';

export default {
  component: OauthButton,
  title: 'Atoms/OauthButton',
  decorators: [
    (Story) => (
      <div style={{ margin: '3em' }}>
        <Story />
      </div>
    ),
    withKnobs,
  ],
  args: {
    disabled: false,
  },
  argTypes: {
    type: {
      control: {
        type: 'select',
        options: ['default'],
      },
    },
  },
};

const Template = () => (args) => <OauthButton {...args} />;

export const Default = Template.bind({});
Default.args = {
  type: 'default',
};