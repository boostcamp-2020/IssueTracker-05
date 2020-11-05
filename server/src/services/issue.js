import db from '@models';

const getTargetIssue = async (iid) => {
  try {
    const issue = await db.issue.findOne({
      where: { iid },
      attributes: ['iid', 'isOpen', 'title', 'content', 'createdAt', 'closedAt'],
      include: [
        {
          model: db.user,
          attributes: ['uid', 'userId', 'nickname'],
        },
        {
          model: db.comment,
          attributes: ['cid', 'content', 'createdAt'],
          include: [
            {
              model: db.user,
              attributes: ['uid', 'userId', 'nickname'],
            },
          ],
        },
        {
          model: db.user,
          attributes: ['uid', 'userId', 'nickname'],
          as: 'assignees',
          through: { attributes: [] },
        },
        {
          model: db.label,
          through: { attributes: [] },
          attributes: ['name', 'color'],
        },
        {
          model: db.milestone,
          attributes: ['mid', 'title'],
          include: [
            {
              model: db.issue,
              attributes: ['isOpen'],
            },
          ],
        },
      ],
    });
    return issue;
  } catch (err) {
    throw new Error(err);
  }
};

const getIssues = async (page) => {
  try {
    if (!page) {
      // app의 경우 client rendering
      const issues = await db.issue.findAll({
        attributes: ['iid', 'isOpen', 'title', 'createdAt', 'closedAt'],
        include: [
          {
            model: db.user,
            attributes: ['uid', 'userId', 'nickname'],
          },
          {
            model: db.comment,
            attributes: ['cid'],
          },
          {
            model: db.user,
            attributes: ['uid', 'userId', 'nickname'],
            as: 'assignees',
            through: { attributes: [] },
          },
          {
            model: db.label,
            through: { attributes: [] },
            attributes: ['name', 'color'],
          },
          {
            model: db.milestone,
            attributes: ['mid', 'title'],
            include: [
              {
                model: db.issue,
                attributes: ['isOpen'],
              },
            ],
          },
        ],
      });
      return issues;
    }
    const offset = page > 1 ? 10 * (page - 1) : 0;
    const issues = await db.issue.findAll({
      offset,
      limit: 10,
      attributes: ['iid', 'isOpen', 'title', 'createdAt, closedAt'],
      include: [
        {
          model: db.user,
          attributes: ['uid', 'userId', 'nickname'],
        },
        {
          model: db.comment,
          attributes: ['cid'],
        },
        {
          model: db.user,
          attributes: ['uid', 'userId', 'nickname'],
          as: 'assignee',
          through: { attributes: [] },
        },
        {
          model: db.label,
          through: { attributes: [] },
          attributes: ['name', 'color'],
        },
        {
          model: db.milestone,
          attributes: ['mid', 'title'],
          include: [
            {
              model: db.issue,
              attributes: ['isOpen'],
            },
          ],
        },
      ],
    });
    return issues;
  } catch (err) {
    throw new Error(err);
  }
};

const createIssue = async (issueContent, uid) => {
  try {
    const issue = await db.issue.create({
      ...issueContent,
      uid,
    });
    if (issueContent.labels) {
      const labels = await db.label.findAll({
        where: {
          [db.Sequelize.Op.or]: issueContent.labels,
        },
      });
      await issue.addLabels(labels, { through: { selfGranted: true } });
    }
    if (issueContent.assignees) {
      const assignees = await db.user.findAll({
        where: {
          [db.Sequelize.Op.or]: issueContent.assignees,
        },
      });
      await issue.addUsers(assignees, { through: { selfGranted: true } });
    }
    return issue;
  } catch (err) {
    throw new Error(err);
  }
};

const updateIssue = async (updatedContent, iid) => {
  try {
    if (updatedContent) {
      // update된 내용이 존재하면, 관계 테이블 관련 내용 제외하고 issue 기본 내용 수정
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
            await issue.addUsers(assigneesToAdd, {
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

const deleteIssue = async (iid) => {
  try {
    await db.issue.destroy({ where: { iid } });
  } catch (err) {
    throw new Error(err);
  }
};

export default {
  getTargetIssue,
  getIssues,
  createIssue,
  deleteIssue,
  updateIssue,
};
