# Edffectively Project
Keep calm and work on Project Capstone

<h2>Edffectively Philosophy</h2>
Keep it simple don't create a complex solution when a simple one will do.
Work iteratively do the simplest thing first, then add more
Keep moving forward don't get bogged down, if you're stuck move on to something else and come back to it
Ask for help if you don't understand something or not sure on how a feature work, ask for help
Development Process
<h2>1. Grab Task</h2>
Go to the jira board (https://videdu.atlassian.net/jira/software/projects/VID/boards) and grab a task off the list, assign it to yourself and move into the in progress column

<h2>2. Create a new branch off master</h2>
Create a new branch titled after the feature with the JIRA task number example: git checkout -b feature/EFE-99-<optional title> or with git 2.23 use git switch -c feature/EFE-88

<h2>3. Code</h2>
Make your code changes

Clean up - Don't leave your code a mess, remove extraneous commments and debugging code.
Write unit test - Make sure you have good test coverage on the logic that you have created.
Leave good comments - to explain diffecult logic or why a decision was made.
Test it out - don't commit untested changes, open a browser and run your changes.
<h2>4. Create Pull Request</h2>
When your code is ready, create a PR, name it the JIRA number (e.g. EFE-31) and in the PR description, write a brief overview of the changes

<h2>5. Review</h2>
After your PR has been created, it will be reviewed by DecoPac Dev Team (Randy or Todd). PR should have at minimum 1 approval and will be merged by DecoPac Dev Team.

<h2>Project Setup</h2>

Download Ruby v 2.6 https://www.ruby-lang.org/en/downloads/
<br/>
Installing Node.js https://nodejs.org/en/download/
<br/>
Yarn https://classic.yarnpkg.com/en/docs/install#windows-stable
<br/>
Installing Rails
<br/>
To install Rails, use the gem install command provided by RubyGems: gem install rails 
<br/>
Go to project terminal: bundle install => rails server
To see your application in action, open a browser window and navigate to http://localhost:3000


