# Extract Bin Data

## Background

You are working data from an Ag company.  They track livestock feed delivered by truck.
The livestock farms receive feed into bins.  The bins are usually numbered.

## High Level Instructions

Extract bin and weight information from CSV.

## Low Level Instructions

Extract bin and weight infomation.  There can be multiple bins per row in the CSV.
The weight is sometimes indicated with "T" for US ton.  Sometimes "lbs"
The weight is not always specified. NULL is the default value for weight.
For "weight_unit", consistantly use "T" for ton and "lbs" for pounds even if the words are slightly different.
This is an agriculture feed company so, you will see abbreviations such as Gest which is gestation; Lact is lactation.  You will include these abbreviations as part of the "bin" field.
The output is to be an array of JSON.
Only give the output.  Do not repeat the input.

## Examples

<Example 1>
<input>
"BIN 1, BIN 2 ",10.5
</input>
<output>
[{"bin":"1","weight":null,"weight_unit":null},{"bin":"2","weight":null,"weight_unit":null}]
</output>
</Example 1>

<Example 2>
<input>
BIN 16 15T F5 BIN 16 FIRST THING MON AM,15.0
</input>
<output>
[{"bin":"16","weight":15,"weight_unit":"T"}]
</output>
</Example 2>

<Example 3>
<input>
BINS 11&12 24T F5 12T BIN 11 AND 12T BIN 12 FOR MONDAY,24.0.
</input>
<output>
[{"bin":"11","weight":12,"weight_unit":"T"},{"bin":"12","weight":12,"weight_unit":"T"}]
</output>
</Example 3>

<Example 4>
<input>
Gest 1 - 6000 lbs    Gest 2 - 6000 lbs    PO Number: 450007    Lot: Hatteras Sow 2023,24.0
</input>
<output>
[{"bin":"Gest 1","weight":6000,"weight_unit":"lbs"},{"bin":"Gest 2","weight":6000,"weight_unit":"lbs"}]
</output>
</Example 4>

<Example 5>
<input>
4 - 30000 lbs    1 - 18000 lbs    PO Number: 451632    Lot: 054-38    691 (40 grams)    Comments: pm,24
</input>
<output>
[{"bin":"4","weight":30000,"weight_unit":"lbs"},{"bin":"1","weight":18000,"weight_unit":"lbs"}]
</output>
</Example 5>

## Data
"BIN 1, BIN 2 ",10.5
"BIN 1, BIN 2 ",10.0
"BIN 1, BIN 2 ",0.5
BIN 11 24T F2 BIN 11 FOR TUES-MONDAY THE 8TH,24.0
BINS 11&12 24T F5 12T BIN 11 AND 12T BIN 12 FOR MONDAY,24.0
BIN 1 & 2 5T NURS PH 3 3T BIN 1 AND 2T BIN 2 FOR MONDAY AM,5.0
BULK BIN BOTH LIDS WILL BE OPEN FOR MONDAY",1.0
BIN 16 15T F5 BIN 16 FIRST THING MON AM,15.0
BIN 18 9T F5 BIN 18 FOR FIRST THING MON AM,9.0
BIN 14 24T NURS PH 4 BIN 14 FOR MON/TUES,24.0
BINS 5&6 12T F3 9T BIN 6 AND 3T BIN 5 FOR MONDAY,12.0
BINS 7&8 12T F3 9T BIN 8 AND 3T BIN 7 FOR MONDAY,12.0
BIN 1 6T F1 BIN 1 FOR FIRST THING MON AM,6.0
BIN 4 6T F1 BIN 4 FOR FIRST THING MON AM,6.0
BIN 5 6T F2 BIN 5 FOR 1ST THING MON AM,6.0
Bin 1 - 24000 lbs    Bin 3 - 24000 lbs    PO Number: 450023    Lot: 015-36        Comments: replaces po 449913. this has updated diet.,24
Gest 1 - 6000 lbs    Gest 2 - 6000 lbs    PO Number: 450007    Lot: Hatteras Sow 2023,24
Lact 13 - 12000 lbs    Lact 14 - 6000 lbs    Lact 15 - 12000 lbs    Lact 16 - 6000 lbs    PO Number: 450008    Lot: Hatteras Sow 2023,24
10 - 18000 lbs    PO Number: 450788    Lot: Greenflash II 2023        Comments: needs to be clean truck,24
2 - Gest - 12000 lbs    C - Gest - 18000 lbs    PO Number: 450790    Lot: Greenflash II 2023,24
Gilt 6 - 6000 lbs    PO Number: 450881    Lot: Hatteras Sow 2023,24
Gest 2 - 6000 lbs    Gest 18 - 6000 lbs    Gest 19 - 6000 lbs    PO Number: 450883    Lot: Hatteras Sow 2023,24
Lact 13 - 18000 lbs    Lact 14 - 6000 lbs    PO Number: 450884    Lot: Hatteras Sow 2023,24
2 - 24000 lbs    4 - 24000 lbs    PO Number: 451124    Lot: 031-37,24
East Poly 2 - 24000 lbs    PO Number: 451147    Lot: Currituck Sow 2024,24
32 - Lact - 12000 lbs    PO Number: 451148    Lot: Currituck Sow 2024,24
41 - 12000 lbs    PO Number: 451149    Lot: Currituck Sow 2024,24
1 - Gest - 24000 lbs    B - Gest - 12000 lbs    PO Number: 451544    Lot: Greenflash II 2024,24
10 - 12000 lbs    PO Number: 451545    Lot: Greenflash II 2024,24
Gest 19 - 6000 lbs    PO Number: 451547    Lot: Hatteras Sow 2024,24
Lact 13 - 24000 lbs    Lact 14 - 6000 lbs    PO Number: 451549    Lot: Hatteras Sow 2024,24
Gilt 6 - 6000 lbs    PO Number: 451550    Lot: Hatteras Sow 2024,24
Bin 7 - Gest - 12000 lbs    Bin 9 - Gest - 12000 lbs    Bin 10 - Gest - 12000 lbs    PO Number: 451618    Lot: Cornerstone Sow 2024,24
Bin 16 - Lact - 12000 lbs    PO Number: 451619    Lot: Cornerstone Sow 2024,24
4 - 30000 lbs    1 - 18000 lbs    PO Number: 451632    Lot: 054-38    691 (40 grams)    Comments: pm,24
2 - 24000 lbs    4 - 24000 lbs    PO Number: 451648    Lot: 031-37    10333 (18.1 grams)    Comments:,24
3 - 12000 lbs    4 - 36000 lbs    PO Number: 451765    Lot: 209-35    691 (100 grams)    Comments:,24
West Poly 1 - 24000 lbs    PO Number: 451936    Lot: Currituck Sow 2024,24
31 - Lact - 12000 lbs    32 - Lact - 6000 lbs    PO Number: 451937    Lot: Currituck Sow 2024,24
2 - Gest - 24000 lbs    B - Gest - 24000 lbs    PO Number: 451928    Lot: Greenflash II 2024,24