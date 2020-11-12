import React, { useState, useEffect } from 'react';
import styled from 'styled-components';

import Dropdown from '@atoms/Dropdown';
import { getLabels } from '@system/axios/label';
import { getUsers } from '@system/axios/user';
import { getMilestones } from '@system/axios/milestone';

const WholeWrapper = styled.div`
  display: flex;
  gap: 2em;
  width: 100%;
  background-color: #edf0f2;
  padding: 0.7em 0;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
  justify-content: space-around;
`;

const IssueListMenu = (props) => {
  const [labels, setLabels] = useState([]);
  const [users, setUsers] = useState([]);
  const [milestone, setMilestone] = useState([]);

  useEffect(() => {
    getLabels().then((res) => {
      const labelList = res.map((v) => ({ name: v.name, color: v.color }));
      setLabels(labelList);
    });
    getUsers().then((res) => {
      const userList = res.map((v) => ({ name: v.nickname }));
      setUsers(userList);
    });
    getMilestones().then((res) => {
      const milestoneList = res.map((v) => ({ name: v.title }));
      setMilestone(milestoneList);
    });
  }, []);
  // axiosLabels.default.getLabels().then((res) => setLabels(res));
  // axiosUser.default.getUsers().then((res) => setUsers(res));
  // axiosMilestone.default.getMilestone().then((res) => setMilestone(res));
  return (
    <WholeWrapper>
      <WholeWrapper />
      <WholeWrapper>
        <Dropdown name="Author" title="Filter by Author" contentList={users} />
        <Dropdown name="Labels" title="Filter by Labels" contentList={labels} />
        <Dropdown
          name="Milestone"
          title="Filter by Milestone"
          contentList={milestone}
        />
        <Dropdown
          name="Assignees"
          title="Filter by Assignees"
          contentList={users}
        />
      </WholeWrapper>
    </WholeWrapper>
  );
};

export default IssueListMenu;
