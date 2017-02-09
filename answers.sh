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

## Question 3: How many unique CpG IDs are in cpg.bed.gz?

cpg=~/projects/data-sets/bed/cpg.bed.gz

answer_3=$(gzcat $cpg \
    | cut -f4 \
    | sort \
    | uniq \
    | wc -l) 

echo "answer-3: $answer_3"

## Question 4: How many sequence records are in the SP1.fq file?

SP1=~/projects/data-sets/fastq/SP1.fq

answer_4=$(cat $SP1 \
    | grep 'UMI' \
    | wc -l)

echo "answer-4: $answer_4"

## Question 5: How many words are on lines containing the word bloody in hamlet.txt?

hamlet=~/projects/data-sets/misc/hamlet.txt 

answer_5=$(cat $hamlet \
    | grep -i 'bloody' \
    | wc -w)

echo "answer-5: $answer_5" 

## Question 6: What is the length of the sequence in the first record of sample.fa? 

answer_6=$(cat $fa \
    | awk '(NR == 2){print length}') 

echo "answer-6: $answer_6" 

## Question 7: What is the name of the longest gene in genes.hg19.bed.gz?

genes=~/projects/data-sets/bed/genes.hg19.bed.gz

answer_7=$(gzcat $genes \
    | awk 'BEGIN{OFS="\t"} {print $3 - $2, $4}' \
    | sort -k1n \
    | cut -f2 \
    | tail -n1)

echo "answer-7: $answer_7" 

## Question 8: How many unique chromosomes are in genes.hg19.bed.gz?

answer_8=$(gzcat $genes \
    | cut -f1 \
    | sort \
    | uniq \
    | wc -l) 

echo "answer-8: $answer_8" 

## Question 9: How many intervals are associated with CTCF (not CTCFL) in peaks.chr22.bed.gz?

peaks=~/projects/data-sets/bed/peaks.chr22.bed.gz

answer_9=$(gzcat $peaks \
    | grep -v "CTCFL" \
    | grep "CTCF" \
    | cut -f4 \
    | wc -l)

echo "answer-9: $answer_9" 

## Question 10: On what chromosome is the largest interval in lamina.bed?

lamina=~/projects/data-sets/bed/lamina.bed

answer_10=$(cat $lamina \
    | awk 'BEGIN{OFS="\t"}{print $3-$2, $1}' \
    | sort -k1n \
    | tail -n1 \
    | cut -f2)

echo "answer-10: $answer_10" 






