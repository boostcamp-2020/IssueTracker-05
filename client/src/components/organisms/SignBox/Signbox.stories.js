import React from 'react';
import { withKnobs, text } from '@storybook/addon-knobs';

import Signbox from '.';

export default {
  component: Signbox,
  title: 'Organisms/Signbox',
  decorators: [
    (Story) => (
      <div style={{ margin: '3em' }}>
        <Story />
      </div>
    ),
    withKnobs,
  ],
};

const Template = (args) => <Signbox {...args} />;

export const Default = Template.bind({});
Default.args = {
  state:{
    userId: '',
    password: '',
  },
}
