setwd("/Users/jachnika/Code/MiningSequencesWithUpliftMeasure/")
source("./algorithms/algorithms-facade.r");
source("./algorithms/generator-of-sequences/generator.r");
source("./algorithms/generator-of-sequences/generator-parameters.r");

algorithms_facade <- AlgorithmsFacade();

list_1 <- list();
list_1[[1]] <- c("a");
list_1[[2]] <- c("c");
list_1[[3]] <- c("b");
list_1[[4]] <- c("d", "e");
list_1[[5]] <- c("r");
list_1[[6]] <- c("r");
classes <- c("w", "x", "x", "x", "w", "y");
pattern_as_sequence <- Sequence(list_1, classes);

number_of_sequences <- 2000;
max_length_of_sequences <- 10;
max_length_of_item <- 3;
item_elements <- c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "r", "s", "t", "u");
classes <- c("w", "x", "y", "z");
pattern_to_include <- pattern_as_sequence;
min_support <- 0.4;
ordered_classes <- c("w", "x", "y", "z");

params <- list();
params <- GeneratorParameters(number_of_sequences, max_length_of_sequences, max_length_of_item, item_elements, classes, pattern_as_sequence, min_support);
sequences_generator <- Generator(params);
sequences <- generate_random_sequences(sequences_generator);
result <- mine_patterns(algorithms_facade, sequences, min_support, ordered_classes);

result$summary[with(result$summary, order(uplift, decreasing = T)), ] 


#without pattern
# 1     <{b}>  0.4170 0.3465207
# 2     <{c}>  0.4105 0.3387612
# 3     <{u}>  0.2455 0.3284705
# 4     <{i}>  0.4315 0.3632570
# 5     <{k}>  0.4085 0.3523488
# 6     <{d}>  0.4045 0.3661319
# 7     <{n}>  0.4185 0.3490766
# 8     <{f}>  0.4315 0.3669004
# 9     <{l}>  0.4135 0.3630734
# 10    <{m}>  0.4150 0.3512923
# 11    <{j}>  0.4235 0.3654621
# 12    <{t}>  0.4160 0.3520976
# 13    <{r}>  0.4300 0.3710934
# 14    <{p}>  0.4105 0.3527019
# 15    <{e}>  0.4175 0.3586441
# 16    <{g}>  0.4330 0.3555380
# 17    <{h}>  0.4150 0.3561116
# 18    <{o}>  0.4355 0.3568392
# 19    <{s}>  0.4340 0.3389987
# 20    <{a}>  0.2510 0.3412970


#with pattern
# 1                      <{a}>  0.4140 0.4558870
# 2                      <{c}>  0.5365 0.4504645
# 3                      <{b}>  0.5340 0.4585001
# 4                      <{d}>  0.5445 0.4330704
# 5                      <{r}>  0.5320 0.4456574
# 6                      <{g}>  0.3500 0.1410989
# 7                      <{k}>  0.3400 0.1577986
# 8                      <{l}>  0.3540 0.1478940
# 9                      <{s}>  0.3550 0.1741784
# 10                     <{h}>  0.3295 0.1327254
# 11                     <{i}>  0.3370 0.1466538
# 12                     <{o}>  0.3530 0.1547609
# 13                     <{n}>  0.3525 0.1568608
# 14                     <{e}>  0.3395 0.1751496
# 15                     <{f}>  0.3300 0.1653324
# 16                     <{p}>  0.3390 0.1573574
# 17                     <{j}>  0.3670 0.1656702
# 18                     <{m}>  0.3385 0.1579843
# 19                     <{t}>  0.3505 0.1370526
# 20                 <{a},{c}>  0.2485 0.5143435
# 21                 <{a},{b}>  0.2485 0.5096541
# 22                 <{a},{d}>  0.2515 0.5123116
# 23                 <{a},{r}>  0.2525 0.5192688
# 24                 <{c},{b}>  0.2880 0.4653753
# 25                 <{c},{d}>  0.2905 0.4733680
# 26                 <{c},{r}>  0.2815 0.4719745
# 27                 <{b},{d}>  0.2955 0.4584584
# 28                 <{b},{r}>  0.2870 0.4776060
# 29                 <{d},{r}>  0.2830 0.4814401
# 30                 <{r},{r}>  0.2845 0.4649335
# 31             <{a},{c},{b}>  0.2105 0.5623767
# 32             <{a},{c},{d}>  0.2065 0.5710517
# 33             <{a},{c},{r}>  0.2070 0.5708403
# 34             <{a},{b},{d}>  0.2105 0.5588928
# 35             <{a},{b},{r}>  0.2110 0.5639210
# 36             <{a},{d},{r}>  0.2095 0.5774237
# 37             <{a},{r},{r}>  0.2135 0.5652648
# 38             <{c},{b},{d}>  0.2170 0.5548375
# 39             <{c},{b},{r}>  0.2180 0.5518020
# 40             <{c},{d},{r}>  0.2175 0.5529947
# 41             <{c},{r},{r}>  0.2150 0.5488076
# 42             <{b},{d},{r}>  0.2205 0.5531993
# 43             <{b},{r},{r}>  0.2155 0.5617053
# 44             <{d},{r},{r}>  0.2140 0.5559202
# 45         <{a},{c},{b},{d}>  0.2025 0.5800921
# 46         <{a},{c},{b},{r}>  0.2025 0.5800921
# 47         <{a},{c},{d},{r}>  0.2010 0.5863735
# 48         <{a},{c},{r},{r}>  0.2025 0.5819343
# 49         <{a},{b},{d},{r}>  0.2030 0.5816949
# 50         <{a},{b},{r},{r}>  0.2015 0.5879775
# 51         <{a},{d},{r},{r}>  0.2005 0.5884928
# 52         <{c},{b},{d},{r}>  0.2045 0.5827907
# 53         <{c},{b},{r},{r}>  0.2015 0.5861222
# 54         <{c},{d},{r},{r}>  0.2015 0.5824118
# 55         <{b},{d},{r},{r}>  0.2025 0.5837765
# 56     <{a},{c},{b},{d},{r}>  0.2010 0.5863735
# 57     <{a},{c},{b},{r},{r}>  0.2000 0.5887500
# 58     <{a},{c},{d},{r},{r}>  0.2000 0.5887500
# 59     <{a},{b},{d},{r},{r}>  0.2000 0.5887500
# 60     <{c},{b},{d},{r},{r}>  0.2000 0.5887500
# 61 <{a},{c},{b},{d},{r},{r}>  0.2000 0.5887500