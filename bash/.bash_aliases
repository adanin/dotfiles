export HISTCONTROL=ignoreboth

# Useful aliases
alias ll='ls -l'
alias l='ll -a'
alias grep='grep --color=auto'
alias git-sudo="GIT_SSH='$HOME/.ssh/git-sudo' git"

# SSH aliases
alias sshi='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
fixsssock() { export SSH_AUTH_SOCK="$(find /tmp -uid $(id -u) -name 'agent.*' -type s 2>/dev/null|head -1)" }

# GIT aliases
alias g=git
git config --global alias.co checkout
git config --global alias.com 'checkout origin/master'
git config --global alias.b branch
git config --global alias.ba 'branch -a'
git config --global alias.ci commit
git config --global alias.s status
git config --global alias.f 'fetch --prune'
git config --global alias.l "log --topo-order --graph '--pretty=format:%h %Cgreen %cr %x1b[33m %an %Creset %s'"
git config --global alias.l1 "log --topo-order --graph '--pretty=format:%h %Cgreen %cr %x1b[33m %an %Creset %s' -1"
git config --global alias.l5 "log --topo-order --graph '--pretty=format:%h %Cgreen %cr %x1b[33m %an %Creset %s' -5"
git config --global alias.l0 "log --topo-order --graph '--pretty=format:%h %Cgreen %cr %x1b[33m %an %Creset %s' -10"
git config --global alias.d diff
git config --global alias.dc 'diff --cached'

# Salt shortcuts
SALT_LOG_DOMAIN=`hostname -d`
function slt()(mv /tmp/salt.log /tmp/salt.log.1 2>/dev/null; salt --state-output=changes -lerror "$@" 2>&1 |tee /tmp/salt.log;GREP_COLORS='sl=32:ms=32' grep -E '^\s*(Summary|Failed|Succeeded|[a-z0-9A-Z.-]*.'${SALT_LOG_DOMAIN}':)' /tmp/salt.log; GREP_COLORS='sl=31:ms=31' grep -G ERROR /tmp/salt.log)

