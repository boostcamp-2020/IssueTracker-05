import { Strategy as GitHubStrategy } from 'passport-github2';

import db from '@models';

export default new GitHubStrategy({
    clientID: 'e758c990cb720ff3ea40',
    clientSecret: '523103e1b6864e153386bc927c9ddaad78580c47',
    callbackURL: 'http://localhost:5000/api/login/github/callback'
  },
  async (accessToken, refreshToken, profile, done) => {
    const user = await db.user.findOrCreate({ 
      where : { 
        userId: profile.id,
        resourceServer: profile.provider,
        nickname: profile.username,
        OAuth: true,
      }
    });
    return done(null, user);
  }
);