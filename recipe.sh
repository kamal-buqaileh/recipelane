#!/bin/bash

set -e # Exit on errors

if [ -n "$TMUX" ]; then
  export NESTED_TMUX=1
  export TMUX=''
fi

if [ ! $RECIPE_DIR ]; then export RECIPE_DIR=$HOME/workspace/recipelane; fi

cd $RECIPE_DIR

tmux new-session  -d -s Recipe
tmux set-environment -t Recipe -g RECIPE_DIR $RECIPE_DIR

tmux new-window      -t Recipe  -n 'Web'
tmux send-key        -t Recipe  'cd $RECIPE_DIR'                            Enter 'rails s'                                   Enter

tmux new-window      -t Recipe -n 'Console'
tmux send-key        -t Recipe 'cd $RECIPE_DIR'                             Enter 'rails c'                                   Enter

tmux new-window      -t Recipe -n 'Database'
tmux send-key        -t Recipe 'cd $RECIPE_DIR'                             Enter 'psql recipey_lane_development'             Enter

tmux new-window      -t Recipe -n 'Guard'
tmux send-key        -t Recipe 'cd $RECIPE_DIR'                             Enter 'bundle exec guard'                         Enter

tmux new-window      -t Recipe -n 'vim'
tmux send-key        -t Recipe 'cd $RECIPE_DIR'                             Enter 'vim .'                                     Enter

if [ -z "$NESTED_TMUX" ]; then
  tmux -2 attach-session -t Recipe
else
  tmux -2 switch-client -t Recipe
fi
