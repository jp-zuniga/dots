######################
## Custom commands! ##
######################

# alias core-gcc = gcc

def eza-wrapper [
    dir?: string = "",
    --all(-a)
    --long(-l)
    --tree(-t)
    --recursive(-r)
] {
    mut flags = "-"
    mut level = 0

    if $all  { $flags += "a" }
    if $long { $flags += "hl" } else { $flags += "x" }
    if $tree { $flags += "T"; $level = 1 }

    if ($recursive) {
        $flags += "R"
        $level  = 2
    }

    if ($dir == "") {
        # call for current directory
        eza ($flags) --color=always --color-scale=all --color-scale-mode=fixed --icons=auto --level=($level) --sort=type --git --group-directories-first --no-permissions --no-user
    } else {
        # call for given directory
       eza ($flags) --color=always --color-scale=all --color-scale-mode=fixed --icons=auto --level=($level) --sort=type --git --group-directories-first --no-permissions --no-user ($dir | str replace --all '~' $nu.home-path)
    }
}

alias ls = eza-wrapper -a
alias ll = eza-wrapper -al
alias lt = eza-wrapper -alt
alias lr = eza-wrapper -altr

###############################################################################

# def get-euler-file-name [problem_num: int] {
#     mut zeroes = ""

#     if ($problem_num <= 9) {
#         $zeroes = "00"
#     }

#     if ($problem_num >= 10 and $problem_num <= 99) {
#         $zeroes = "0"
#     }

#     return ($zeroes + $'($problem_num)')
# }

###############################################################################

# def get-euler-file-name [problem_num: int] {
#     mut zeroes = ""

#     if ($problem_num <= 9) {
#         $zeroes = "00"
#     }

#     if ($problem_num >= 10 and $problem_num <= 99) {
#         $zeroes = "0"
#     }

#     return ($zeroes + $'($problem_num)')
# }

###############################################################################

# def euler-cpp [problem_num: int] {
#     if ($problem_num <= 0) {
#         print "Invalid problem number!\n"
#         return null
#     }

#     let file_name = (get-euler-file-name $problem_num) + ".cpp"

#     let boilerplate = (
# $'// Problem URL: https://projecteuler.net/problem=($problem_num)' + '
# // -----------------------------------------------------------------------------
# //

# #include <chrono>
# #include <cstdint>
# #include <iostream>

# #include "include/exit_routine.h"


# int main() {
#     auto start = std::chrono::steady_clock::now();

#     auto end = std::chrono::steady_clock::now();

#     exit_routine(start, end);
#     return 0;
# }
# ')

#     $boilerplate | save $file_name
# }

###############################################################################

# def euler-py [problem_num: int] {
#     if ($problem_num <= 0) {
#         print "Invalid problem number!\n"
#         return null
#     }

#     let file_name = (get-euler-file-name $problem_num) + ".py"

#     let boilerplate = (
# '"""
# Problem URL: https://projecteuler.net/problem=' + $'($problem_num)' + '
# -------------------------------------------------------------------------------

# """

# from utils import timer


# def solve_' + $'($problem_num)' + '() -> None:
#     pass


# if __name__ == "__main__":
#     print(f"Execution time: {timer(solve_' + $'($problem_num)' + '):.6f}ms")
# ')

#     $boilerplate | save $file_name
# }

###############################################################################

# def gcc [src_file: string] {
#     mut file = $src_file

#     if (not ($file | str contains ".c")) {
#         $file = $file + ".c"
#     }

#     let output = $file | str replace ".c" ""

#     core-gcc -Wall -Wextra -Wpedantic -Werror -o $output $file
# }

###############################################################################

# def gpp [src_file: string] {
#     mut file = $src_file

#     if (not ($file | str contains ".cpp")) {
#         $file = $file + ".cpp"
#     }

#     let output = $file | str replace ".cpp" ""

#     g++ -Wall -Wextra -Wpedantic -Werror -o $output $file
# }

###############################################################################
