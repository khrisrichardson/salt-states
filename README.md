# krichardson/salt-states #

Hola. Welcome to my salt tree.

*A word to the wise*

Please note that while I have used a lot of the content herein in a production
setting, you are also likely to encounter some works in progress. I can make no
guarantees regarding the viability of this content in your specific environment.

Want to take any of the content herein to the next level? Great, I will accept
pull requests.

My goal in posting these states is to stop hoarding what I have done, and share
with the community in the hopes of encouraging even greater reciprocity.

Also please note that a number of the states use features only available in the
develop branch on [github](https://github.com/saltstack/salt).

I highly encourage folks to follow along on IRC and in the issues list to keep
up to date on freshly minted idiomatic ways of doing things with salt,
particularly as new core features or execution and state modules are introduced.

I have taken great pain to ensure that company sensitive data has been scrubbed
from the pillar and state trees. If you see anything amiss, I request your
immediate feedback.

Happy salting.

# Noteworthy Items #

* git pre-commit hook
* gitfs
* bootstrapping
* reactor states
* orchestrate states
* docker states
* dependence on custom roles module
* clean highstates
* interchangeable dependencies with depend-\*.sls
* orchestration with relate-\*.sls
