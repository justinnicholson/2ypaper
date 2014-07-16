Codebook for "Adjudication without Enforcement" Dataset 

Accompanies: 

Eric Reinhardt, "Adjudication without Enforcement in GATT Disputes,"
Journal of Conflict Resolution 45:2 (April 2001), 174-195. 

See also: 

http://userwww.service.emory.edu/~erein/ 

FILES: 

awe.dta	Stata 6.0 dataset awe.csv	comma-delimited ASCII file 

For complete variable descriptions, see the published article. For
variable labels, see the Stata version of the dataset or the summary
information below. 


****************************************************************************************

Contains data from awe.dta
  obs:           298                          Data for 'Adjudication without
                                                Enforcement...', JCR 2001, Eric
                                                Reinhardt
 vars:            28                          6 Dec 2000 16:48
 size:        47,978 (99.7% of memory free)
-------------------------------------------------------------------------------
   1. case      int    %5.0g                  Case Number, Unique
   2. year      int    %6.0g                  Start year of dispute
   3. multi     byte   %6.0g                  Multilateral Dispute
   4. admit     byte   %6.0g                  Defendant admits legal liability
   5. rulp      byte   %5.0g                  Panel ruled for plaintiff
   6. ruld      byte   %5.0g                  Panel ruled for defendant
   7. duration  byte   %8.0f                  Duration of Dispute (years)
   8. concede   byte   %9.0g                  Level of concessions by
                                                defendant
   9. disc      byte   %9.0g                  Disputed policy is
                                                discriminatory
  10. ntb       byte   %9.0g                  Disputed policy includes NTB
  11. many      byte   %9.0g                  >1 kind of disputed policy
  12. panel     byte   %9.0g                  Panel established
  13. ldc1      byte   %9.0g                  Developing country plaintiff
  14. ldc2      byte   %9.0g                  Developing country defendant
  15. tradep1   float  %9.0g                  Bilateral trade over
                                                plaintiff's GDP
  16. tradep2   float  %9.0g                  Bilateral trade over
                                                defendant's GDP
  17. gdprat    float  %9.0g                  Plaintiff's GDP over sum of
                                                both's GDP
  18. ruling    byte   %9.0g                  Panel ruled
  19. ruldir    byte   %9.0g                  Direction of ruling: 1 plaint,
                                                2 mixed, 3 def
  20. sdate     int    %d                     Start Date
  21. title     str80  %80s                   Title of Case
  22. hudec     int    %6.0g                  Hudec Case ID
  23. art22ai   byte   %9.0g                  AI Art 22 Case?
  24. art23ai   int    %9.0g                  AI Art 23 Case ID
  25. stnam1    str18  %18s                   State Name, Plaintiff (St1)
  26. stnam2    str18  %18s                   State Name, Defendant (St2)
  27. stnum     int    %7.0g                  State Code, Plaintiff
  28. stnum2    int    %7.0g                  State Code, Defendant
-------------------------------------------------------------------------------
Sorted by:  sdate  case  

****************************************************************************************
case ------------------------------------------------------ Case Number, Unique
                  type:  numeric (int)

                 range:  [1,594]                      units:  1
         unique values:  298                  coded missing:  0 / 298

                  mean:   176.356
              std. dev:   145.196

           percentiles:        10%       25%       50%       75%       90%
                               30        75     149.5       224       305


year ---------------------------------------------------- Start year of dispute
                  type:  numeric (int)

                 range:  [1948,1994]                  units:  1
         unique values:  41                   coded missing:  0 / 298

                  mean:   1977.59
              std. dev:   14.2136

           percentiles:        10%       25%       50%       75%       90%
                             1954      1962      1983      1988      1992


multi ---------------------------------------------------- Multilateral Dispute
                  type:  numeric (byte)

                 range:  [0,1]                        units:  1
         unique values:  2                    coded missing:  18 / 298

            tabulation:  Freq.  Value
                           140  0
                           140  1


admit ---------------------------------------- Defendant admits legal liability
                  type:  numeric (byte)

                 range:  [0,1]                        units:  1
         unique values:  2                    coded missing:  23 / 298

            tabulation:  Freq.  Value
                           255  0
                            20  1


rulp ------------------------------------------------ Panel ruled for plaintiff
                  type:  numeric (byte)

                 range:  [0,1]                        units:  1
         unique values:  2                    coded missing:  0 / 298

            tabulation:  Freq.  Value
                           207  0
                            91  1


