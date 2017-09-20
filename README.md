# centered.vim

The idea for centered.vim grew out of both a need to jot items down while
working with him and a desire to not have to twist my head so much while
working with a wide monitor.

It is as simple as it can be to achieve these two goals. I recommend using it
alongside org-mode.


## Installation

I recommend using [Vundle](https://github.com/VundleVim/Vundle.vim).

## Setup

To get the full use of out centered.vim, you should set some variables in your
`vimrc`:


| Name                    | Description                                                                 |
| ----------------------- | --------------------------------------------------------------------------- |
| g:centered_vim_session  | Absolute path to the file in which to store your vim session, string.       |
| g:centered_offset       | How many columns to make the offset, int. Default 1/3 screen width.         |
| g:centered_scratch_pad  | Absolute path to the file you want to use as a scratch path, string.        |
