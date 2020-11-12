import React, { useEffect, useState } from 'react';

import MainHeader from '@molecules/MainHeader';
import LabelNav from '@molecules/LabelNav';
import LabelList from '@organisms/LabelList';
import LabelInformCreate from '@organisms/LabelInformCreate';
import MilestoneList from '@organisms/MilestoneList';

import labelPageStorage from '@constants/label/LabelPage';
import labelInfromCreateStorage from '@constants/label/LabelInformCreate';
import milestonePageStorgage from '@constants/milestone/MilestonePage';

const Labels = () => {
  const [labels, getLabels, deleteLabel, addLabel] = labelPageStorage();
  const [
    state,
    createLabel,
    updateLabel,
    cancelLabel,
    changeHandler,
    submitHandler,
  ] = labelInfromCreateStorage();

  const submit = () => {
    submitHandler();
    addLabel(state.prevName, {
      name: state.name,
      desc: state.desc,
      color: state.color,
    });
  };

  const [
    milestones,
    setMilestoneCnt,
    getMilestones,
    deleteMilestone,
    changeMilestoneStatus,
  ] = milestonePageStorgage();

  const [tabState, SetTab] = useState(0);
  useEffect(() => {
    getLabels();
    getMilestones();
  }, []);

  let Mainpage;
  switch (tabState) {
    case 0:
      Mainpage = (
        <>
          <LabelNav
            createLabel={createLabel}
            state={tabState}
            tabChange={SetTab}
          />
          {state.disabled && (
            <LabelInformCreate
              state={state}
              changeHandler={changeHandler}
              cancelLabel={cancelLabel}
              submitHandler={submit}
            />
          )}
          <LabelList
            labelList={labels.labelList}
            onDelete={deleteLabel}
            updateLabel={updateLabel}
          />
        </>
      );
      break;
    case 1:
      Mainpage = (
        <>
          <LabelNav
            createLabel={createLabel}
            state={tabState}
            tabChange={SetTab}
          />
          <MilestoneList
            milestoneList={milestones.milestoneList}
            onDelete={deleteMilestone}
            onChange={changeMilestoneStatus}
          />
        </>
      );
      break;
    default:
      break;
  }

  return (
    <div>
      <MainHeader />
      {Mainpage}
    </div>
  );
};

export default Labels;
