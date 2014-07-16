



/*table 5.5 model 1*/  
use "/Users/cldavis/Documents/book/JPNdata/ch5replication/JPNbarriers_timeseries.dta"
  tsset tbid year

estsimp  logit dsu  logpcon priority lnproduction lnexports MPEN_oecdtp impolicy distortion progress duration us nonoecd_tp, robust cluster(tbid) nolog

/********METI priority first difference********/

setx mean
simqi, prval(1)
setx priority 0
simqi, prval(1)
/**simulate first difference for DSU of moving from priority 0 to 1**/
simqi, fd(prval(1)) changex(priority 0 1)

/*  multinomial logistic regression for same variable specification*/
mlogit forum2  logpcon priority lnproduction lnexports MPEN_oecdtp impolicy distortion progress duration us nonoecd_tp, robust cluster(isic3) baseoutcome(1) nolog


/* adding controls similar to US model 2 for trade balance, tariffs, employment */
logit dsu  logpcon priority lnproduction lnexports bilatbal_consbn MPEN_oecdtp mpenchange EMPSH weighted_averageMFN_2dig impolicy distortion progress duration us nonoecd_tp dsu_other, robust cluster(tbid) nolog

/* estimating for sub-sample with negotiation or adjudication*/
logit dsu  logpcon priority lnproduction lnexports MPEN_oecdtp impolicy distortion progress duration us nonoecd_tp if forum2>0, robust cluster(tbid) nolog

use "/Users/cldavis/Documents/book/JPNdata/ch5replication/JPNbarriersCH5.dta"


/* Model 1 variables (omitting progress) estimated with multinomial logit for cross-section dataset*/
mlogit forum2  logpcon priority logvalue logX impolicy duration distortion  us nonoecd_tp MPEN2_oecd, robust cluster(isic3) baseoutcome(1) nolog


/*table 5.6 Model 2*/
  mlogit forum2  logpcon priority logvalue logX  impolicy duration distortion  us nonoecd_tp rdi MPEN2_oecd mpenchange2_oecd, robust cluster(isic3) baseoutcome(1) nolog

/*table 5.7 Model 3*/
mlogit forum2  logpcon priority logvalue logX  impolicy duration distortion  us nonoecd_tp simple_averageMFN_2dig dsu_other, robust cluster(isic3) baseoutcome(1) nolog


tab forum2
tab forum2 us, column chi2

