# group5_project

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
   1. `git status`
   2. PPUULLLLL (`git pull`). **ENSURE LOCAL MAIN IT UP TO DATE**

## Week 1
- Decide on a topic, source data, and perform exploratory data analysis.
- Create a repository and establish individual branches for each team member.
- Create a mockup of a machine learning model.
- Create a mockup of a database.
- Decide which technologies will be used.

### Roles:
- **Square**: The team member in the square role will be responsible for the repository.
- **Triangle**: The member in the triangle role will create a mockup of a machine learning model. This can even be a diagram that explains how it will work concurrently with the rest of the project steps.
- **Circle**: The member in the circle role will create a mockup of a database with a set of sample data, or even fabricated data. This will ensure the database will work seamlessly with the rest of the project.
- **X**: The member in the X role will decide which technologies will be used for each step of the project.
#### IMPORTANT
The X role is mandatory for teams of four and optional for teams of three.

### Rubric
<details>
   <summary>Presentation (30 points)</summary>

#### Content
The team members have drafted their project, including the following:
- Selected topic
- Reason they selected the topic
- Description of the source of data
- Questions they hope to answer with the data
#### IMPORTANT
- The content does not yet need to be in the form of a presentation. It can be text in the README.md.
</details>

<details>
   <summary>GitHub Repository (10 points)</summary>

#### Main Branch
The main branch should include:
- README.md
#### README.md
The README.md should include:
- Description of the communication protocols
#### Individual Branches
Requirements for the individual branches follow:
- At least one branch for each team member
- Each team member has at least four commits for the duration of the first segment
</details>

<details><summary>Machine Learning Model (35 points)</summary>

Team members will be expected to present a provisional machine learning model that stands in for the final machine learning model and accomplishes the following:
- Takes in data from the provisional database
- Outputs label for input data
</details>
<details><summary>Database Integration (25 points)</summary>
Team members will be expected to present a provisional database that stands in for the final database and accomplishes the following:
- Sample data that mimics the expected final database structure or schema
- Draft machine learning model is connected to the provisional database

</details>
<details><summary>Dashboard (0 points)</summary>
There are no deliverables associated with the dashboard for this segment.
</details>