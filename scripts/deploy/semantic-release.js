module.exports = {
  branches: [
    '+([0-9])?(.{+([0-9]),x}).x',
    'main',
    'next',
    'next-major',
    {name: 'beta', prerelease: true},
    {name: 'alpha', prerelease: true},
  ],
  plugins: [
    '@semantic-release/commit-analyzer',
    '@semantic-release/release-notes-generator',
    [
      "@semantic-release/changelog",
      {
        "changelogFile": "CHANGELOG.md"
      },
    ],
    [
      '@semantic-release/exec',
      {
        prepareCmd: 'echo ${nextRelease.version} > VERSION',
        publishCmd: 'mix hex.publish --yes',
      },
    ],
    [
      "@semantic-release/git",
      { 
        "assets": ["CHANGELOG.md", "VERSION"],
        "message": "chore(release): update ${nextRelease.version} changelog & version [skip ci]"
      }
    ],
  ],
};