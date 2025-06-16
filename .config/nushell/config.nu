# load env:
source $"~/.config/nushell/env.nu"

# setup starship:
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")


alias core-echo   = echo
alias core-gcc    = gcc
alias core-ls     = ls
alias core-open   = open

alias ghostscript = gs
alias read        = bat

alias echo = ^echo
alias open = ^open


###############################################################################


def eza-wrapper [
    dir?: string = "",
    --all(-a)
    --long(-l)
    --tree(-t)
    --recursive(-r)
] {
    mut flags = "-"
    mut level = 0

    if ($all)  {
        $flags += "a"
    }

    if ($long) {
        $flags += "hl"
    } else {
        $flags += "x"
    }

    if ($tree) {
        $flags += "T"
        $level  = 1
    }

    if ($recursive) {
        $flags += "R"
        $level  = 2
    }

    echo ""

    if ($dir == "") {
        eza ($flags) --color=always --color-scale=all --color-scale-mode=fixed --icons=auto --level=($level) --sort=type --git --group-directories-first --hyperlink --no-permissions --no-user --total-size
    } else {
       eza ($flags) --color=always --color-scale=all --color-scale-mode=fixed --icons=auto --level=($level) --sort=type --git --group-directories-first --hyperlink --no-permissions --no-user --total-size $dir
    }
}


###############################################################################


alias ls   = eza-wrapper -a
alias ll   = eza-wrapper -al
alias lt   = eza-wrapper -alt

alias tree = cbonsai -li --time=0.1
alias sky  = astroterm -Ccu --speed 100 --fps 360 --aspect-ratio 4.0 --city Managua

alias ga  = git add
alias gb  = git branch

alias gc  = git commit -m
alias gca = git commit -am

alias gcl = git clone
alias gch = git checkout
alias gd  = git diff --output-indicator-new=' ' --output-indicator-old=' '
alias gf  = git fetch --all -t
alias gi  = git init
alias gl  = git log --all --graph --pretty=format:'%C(magenta)%h%C(white) - %an - %C(yellow)%ar%C(auto) - %D%n%s'

alias gp  = git push
alias gpl = git pull

alias gr  = git remote
alias gra = git remote add
alias grr = git remote remove
alias grv = git remote -v

alias gs  = git status --short
alias gsh = git show --pretty=format:'%C(magenta)%h%C(white) - %an - %C(yellow)%ar%C(auto) - %D%n%s'
alias gst = git stash
alias gsw = git switch


###############################################################################


def get-euler-file-name [problem_num: int] {
    mut zeroes = ""

    if ($problem_num <= 9) {
        $zeroes = "00"
    }

    if ($problem_num >= 10 and $problem_num <= 99) {
        $zeroes = "0"
    }

    return ($zeroes + ($problem_num | into string))
}


###############################################################################


def euler-cpp [problem_num: int] {
    if ($problem_num <= 0) {
        print "Invalid problem number!\n"
        return null
    }

    let file_name = (get-euler-file-name $problem_num) + ".cpp"

    let boilerplate = (
$"// Problem URL: https://projecteuler.net/problem=($problem_num)" + "
// --------------------------------------------------------------------------------
//

#include <chrono>
#include <cstdint>
#include <iostream>

#include "include/exit_routine.h"


int main() {
    auto start = std::chrono::steady_clock::now();

    auto end = std::chrono::steady_clock::now();

    exit_routine(start, end);
    return 0;
}
")

    $boilerplate | save $file_name
}


###############################################################################


def euler-py [problem_num: int] {
    if ($problem_num <= 0) {
        print "Invalid problem number!\n"
        return null
    }

    let file_name = (get-euler-file-name $problem_num) + ".py"

    let boilerplate = (
$'"""
Problem URL: https://projecteuler.net/problem=($problem_num)' + '
---------------------------------------------------------------------------------

"""

')

    $boilerplate | save $file_name
}


###############################################################################


def gcc [src_file: string] {
    mut file = $src_file

    if ($file | str contains ".c") {
        $file = $file | str replace ".c" ""
    }

    core-gcc -std=c99 -Wall -Wextra -Wpedantic -Werror -o $file ($file + ".c")
}


###############################################################################


def gpp [src_file: string] {
    mut file = $src_file

    if ($file | str contains ".cpp") {
        $file = $file | str replace ".cpp" ""
    }

    g++ -std=c++20 -Wall -Wextra -Wpedantic -Werror -o $file ($file + ".cpp")
}


###############################################################################
