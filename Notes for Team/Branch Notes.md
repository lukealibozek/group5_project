## Branch-Related Commands

1. Create **new** branch: `git checkout -b [branch name]`
2. Check working branch: `git status`
3. Change branch: `git checkout [branch name]`
4. **First push to branch** - "set the remote as upstream": `git push --set-upstream origin [branch name]`
   1. (git will auto suggest this line of code - no need to remember)

#### IMPORTANT - Overarching process
1. Ensure main is up to date locally (git status)
2. Create new branch, or use existing branch (`git checkout`)
3. Make changes, `add` `commit` `push` to branch
4. Create pull requests - approve, merge, etc.
5. **IMPORTANT** - switch back to main locally (`git checkout main`) 
   1. `git status` (if outdated, will be no updates found)
   2. `git pull` **ENSURE LOCAL "MAIN" IS UP TO DATE**

## If Branch out of date
1. `git checkout [your_branch]`
2. `git merge main`