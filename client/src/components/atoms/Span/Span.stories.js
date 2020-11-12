import React from 'react';
import { withKnobs, text } from '@storybook/addon-knobs';

import Span from '.';

export default {
  component: Span,
  title: 'Atoms/Span',
  decorators: [
    (Story) => (
      <div style={{ margin: '3em' }}>
        <Story />
      </div>
    ),
    withKnobs,
  ],
  argTypes: {
    type: {
      control: {
        type: 'select',
        options: ['default', 'main-header'],
      },
    },
  },
};

const Template = (args) => <Span {...args}>{text('메세지', 'Span')}</Span>;

export const Default = Template.bind({});
Default.args = {
  type: 'default',
  fontSize: '3em',
};
