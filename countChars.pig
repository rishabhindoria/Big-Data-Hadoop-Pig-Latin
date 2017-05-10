A = load './in/*.txt' as (line:chararray);
B = foreach A generate flatten(TOKENIZE(REPLACE(LOWER(line),'','|'), '|')) as letter;
C = group B by letter;
D = foreach C generate group, COUNT(B);
store D into './charcount/';