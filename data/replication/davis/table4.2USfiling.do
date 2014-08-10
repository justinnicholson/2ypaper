tsset[panelvar, timevar]

log using filinganalysis.log, replace


tsset tbid year

/* final models for table 4.2*/

/*model 1 population-averaged fe*/
 xtlogit dsu_file  lnpolcon active301  lnprod lnworldX mpen_oecd impolicy distortion progress duration eu japan mexico korea nonoecd   , pa vce(robust)  nolog

/*model 2 population-averaged fe, additional economic controls*/

xtlogit dsu_file  lnpolcon active301  lnprod  lnworldX mpenchange mpen_oecd empshare empshare_na balance2_consbn  simple_averageMFN_2dig impolicy distortion progress duration eu japan mexico korea nonoecd  , pa vce(robust) nolog

/*model 3 random effects*/
  xtlogit dsu_file  lnpolcon active301  lnprod  lnworldX mpenchange mpen_oecd empshare empshare_na balance2_consbn  simple_averageMFN_2dig impolicy distortion progress duration nonoecd  , re nolog


/*trade barrier data description*/
 quietly xtlogit dsu_file  lnpolcon active301  lnprod lnworldX mpen_oecd impolicy distortion progress duration eu japan mexico korea nonoecd   , pa vce(robust)  nolog

 xtsum tbid if e(sample)==1
  sum duration_total if e(sample)==1


/* partisan polcon */
 xtlogit dsu_file  lnpolcondem active301  lnprod lnworldX mpen_oecd impolicy distortion progress duration eu japan mexico korea nonoecd   , pa vce(robust)  nolog

 xtlogit dsu_file  lnpolconrep active301  lnprod lnworldX mpen_oecd impolicy distortion progress duration eu japan mexico korea nonoecd   , pa vce(robust)  nolog

correlate polconrep polcondem if e(sample)==1

/* organization (industry association count replacing contributions)*/
  
 xtlogit dsu_file  isicassn active301  lnprod lnworldX mpen_oecd impolicy distortion progress duration eu japan mexico korea nonoecd   , pa vce(robust)  nolog


/*industry concentration control variable*/
 
xtlogit dsu_file  lnpolcon active301  lnprod lnworldX mpen_oecd impolicy distortion progress duration eu japan mexico korea nonoecd lnhhi_2dig , pa vce(robust)  nolog


/**FDI control variable: US FDI outflow by industry*/

xtlogit dsu_file  lnpolcon active301  lnprod lnworldX mpen_oecd impolicy distortion progress duration eu japan mexico korea nonoecd outflow_cons , pa vce(robust)  nolog

 

/**FDI control variable:US outflow to partner*/
xtlogit dsu_file  lnpolcon active301  lnprod lnworldX mpen_oecd impolicy distortion progress duration eu japan mexico korea nonoecd outfdi_un_cons , pa vce(robust)  nolog




/*US employment share*/

xtlogit dsu_file  lnpolcon active301  lnprod lnworldX mpen_oecd impolicy distortion progress duration eu japan mexico korea nonoecd EMPSH_US , pa vce(robust)  nolog



/**negotiation-DSU sample**/

 xtlogit dsu_file  lnpolcon active301  lnprod lnworldX mpen_oecd impolicy distortion progress duration eu japan mexico korea nonoecd if action==1  , pa vce(robust)  nolog

/*rare events logit*/
  
/*mlogit*/

mlogit forum  lnpolcon active301  lnprod lnworldX mpen_oecd impolicy distortion progress duration eu japan mexico korea nonoecd if action==1  , pa vce(robust)  nolog


