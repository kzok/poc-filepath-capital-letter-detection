# poc-filepath-capital-letter-detection

## What is this?

A bash script which detects capital letter in passed filepaths.

Sometime errors due to file path case occurs on case-sensitive file system,
although this doesn't occur on case-insensitive file system.
Therefore, it was necessary to ensure that all source code file paths were all lowercase.

## How to use?

```bash
git ls-files <glob-what-you-want-to-check> | ./detect-uppercase.sh
```

## How to test?

```bash
./test.sh
```
