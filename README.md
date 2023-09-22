# Spot Issue in CI
When a number of commits are pushing together to the repository, causing the CI to fail, it is time-consuming to manually spot which exact commit is causing the issue.

Thus, we could employ binary search concept to divide commits into chunks and run the test. Finally, we can spot the commit.

`git bisect` is a built-in function from git to perform this task.

## Repo Structure
- `run.py` - comtains a function called output_positive, which should always return positive integer

- `test.py` - contains a test to assert whether output_positive is working as expected

- `.github/workflows/python_test.yaml` - setup Github Actions to run test.py every time on push


## Repo Commit Histories

- `Add github action CI (f0db516)` is the last good commit passing CI
- `15th commit (4ba3d29)` is the first bad commit failing CI

## Spot Issue Commit Automatically
With the knowledge on commit histories, we get to know the issue should be between good and bad commit.

Thus, run git bisect. Below is a auto script:
```
./spot_issue.sh <bad_commit_hash> <good_commit_hash>
```
Example Usage:
```
./spot_issue.sh 4ba3d29 f0db516
```
It will output:
```
e92961637d68e42e9ffab969d594a3e3848a34de is the first bad commit commit e92961637d68e42e9ffab969d594a3e3848a34de Author: yuxil2 <yuxil2@andrew.cmu.edu> Date: Fri Sep 22 18:01:32 2023 -0400 12th commit (Introducing Issue) :100644 100644 
```
