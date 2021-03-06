#necessary packagest to load
library(phylobase)
library(ape)
library(phytools)
library(philr)
library(plotrix)

#read phylogeny that is in nexus format
mytree <- read.nexus("Angiosperm_MEDUSA_tree.nex")

#identify nodes of interest
WGD_nodes = c(7877,9897,7873,7864,9622,9700,9654,12054,10163,12097,12117,12118,10208,10233,10333,10277,11485,11280,10637,10708,10483,10567,10432,12963,12993,12858,12791,13452,13661,13497,13808,14394,14509,14580,15105,15166,7860,9649,9842,10010,12629,10181,10176,11947,11982,12853,12771,13319,13497,15502,10135,11356,9628,7995,9279,9073,7884,7938,8005,8923,8857,8864,8036,8345,8166,8201,8296,9930,9846,9685,12078,12096,11113,11134,11548,11428,11490,11237,10663,10440,12730,12718,12800,13760,10132,15206,8000,8050,8105,8192,11195,9623,9074,8311,13097,13155,15204,13096,7996,15175)
down_nodes = c(13955,13963,13927,9410,10576,14268,13903,13701,14726,10950,12652,15086,14704,9443,12552,14133,15680,14074,14378,15632,14921,9617,9512,8449,8588,13608,12049,12053,8580,15551,15489,11873,8477,11780,13575,10165,9671,9690,11989,11268,11521,11323,8515,10549,10518,8091,10188,12782,10176,13137,11112,12091,11401,10657,9925,15098,11140,10427,10938,10816,7910,10432,10827,15150,13429,11130,12098,9632,9057,9628,10164,13148,7873,8982,11914,12674,10235,11408,8021,9221,8939,15346,10272)
up_nodes = c(10217,9697,11729,13644,13197,11863,11038,13175,12036,12000,10972,7995,14116,8103,8068,8057,8006,7948,12022,13451,15559,9757,11427,7879,8370,15293,9622,9077,12762,13705,12730,11807,10147,12435,11245,11000,8458,14507,9876,12197,15380,12604,10066,7884,13470,10722,14520,12771,10051,11564,12559,8839,13256,12669,13809,10883,10039,9129,10333,8414,13634,13292,14515,14924,10632,13597,12984,11551,8438,11169,10132,12950,14113,14814,15237,10000,8138,10976,10464,11314,13221,8244,10243,10114,13327,13400,14671,11065,9149,9219,9936,10993,11755,9279,13337,14631,13165,13356,14589,12124,12312,12886,8491,11677,11714,11486,11229,11392,8420,12729,13808,15594,8894,13464,10751,15019,12011,8692,8827,12463,11529,11447,8217,13396,13587,11330,9174,10764,12897,13310,10213,13349,13830,13749,9680,8492,13450,11379,8120,9241,12989,11996,15333,12345,12492,10703,13658,10928,10865,9741,13479,10697,12599,15177,13344,11711,12572,11898,11821,8512,14242,11439,9705,12007,9730,12834,10858,10231,15665,9433,14085,10483,13987,10059,10711,12089,12649,13011,14601,9918,11216,13044,12483,10522,14700,11455,9521,14963,12546,11696,11406,13031,11280,10349,12840,15143,14713,14871,11602,10567,15164,9897,15119,14203,15460,10922,15188,12366,8450,11763,8602,15072,12643,12268,15324,12244,8552,9161,11835,11060,8965,14850,10313,9319,15517,9978,15630,11086,8699,12690,13943,9107,11533,15546,13893,13721,15575,12165,14250,9479,14785,15422,14411,13383,9396,14741,14489,9597,14321,9614,14188)
#creat a PDF of plot
pdf("Angiosperm_Medusa_and_WGD.pdf")
#plot circular phylogeny with no tip labels
plot(mytree,type="fan", font=1, adj=0.5, no.margin=TRUE, edge.width=0.5, show.tip.label=FALSE)
#find the date of the oldest node, round to three digits
h <- max(nodeHeights(mytree))
g <- signif(h, digits=3)
#variables for window size of the time scale
a <- (g-200)
b <- (g-150)
c <- (g-100)
d <- (g-50)
obj <- axis(1,pos=-0.02*g, at=seq(0,240,by=50), labels=c(g,d,c,b,""), lwd=2)
text(x=0.5*g, y=-0.2*g, "Time (million years ago)")
#draw arcs at the above locations
for(j in 1:(length(obj))){
	draw.arc(0,0,radius=obj[j], deg1=0,deg2=360,lwd=1, col=make.transparent("gray",0.35))
}	
#Label nodes of interest with green circles
for(i in 1:length(WGD_nodes))
	nodelabels("W", WGD_nodes[i], frame="circle" ,col="springgreen", bg="springgreen", cex = 0.3)
#label nodes of interest with light blue dots
for(j in 1:length(down_nodes))
	nodelabels("d", down_nodes[j], frame="circle" ,col="lightskyblue", bg="lightskyblue", cex = 0.3)
#label nodes of interest with dark blue dots
for(k in 1:length(up_nodes))
	nodelabels("u", up_nodes[k], frame="circle" ,col="mediumblue", bg="mediumblue", cex = 0.3)	
#put in labels for different clades of the phyogeny
arc.cladelabels(text="Apiales", node=13492, mark.node=FALSE, ln.offset=1.03, lab.offset=1.07)
arc.cladelabels(text="Arecales", node=8906, mark.node=FALSE, ln.offset=1.03, lab.offset=1.07)
arc.cladelabels(text="Asparagales", node=8079, mark.node=FALSE, ln.offset=1.03, lab.offset=1.07)
arc.cladelabels(text="Asterales", node=13703, mark.node=FALSE)
arc.cladelabels(text="Caryophyllales", node=12703, mark.node=FALSE)
arc.cladelabels(text="Ericales", node=13144, mark.node=FALSE)
arc.cladelabels(text="Fabales", node=12077, mark.node=FALSE, ln.offset=1.03, lab.offset=1.07)
arc.cladelabels(text="Gentianales", node=14578, mark.node=FALSE)
arc.cladelabels(text="Lamiales", node=15203, mark.node=FALSE)
arc.cladelabels(text="Liliales", node=8023, mark.node=FALSE)
arc.cladelabels(text="Malpighiales", node=11230, mark.node=FALSE)
arc.cladelabels(text="Malvales", node=10624, mark.node=FALSE, ln.offset=1.07, lab.offset=1.1)
arc.cladelabels(text="Myrtales", node=10202, mark.node=FALSE)
arc.cladelabels(text="Poales", node=9075, mark.node=FALSE)
arc.cladelabels(text="Ranunculales", node=9928, mark.node=FALSE)
arc.cladelabels(text="Rosales", node=11862, mark.node=FALSE)
arc.cladelabels(text="Sapindales", node=10815, mark.node=FALSE)
arc.cladelabels(text="Solanales", node=15097, mark.node=FALSE, ln.offset=1.03, lab.offset=1.1)
dev.off()
