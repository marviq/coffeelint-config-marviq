# coffeelint-config-marviq

Marviq's shareable coffeelint config baseline.


## Contributing

### Prerequisites

* [npm and node](https://nodejs.org/en/download/)
* [git flow](https://github.com/nvie/gitflow/wiki/Installation)
* [jq](https://stedolan.github.io/jq/download/)


### Setup

Clone this repository somewhere, switch to it, then:

```bash
$ git config commit.template ./.gitmessage
$ git flow init -d
$ npm install
```

This will:
  * Setup [a helpful reminder](.gitmessage) of how to make [a good commit message](#commit-message-format-discipline).  If you adhere to this, then a detailed,
    meaningful [CHANGELOG](CHANGELOG.md) can be constructed automatically.
  * Setup the git flow [branching model](#branching-model) and checkout the `develop` branch.
  * Install all required dependencies.


### Commit

#### Branching Model

This project uses [`git flow`](https://github.com/nvie/gitflow#readme).  Here's a quick [cheat sheet](http://danielkummer.github.io/git-flow-cheatsheet/).


#### Commit Message Format Discipline

This project uses [`conventional-changelog/standard-version`](https://github.com/conventional-changelog/standard-version) for automatic versioning and
[CHANGELOG](CHANGELOG.md) management.

To make this work, *please* ensure that your commit messages adhere to the
[Commit Message Format](https://github.com/bcoe/conventional-changelog-standard/blob/master/convention.md#commit-message-format).  Setting your `git config` to
have the `commit.template` as referenced below will help you with [a detailed reminder](.gitmessage) of how to do this on every `git commit`.

```bash
$ git config commit.template ./.gitmessage
```


### Release

* Determine what your next [semver](https://docs.npmjs.com/getting-started/semantic-versioning#semver-for-publishers) `<version>` should be:
  ```bash
  $ version="<version>"
  ```

* Create and checkout a `release/v<version>` branch off of `develop`:
  ```bash
  $ git flow release start "v${version}"
  ```

* Bump the package's `.version`, update the [CHANGELOG](./CHANGELOG.md), commit these, and tag the commit as `v<version>`:
  ```bash
  $ npm run release
  ```

* If all is well this new `version` **should** be identical to your intended `<version>`:
  ```bash
  $ jq ".version == \"${version}\"" package.json
  ```

  *If this is not the case*, then either your assumptions about what changed are wrong, or (at least) one of your commits did not adhere to the
  [Commit Message Format Discipline](#commit-message-format-discipline); **Abort the release, and sort it out first.**

* Merge `release/v<version>` back into both `develop` and `master`, checkout `develop` and delete `release/v<version>`:
  ```bash
  $ git flow release finish -n "v${version}"
  ```

  Note that contrary to vanilla `git flow`, the merge commit into `master` will *not* have been tagged (that's what the
  [`-n`](https://github.com/nvie/gitflow/wiki/Command-Line-Arguments#git-flow-release-finish--fsumpkn-version) was for). This is done because `npm run release`
  has already tagged its own commit.

  I believe that in practice, this won't make a difference for the use of `git flow`; and ensuring it's done the other way round instead would render the use
  of `conventional-changelog` impossible.


### Publish

```bash
git checkout v<version>
npm publish
git checkout develop
```


## License

[BSD-3-Clause](LICENSE)
