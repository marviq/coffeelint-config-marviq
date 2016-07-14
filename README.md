# coffeelint-config-marviq

Marviq's shareable coffeelint config baseline.


## Contributing

### Prerequisites

* [npm and node](https://nodejs.org/en/download/)
* [git flow](https://github.com/nvie/gitflow/wiki/Installation)
* [jq](https://stedolan.github.io/jq/download/)

Clone this repository somewhere, switch to it, then:

```bash
$ git config commit.template ./.gitmessage
$ git flow init -d
$ npm install
```

### Branching Model

This project uses [`git flow`](https://github.com/nvie/gitflow#readme).  Here's a quick [cheat sheet](http://danielkummer.github.io/git-flow-cheatsheet/).


### Commit Message Format Discipline

This project uses [`conventional-changelog/standard-version`](https://github.com/conventional-changelog/standard-version) for automatic versioning and
CHANGELOG management.

To make this work, *please* ensure that your commit messages adhere to the
[Commit Message Format](https://github.com/bcoe/conventional-changelog-standard/blob/master/convention.md#commit-message-format).  Setting your `git config` to
have the `commit.template` as referenced below will help you with [a detailed reminder](.gitmessage) of how to do this on every `git commit`.

```bash
$ git config commit.template ./.gitmessage
```

### Releasing

* Determine what your next [semver](https://docs.npmjs.com/getting-started/semantic-versioning#semver-for-publishers) `<version>` should be:
  ```bash
  $ version="<version>"
  ```

* Create and checkout a `release/v<version>` branch off of `develop`:
  ```bash
  $ git flow release start "v${version}"
  ```

* Bump the package's `version`, update the CHANGELOG, and commit these:
  ```bash
  $ npm run release
  ```

* If all is well this new `version` **should** be identical to your intended `<version>`:
  ```bash
  $ jq ".version == \"${version}\"" package.json
  ```

  *If this is not the case*, then either you assumptions about what changed are wrong, or (at least) one of your commits did not adhere to the
  [Commit Message Format Discipline](#commit-message-format-discipline); **Abort the release, and sort it out first.**

* Merge `release/v<version>` back into both `develop` and `master`:
  ```bash
  $ git flow release finish "v${version}"
  ```

* When it comes to tagging a release, `conventional-changelog/standard-version` and `git flow` do not play well together, unfortunately.  
  The `npm run release` command will already have tagged the commit it made, as `v<version>`.  
  Therefore, the `git flow release finish "v${version}"` command will claim to have tagged its merge commit into `master`, as `v<version>`, but really it 
  didn't.  
  This needs to be fixed, because tagging *is* `git flow`'s job:
  ```bash
  $ git tag -f "v${version}" master
  ```

Done.


## License

[BSD-3-Clause](LICENSE)
