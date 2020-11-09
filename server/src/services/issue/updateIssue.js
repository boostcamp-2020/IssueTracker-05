import db from '@models';

export default async (updatedContent, iid) => {
  try {
    if (updatedContent) {
      // update된 내용이 존재하면, 관계 테이블 관련 내용 제외하고 issue 기본 내용 수정
      if (updatedContent.isOpen === false) {
        updatedContent.closedAt = new Date();
      }
      await db.issue.update(
        {
          ...updatedContent,
        },
        {
          where: { iid },
        },
      );

      const { labels, assignees } = updatedContent;

      // 변경된 label이나 assignees가 존재한다면
      if (labels || assignees) {
        const issue = await getTargetIssue(iid);

        // 변경된 label이 존재할 경우
        if (labels) {
          // 추가해야 할 레이블과 삭제해야 할 레이블 구분
          const [trueLabels, falseLabels] = labels.reduce(
            (acc, cur) => {
              if (cur.state) {
                delete cur.state;
                acc[0].push(cur);
              } else {
                acc[1].push(cur.name);
              }
              return acc;
            },
            [[], []],
          );
          // issue - label 관계 테이블 내 레코드 추가
          if (trueLabels.length) {
            const labelsToAdd = await db.label.findAll({
              where: {
                [db.Sequelize.Op.or]: trueLabels,
              },
            });
            await issue.addLabels(labelsToAdd, {
              through: { selfGranted: true },
            });
          }
          // issue - label 관계 테이블 내 레코드 삭제
          if (falseLabels.length) {
            await db.sequelize.models.issue_label.destroy({
              where: {
                issue_iid: iid,
                label_name: {
                  [db.Sequelize.Op.or]: falseLabels,
                },
              },
            });
          }
        }

        if (assignees) {
          // 추가해야 할 레이블과 삭제해야 할 레이블 구분
          const [trueAssignes, falseAssignes] = assignees.reduce(
            (acc, cur) => {
              if (cur.state) {
                delete cur.state;
                acc[0].push(cur);
              } else {
                acc[1].push(cur.uid);
              }
              return acc;
            },
            [[], []],
          );
          // issue - assignee 관계 테이블 내 레코드 추가
          if (trueAssignes.length) {
            const assigneesToAdd = await db.user.findAll({
              where: {
                [db.Sequelize.Op.or]: trueAssignes,
              },
            });
            await issue.addAssignees(assigneesToAdd, {
              through: { selfGranted: true },
            });
          }
          // issue - label 관계 테이블 내 레코드 삭제
          if (falseAssignes.length) {
            await db.sequelize.models.issue_assignee.destroy({
              where: {
                issue_iid: iid,
                user_uid: {
                  [db.Sequelize.Op.or]: falseAssignes,
                },
              },
            });
          }
        }
      }
      return true;
    }
  } catch (err) {
    throw new Error(err);
  }
};
