#! /usr/bin/env bash 

## Question 1: Which state in 'states.tab.gz' has the lowest murder rate

states=$HOME/projects/data-sets/misc/states.tab.gz  

answer_1=$(gzcat $states \
    | grep -v '^#' \
    | cut -f1,6 \
    | sort -k2n \
    | head -n1 \
    | cut -f1 \
    | sed 's/"//g') 

echo "answer-1: $answer_1"

## Question 2: How many sequence records are in the sample.fa file?

fa=~/projects/data-sets/fasta/sample.fa

answer_2=$(cat $fa \
    | grep -v '^>' \
    | wc -l) 

echo "answer-2: $answer_2" 