ruld ------------------------------------------------ Panel ruled for defendant
                  type:  numeric (byte)

                 range:  [0,1]                        units:  1
         unique values:  2                    coded missing:  0 / 298

            tabulation:  Freq.  Value
                           275  0
                            23  1


duration ------------------------------------------ Duration of Dispute (years)
                  type:  numeric (byte)

                 range:  [0,11]                       units:  1
         unique values:  10                   coded missing:  34 / 298

                  mean:   1.61742
              std. dev:   1.63883

           percentiles:        10%       25%       50%       75%       90%
                                0         1         1         2         3


concede ------------------------------------- Level of concessions by defendant
                  type:  numeric (byte)

                 range:  [1,3]                        units:  1
         unique values:  3                    coded missing:  0 / 298

            tabulation:  Freq.  Value
                           105  1
                            81  2
                           112  3


disc ---------------------------------------- Disputed policy is discriminatory
                  type:  numeric (byte)

                 range:  [0,1]                        units:  1
         unique values:  2                    coded missing:  29 / 298

            tabulation:  Freq.  Value
                           179  0
                            90  1


ntb ---------------------------------------------- Disputed policy includes NTB
                  type:  numeric (byte)

                 range:  [0,1]                        units:  1
         unique values:  2                    coded missing:  29 / 298

            tabulation:  Freq.  Value
                            47  0
                           222  1


many ----------------------------------------------- >1 kind of disputed policy
                  type:  numeric (byte)

                 range:  [0,1]                        units:  1
         unique values:  2                    coded missing:  29 / 298

            tabulation:  Freq.  Value
                           231  0
                            38  1


panel ------------------------------------------------------- Panel established
                  type:  numeric (byte)

                 range:  [0,1]                        units:  1
         unique values:  2                    coded missing:  0 / 298

            tabulation:  Freq.  Value
                           125  0
                           173  1


ldc1 --------------------------------------------- Developing country plaintiff
                  type:  numeric (byte)

                 range:  [0,1]                        units:  1
         unique values:  2                    coded missing:  2 / 298

            tabulation:  Freq.  Value
                           212  0
                            84  1


ldc2 --------------------------------------------- Developing country defendant
                  type:  numeric (byte)

                 range:  [0,1]                        units:  1
         unique values:  2                    coded missing:  2 / 298

            tabulation:  Freq.  Value
                           271  0
                            25  1


tradep1 ---------------------------------- Bilateral trade over plaintiff's GDP
                  type:  numeric (float)

                 range:  [.00009116,.35702398]        units:  1.000e-11
         unique values:  251                  coded missing:  12 / 298

                  mean:   .052236
              std. dev:   .077557

           percentiles:        10%       25%       50%       75%       90%
                          .001575   .006468   .031018   .051481   .124832


tradep2 ---------------------------------- Bilateral trade over defendant's GDP
                  type:  numeric (float)

                 range:  [.00001881,.41681567]        units:  1.000e-12
         unique values:  252                  coded missing:  11 / 298

                  mean:    .03105
              std. dev:   .058502

           percentiles:        10%       25%       50%       75%       90%
                          .000308   .001509   .014486   .035888   .055173


gdprat --------------------------------- Plaintiff's GDP over sum of both's GDP
                  type:  numeric (float)

                 range:  [.00025997,.99870652]        units:  1.000e-11
         unique values:  248                  coded missing:  17 / 298

                  mean:    .39106
              std. dev:   .366719

           percentiles:        10%       25%       50%       75%       90%
                          .008499   .049152   .231992   .749526   .947683


ruling ------------------------------------------------------------ Panel ruled
                  type:  numeric (byte)

                 range:  [0,1]                        units:  1
         unique values:  2                    coded missing:  0 / 298

            tabulation:  Freq.  Value
                           155  0
                           143  1


ruldir ------------------------------- Direction of ruling: 1 plaint, 2 mixed,
                                       3 def
                  type:  numeric (byte)

                 range:  [1,3]                        units:  1
         unique values:  3                    coded missing:  155 / 298

            tabulation:  Freq.  Value
                            91  1
                            29  2
                            23  3


sdate -------------------------------------------------------------- Start Date
                  type:  numeric daily date (int)

                 range:  [-4183,12432]                units:  1
       or equivalently:  [19jul1948,14jan1994]        units:  days
         unique values:  213                  coded missing:  0 / 298

                  mean:   6621.82 = 16feb1978 (+ 20 hours)
              std. dev:   5151.51

           percentiles:        10%       25%       50%       75%       90%
                            -1982      1043      8482     10490     11688
                        29jul1954 09nov1962 23mar1983 20sep1988 01jan1992


