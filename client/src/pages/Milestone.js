import React from 'react';
import MilestoneInformCreateHeader from '@molecules/MilestoneInformCreateHeader';
import CreateEditMilestone from '@organisms/CreateEditMilestone';
import MainHeader from '@molecules/MainHeader';

import milestoneInformStorage from '@constants/milestone/MilestoneInform';

export default () => {
  const [state, changeHandler, submitHandler] = milestoneInformStorage();
  return (
    <div>
      <MainHeader />
      <MilestoneInformCreateHeader />
      <CreateEditMilestone
        state={state}
        onChange={changeHandler}
        onSubmit={submitHandler}
      />
    </div>
  );
};
