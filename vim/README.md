vim plugins
===========

These are installed as git submodules for easier maintenance. 

To add new plugin (and run at vim start): 

  cd pack/plugins/star
  git submodule add <repo url>


Remove a submodule/plugin:

  git rm -r submodule
  rm -rf .git/modules/submodule
