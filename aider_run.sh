#!/bin/bash

if [ "$1" == "--help" ]; then
    echo "Usage: $(basename $0) [model]"
    echo "  model: 'o3-mini' (default), 'o1', 'r1', 'ds3', 'c3.7', 'g2.5-pro', or 'gemma327'"
    exit 0
fi

model=${1:-o3-mini}

valid_models=("o3-mini" "o1" "r1" "ds3" "c3.7" "g2.5-pro" "gemma327" "optimus")

valid=false
for v in "${valid_models[@]}"; do
  if [ "$model" == "$v" ]; then
    valid=true
    break
  fi
done

if ! $valid; then
    echo "Invalid model specified."
    echo "Usage: $(basename $0) [model]"
    echo "  model: 'o3-mini' (default), 'o1', 'r1', 'ds3', 'c3.7', 'g2.5-pro', or 'gemma327'"
    exit 1
fi

if [ "$model" == "o1" ]; then
    aider --o1-preview --architect --editor-model claude-3-5-sonnet-20241022
elif [ "$model" == "o3-mini" ]; then
    aider --model o3-mini --architect --editor-model claude-3-5-sonnet-20241022
elif [ "$model" == "r1" ]; then
    aider --model openrouter/deepseek/deepseek-r1 --architect --editor-model claude-3-5-sonnet-20241022
elif [ "$model" == "ds3" ]; then
    aider --model deepseek/deepseek-chat --architect --editor-model claude-3-5-sonnet-20241022
elif [ "$model" == "g2.5-pro" ]; then
    aider --model gemini/gemini-2.5-pro-latest --architect --editor-model claude-3-5-sonnet-20241022
elif [ "$model" == "c3.7" ]; then
    aider --model openrouter/anthropic/claude-3.7-sonnet --architect --editor-model claude-3-5-sonnet-20241022
elif [ "$model" == "gemma327" ]; then
    aider --model openrouter/google/gemma-3-27b-it --architect --editor-model claude-3-5-sonnet-20241022
elif [ "$model" == "optimus" ]; then
    aider --model openrouter/openrouter/optimus-alpha --architect --editor-model claude-3-5-sonnet-20241022
else
    echo "Invalid model specified."
    echo "Usage: $(basename $0) [model]"
    echo "  model: 'o3-mini' (default), 'o1', 'r1', 'ds3', 'c3.7', 'g2.5-pro', or 'gemma327'"
fi
