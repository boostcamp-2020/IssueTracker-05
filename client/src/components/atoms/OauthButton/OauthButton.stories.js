import React from 'react';
import { withKnobs, text } from '@storybook/addon-knobs';

import OAuthButton from '.';

export default {
  component: OAuthButton,
  title: 'Atoms/OAuthButton',
  decorators: [
    (Story) => (
      <div style={{ margin: '3em' }}>
        <Story />
      </div>
    ),
    withKnobs,
  ],
};

const Template = (args) => <OAuthButton {...args} />;

export const Default = Template.bind({});
Default.args = {};
