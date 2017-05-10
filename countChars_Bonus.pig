A = load './in/*.txt' as (line:chararray);
B = foreach A generate flatten(TOKENIZE(REPLACE(LOWER(line),'','|'), '|')) as letter;
B = filter B by (letter=='a') or (letter=='e') or (letter=='i') or (letter=='o') or (letter=='u'); 
C = group B by letter;
D = foreach C generate group, COUNT(B);
store D into './charcountBonus/';