title ----------------------------------------------------------- Title of Case
                  type:  string (str80)

         unique values:  212                  coded missing:  0 / 298

              examples:  "Def. of "Industry" - Wine"
                         "Income Tax Legislation (DISC)"
                         "Provincial liquor boards (II)"
                         "Section 337--Aramid Fibres"

               warning:  variable has embedded blanks


hudec ----------------------------------------------------------- Hudec Case ID
                  type:  numeric (int)

                 range:  [1,207]                      units:  1
         unique values:  200                  coded missing:  63 / 298

                  mean:   100.438
              std. dev:   58.2794

           percentiles:        10%       25%       50%       75%       90%
                               21        54       102       151       183


art22ai ------------------------------------------------------- AI Art 22 Case?
                  type:  numeric (byte)

                 range:  [0,1]                        units:  1
         unique values:  2                    coded missing:  231 / 298

            tabulation:  Freq.  Value
                            10  0
                            57  1


art23ai ----------------------------------------------------- AI Art 23 Case ID
                  type:  numeric (int)

                 range:  [1,195]                      units:  1
         unique values:  174                  coded missing:  73 / 298

                  mean:   99.0044
              std. dev:   57.0375

           percentiles:        10%       25%       50%       75%       90%
                               23        54       100       146       188


stnam1 -------------------------------------------- State Name, Plaintiff (St1)
                  type:  string (str18)

         unique values:  50                   coded missing:  0 / 298

              examples:  "Canada"
                         "European Community"
                         "Spain"
                         "United States"

               warning:  variable has embedded blanks


stnam2 -------------------------------------------- State Name, Defendant (St2)
                  type:  string (str18)

         unique values:  33                   coded missing:  0 / 298

              examples:  "European Community"
                         "France"
                         "Korea, Republic of"
                         "United States"

               warning:  variable has embedded blanks


stnum --------------------------------------------------- State Code, Plaintiff
                  type:  numeric (int)

                 range:  [2,997]                      units:  1
         unique values:  50                   coded missing:  0 / 298

                  mean:   294.507
              std. dev:   360.528

           percentiles:        10%       25%       50%       75%       90%
                                2         2     147.5       390       995


stnum2 -------------------------------------------------- State Code, Defendant
                  type:  numeric (int)

                 range:  [2,995]                      units:  1
         unique values:  33                   coded missing:  0 / 298

                  mean:   411.534
              std. dev:   400.905

           percentiles:        10%       25%       50%       75%       90%
                                2         2       230       770       995

****************************************************************************************


Variable |     Obs        Mean   Std. Dev.       Min        Max
---------+-----------------------------------------------------
    case |     298    176.3557   145.1962          1        594  
    year |     298    1977.587   14.21365       1948       1994  
   multi |     280          .5   .5008953          0          1  
   admit |     275    .0727273   .2601618          0          1  
    rulp |     298    .3053691   .4613383          0          1  
    ruld |     298    .0771812   .2673277          0          1  
duration |     264    1.617424   1.638835          0         11  
 concede |     298     2.02349   .8544508          1          3  
    disc |     269    .3345725   .4727203          0          1  
     ntb |     269    .8252788   .3804362          0          1  
    many |     269    .1412639   .3489428          0          1  
   panel |     298    .5805369   .4943012          0          1  
    ldc1 |     296    .2837838   .4515966          0          1  
    ldc2 |     296    .0844595   .2785466          0          1  
 tradep1 |     286    .0522364    .077557   .0000912    .357024  
 tradep2 |     287    .0310496   .0585021   .0000188   .4168157  
  gdprat |     281    .3910604   .3667191     .00026   .9987065  
  ruling |     298    .4798658   .5004348          0          1  
  ruldir |     143    1.524476   .7583541          1          3  
   sdate |     298    6621.815   5151.506      -4183      12432  
   title |       0
   hudec |     235    100.4383   58.27938          1        207  
 art22ai |      67    .8507463   .3590278          0          1  
 art23ai |     225    99.00444   57.03754          1        195  
  stnam1 |       0
  stnam2 |       0
   stnum |     298    294.5067   360.5276          2        997  
  stnum2 |     298    411.5336   400.9052          2        995  

****************************************************************************************
