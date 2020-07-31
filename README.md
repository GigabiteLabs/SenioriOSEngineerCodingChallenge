# SenioriOSEngineerCodingChallenge
A coding challenge for prospective Senior iOS Developers applying for a role on the GigabiteLabs iOS developer team.

### Table of Contents

- [Submission Details and Evaluation Criteria](#submission-details-and-evaluation-criteria)
	- [Preparing Your Local Env](#preparing-your-local-env)
	- [Assignment](#assignment)
	- [Evaluation & Scoring](#evaluation-scoring)
		- [Scoring](#scoring)
	- [Goals](#goals)
- [CI/CD Automated Testing of Submissions](#ci-cd-automated-testing-of-submissions)
- [Dev Team Swift/iOS Documentation Standards](#dev-team-swift-ios-documentation-standards)
- [Signed Commits with GPG](#signed-commits-with-gpg) (Required) 

## Submission Details and Evaluation Criteria
### Preparing Your Local Env

- Make sure you have [enabled signed commits with a PGP key](#signed-commits-with-gpg) on any machine you use during your submission. 
	- 100% signed commits are required for any submission to be evaluated.
- Check your local version of Xcode
	- The very **latest release version** of Xcode is required.
		- Beta versions of Xcode should **not** be used.
- Check your local swift version.
	- **Swift version 5.2 (or higher)** is required
- The targeted iOS version for any submission should be **iOS 13.0**

In general, make sure to double check your project settings. 

There is a starter project with some of this configured already, but you’ll need to make sure the final matches the requirements.

### Assignment
In order to ensure every assignment is alloted the same amount of time & that evaluation is fair, the assignment will only be provided directly via DM or email as a PDF document. 

**Note:**
You are to include this PDF in the root directory of your submission branch. Please do not change the filename.

### Evaluation & Scoring
During the completion of this challenge, you will be expected to demonstrate experience with several technologies that are key components of our application development workflow, and that you will work with every day on our team. 

You will also demonstrate a more general mastery of advanced software development & application development concepts in Swift for Apple platforms. 

#### Scoring
**30 Points**: Meeting of the goals enumerated in the “Goals” section below. 

- There are exactly 30 child bullets within 5 parent bullets in the Goals section below. They are added up as follows: 
	- 1 point if fully met
	- .5 if not fully met but attempted
	- 0 if not met and not attempted. 

**50 Points**: Attention to detail & careful following of assignment instructions (including submission). These are graded all-or-nothing.

- **20 pts**: Following Github instructions as specififed, including branch naming conventions, inclusion of all files and folders, properly using draft PRs and proper opening of PR with review request.

- **15 pts**: All assignment criteria including features & technologies are present in submission.
	- Assignment criteria will be enumerated
	- each bullet represents 1 requirement
	- partial points for this category will be awarded by divding 20pts by the number of requirements on the assignment. (ex: 10 requirements == 2pts each)
- **5 pts**: Basic security hygiene is practiced without exception, including:
	- All commits are verified using PGP signatures. See this guide to setup your local machine for signed commits.
	- No authentication credentials or API keys are hard-coded in the submission project or framework example project (use env vars for your submission).
	- No hard-coded URLs (use env vars for your submission).
	- No blanket enablement of arbitrary loads (don’t change default NSTransportation Security settings to blanket-allow HTTP requests)
	- Any insecure HTTP domains used are specifically whitelisted / enumerated in info.plist

- **10 pts**: Documentaion
	- **5pts**: All public types, functions, vars, classes, extensions, etc are documented using standard swift documentation and according to our dev team documentation standards.
	- **5pts**: All private types, functions, vars, classes, extensions, etc are documented using standard swift documentation and according to our dev team documentation standards.

**20pts**: On-time submission from the moment of your submission branch is created (see the assignment for the submission time window). This is all-or-nothing, any late submission gets 0pts in this grading category.


**Total:** 100 possible points

## CI/CD Automated Testing of Submissions 
All submissions will statically analyzed using a service called [CodeBeat](https://codebeat.io), and unit tested using [Travis](https://travis-ci.io)

 - Both Static Analysis & Unit Tests are required to pass before a submission will be evaluated.
- Code coverage is required to be at 95% or higher before a submission will be evaluated.
- All submissions evaluated using automated tools use the same sets of rules and commands for all assignments.

Pointers:

- Submit your first PRs for the submission as draft PRs so we know not to review them yet
- When you want to trigger tests without submitting yet, push updates on your open draft PR, each push will re-trigger the tests
- Ensure your tests are passing locally as a first step towards ensuring that automated tests will pass
	- There is no secret sauce in the Travis automated tests, they are simply going to run the following commands, which you can also run locally:
		- Swift Package Tests
			- cd “$PROJECT_ROOT”; swift build && swift test
		- Cocoapod tests
			- cd “$PROJECT_ROOT”; pod lib test
	- Static analysis cannot be run locally using CodeBeat, but the outcome report will be accessible to the public, and you will be given a comprehensive overview of the composition of the score, what can be improved, and what specific issues were found
- Use the static analysis report from CodeBeat to inform you as you look to improve the static analysis score, or resolve a failing static analysis.

## Dev Team Swift/iOS Documentation Standards

We use the standard Swift documentation approach supported in Xcode and used by Apple, however, we do have some sytlistic standards that you should adopt for your submission:

- Do not use Pragma / Mark at all
- Triple slashes > block documentation

**Why not block documentaion?**

- Harder to skim & read than triple slashes because it doesn’t stand out on the left margin of the file
- Harder to format when writing documentation than triple slashes
- It is fully compatible with [Jazzy](https://github.com/realm/jazzy) which we use to auto-generate internal documentation for development team reference.
- Because this is our standard on all existing projects, consistency is a major factor when making standardization decisions
- It perfectly suits our needs now and is the most likely to continue suiting our needs in the future.

**Why not Pragma / Mark?**

- If you never developed with Obj-C (most new / junior devs), it is entirely unclear what Pragma / Mark even means, it’s a very arcane tool at this point in history
- Pragma / Mark will probably not live as long as Swift doc, given the shift to Swift on an industry-level
- We want to avoid having to edit all of our code documentaion if support is ever dropped for it by Apple or [Jazzy](https://github.com/realm/jazzy).


**Standard Formatting Example**
See this Example for the most common Swift doc features we use, the formatting approach, and ordering:

```swift
/// Greets the user by name, as a function.
///
/// - Precondition: The user must have a name
///
/// - Parameters:
///		- name: `String`, representing the name
/// 	of the person the function should greet.
///
/// - Returns: `String`, the greeting interpolated 
/// with the value of the `name` argument.
///
/// - Note: Functions are very conversational
/// and friendly if you get to know them.
///
/// - Warning: Don’t mention ternary operators
/// or computed properties to a function, they 
/// get very jealous.
///
func aFunc(name: String) -> String {
	return “hello \(name), I am a function.”
}
```

**Additional Info**

Notes:

- The ordering above is the exact ordering you should use in your documentation, in descending order as demonstrated.
- The sections for `Precondition`, `Note`, and `Warning` are not always required or necessary, but definitely use them if they are.

Tips:

- Your documentation changes and updates should reflect in realtime when you access the QuickHelp menu
	- Right click a function signature, class / object definition, or variable
	- Click “QuickHelp” to see your documentation.


## Signed Commits with GPG

Before you commit anything to your submission branch, setup / verify your local config of PGP signed commits. 

**No submission will be evaluated unless all commits in the submission are signed.**

### GPG Key Config for Signed Commits

Signed commits are required on commits to our private & public repositories for security reasons. 

If you are unfamilar with signed commmits, following are common local config scenarios that you might face: 
- GPG is not installed (not installed by default in macOS)
- You have GPG but you don't have a key
- You added a key but it still is not working. 

Here are some steps to get up and running:

### Install and configure GPG

Here is a [handy guide](https://help.github.com/en/github/authenticating-to-github/generating-a-new-gpg-key).

Here is a TL;DR:

- install gpg with: brew install gpg
- make sure it is on your path: which gpg
- cat the config file with: cat ~/.gnupg/gpg.conf

If the file contains a line that says "no tty"

- comment out the line that says no tty

#### Create a new GPG key

Generate a new local / private key:

- `gpg --full-generate-key`
- select default RSA by hitting enter
- choose key size value of 4096 (required size)
- choose an expiration date time frame (0 for never expires)
- Enter your real name (same as on Github account)
- enter your email (MUST be same verified email as Github account)
- no comment is required
- enter O to Okay
- create a super secure password that you will remember

**Generate a public key**

Follow instructions from step 10 onwards carefully
Don't forget that once your GPG Key is copied, you need to add it to [your GitHub account's keys](https://github.com/settings/keys)

**Configure Git to use your key**

Tell Git about your key by running:

- `gpg --list-secret-keys --keyid-format LONG`
- `copy the bit after the rsa/4096, this is your key ID`

Output EX: "rsa4096/B7DCATDOGDFFAABB"

"B7DCATDOGDFFAABB" is the ID from the output.

Now, run:

- `git config --global user.signingkey ${COPIED ID}`

**Common issues & Trouble Shooting**

1. Error seen when Generating a new GPG key:

`gpg: Sorry, no terminal at all requested - can't get input`

Resolution: [check out this post](https://stackoverflow.com/questions/38659198/gpg-sorry-no-terminal-at-all-requested-cant-get-input)

2. When setting up a local env:
	- Git doesn't seem to know about the GPG key by default, even after you tell git about it or used it before
	- Commiting after some period of time requires password re-entry

Check out [this post first and install Pinentry for mac](https://stackoverflow.com/a/44831628). 

Pinentry will manage your GPG authentication and will only require you to use your password one time and handle it from then on out.

3. Git STILL doesn't seem to know about the GPG key by default, even after you tell git about it and installed pinentry

The reason for this is probably because GPG was never run before, so it didn't have the password to sign the commit.
`cd` to the root of your repo and pick a random harmless file like LICENSE

- run `gpg --sign LICENSE`
- enter your password
- re-run `git commit -m "something"`
- remove LICENSE.gpg (it generates a new file, no need to commit it)
- If above doesn't fix it, try the answer suggested on this stackoverflow post


**Links & References**

- [Install Pinentry for macOS](https://stackoverflow.com/a/44831628)
- [Generating a new GPG key](https://help.github.com/en/github/authenticating-to-github/generating-a-new-gpg-key)
- [gpg: Sorry, no terminal at all requested - can't get input](https://stackoverflow.com/questions/38659198/gpg-sorry-no-terminal-at-all-requested-cant-get-input)
- [Telling Git about your signing key](https://help.github.com/en/github/authenticating-to-github/telling-git-about-your-signing-key)

