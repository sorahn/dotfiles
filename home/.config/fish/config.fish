set fish_greeting

set -x EDITOR nvim
set -x GREP_COLOR "1;37;45"
set -x JRUBYOPT "-Xcext.enabled=true"
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
set -x RBENV_ROOT /usr/local/var/rbenv
set -x RBXOPT -X19

# Paths
test -d /usr/local/share/npm/bin ; and set PATH /usr/local/share/npm/bin $PATH
test -d /usr/local/racket/bin    ; and set PATH /usr/local/racket/bin $PATH
test -d /usr/local/heroku/bin    ; and set PATH /usr/local/heroku/bin $PATH
test -d /usr/local/sbin          ; and set PATH /usr/local/sbin $PATH
test -d /usr/local/bin           ; and set PATH /usr/local/bin $PATH
test -d ~/.cabal/bin             ; and set PATH ~/.cabal/bin $PATH

test -d ~/Projects/uniiverse/boxoffice/bin     ; and set PATH ~/Projects/uniiverse/boxoffice/bin $PATH
test -d ~/Projects/uniiverse/tracker/bin       ; and set PATH ~/Projects/uniiverse/tracker/bin $PATH
test -d ~/Projects/uniiverse/elasticsearch/bin ; and set PATH ~/Projects/uniiverse/elasticsearch/bin $PATH

# Navigation
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end
function l     ; tree --dirsfirst -aFCNL 1 $argv ; end
function ll    ; tree --dirsfirst -ChFupDaLg 1 $argv ; end

# Utilities
function a        ; command ag --ignore=.git --ignore=log --ignore=tags --ignore=tmp --ignore=vendor --ignore=spec/vcr $argv ; end
function b        ; bundle exec $argv ; end
function c        ; pygmentize -O style=monokai -f console256 -g $argv ; end
function d        ; du -h -d=1 $argv ; end
function df       ; command df -h $argv ; end
function digga    ; command dig +nocmd $argv[1] any +multiline +noall +answer; end
function f        ; foreman run bundle exec $argv ; end
function g        ; git $argv ; end
function grep     ; command grep --color=auto $argv ; end
function httpdump ; sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E "Host\: .*|GET \/.*" ; end
function ip       ; curl -s http://checkip.dyndns.com/ | sed 's/[^0-9\.]//g' ; end
function localip  ; ipconfig getifaddr en0 ; end
function lookbusy ; cat /dev/urandom | hexdump -C | grep --color "ca fe" ; end
function mp       ; nvim $argv ; end
function rkt      ; racket -il xrepl $argv ; end
function tmux     ; command tmux -2 $argv ; end
function tunnel   ; ssh -D 8080 -C -N $argv ; end
function view     ; nvim -R $argv ; end
function vp       ; nvim $argv ; end


# Completions
function make_completion --argument-names alias command
    echo "
    function __alias_completion_$alias
        set -l cmd (commandline -o)
        set -e cmd[1]
        complete -C\"$command \$cmd\"
    end
    " | .
    complete -c $alias -a "(__alias_completion_$alias)"
end

make_completion b 'bundle exec'
make_completion f 'foreman run'
make_completion g 'git'
make_completion mp 'vim'
make_completion vp 'vim'

# rbenv
if test -d $RBENV_ROOT
  set PATH $RBENV_ROOT/bin $PATH
  set PATH $RBENV_ROOT/shims $PATH
  rbenv rehash >/dev/null ^&1
end


# functions added by daryl
function repro    ; . ~/.config/fish/config.fish ; end
function s        ; sublime_text $argv ; end

# Git Helpers
function gst      ; git status ; end
function gps      ; git push origin head $argv ; end
function dev      ; git_dev_branch $argv ; end
function idnoc    ; nti (git dnoc $argv) ; end
function idnocc   ; idnoc --cached ; end
function idnom    ; idnoc master ; end
function idiff    ; git diff --color $argv | sed -E "s/^([^-+ ]*)[-+ ]/\\1/" | cat ; end
function nid      ; npm i $argv -D
function nis      ; npm i $argv -s

# Functions for work
function devel    ; naiad_tds_connect $argv ; end
function j        ; naiad_jump $argv ; end
function use      ; naiad_proxy $argv ; end
function using    ; naiad_which_proxy ; end
function nti      ; naiad_tds_install $argv ; end
function ntc      ; naiad_tds_copy $argv ; end
function sag      ; ag -G ".utf8" $argv ; end

function fuck -d 'Correct your previous console command'
    set -l exit_code $status
    set -l eval_script (mktemp 2>/dev/null ; or mktemp -t 'thefuck')
    set -l fucked_up_commandd $history[1]
    thefuck $fucked_up_commandd > $eval_script
    . $eval_script
    rm $eval_script
    if test $exit_code -ne 0
        history --delete $fucked_up_commandd
    end
end


rvm default
