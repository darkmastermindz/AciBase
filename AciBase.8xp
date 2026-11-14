"C[r][|e][|a][t][|e][|d] [|b]y Z[|a][|c]h G[|a]i[n][|e][r] Hansel Wei 05-05-2014
FnOff
AxesOff
Lbl 1
DelVar ADelVar BDelVar CDelVar DDelVar KDelVar MDelVar NDelVar V
Menu("  AciBASE Calc  ","[p]H",PH,"[p]OH",PO,"OH-",OH,"H3O+,H+",H3,"Mor[|e]...",M2,"Clo[s][|e]",0,"I[n]fo",IN)
Lbl M2
Menu("  AciBASE Calc 2","We[|a]k A[|c]i[|d]",WA,"We[|a]k B[|a][s][|e]",WB,"K[|a]/K[|b] Co[n]v",KK,"B[|e]ff[|e]r (H-H)",BF,"Titr[|a][t]io[n]",TI,"B[|a][|c]k",1)
Lbl PH
While A<=0 and A<=14
	ClrHome
	Input "pH:",A
End
14-(A)->B:"[p]OH
10^(~B)->C:"OH-
10^(~A)->D:"H3O
Goto 2
Lbl PO
While B<=0
	ClrHome
	Input "pOH:",B
End
14-(B)->A:"[p]H
10^(~B)->C:"OH-
10^(~A)->D:"H3O
Goto 2
Lbl OH
While C<=0
	ClrHome
	Input "OH-:",C
End
~log(C)->B:"[p]OH
14-(B)->A:"[p]H
10^(~A)->D:"H3O
Goto 2
Lbl H3
While D<=0
	ClrHome
	Input "H3O:",D
End
(1.00|E~14)/(D)->C:"OH-
~log(C)->B:"[p]OH
14-B->A:"[p]H
Lbl 2
ClrDraw
Text(1,26,"AciBASE v3.18"
Horizontal 10
Horizontal ~10
Horizontal 7
Vertical ~10
Vertical 10
Text(11,2,"pH:     ~log([H   ]      ="
Text(10,41,"+"
Text(11,60,A
Text(21,2,"pOH: ~log([OH   ]  ="
Text(20,45,"~"
Text(21,60,B
Text(31,2,"[OH   ]:  10^(~pOH  ="
Text(29,12,"~"
Text(31,60,C
Text(41,2,"[H    ]:     10^(~pH )  ="
Text(39,9,"+"
Text(41,60,D
Text(54,68,"[Enter]
Pause
Goto 1
Lbl WA
While K<=0
	ClrHome
	Disp "WEAK ACID HA"
	Input "Ka:",K
End
While M<=0
	Input "[HA] (M):",M
End
(~K+(K^2+4KM)^.5)/2->D:"H3O
~log(D)->A:"[p]H
14-A->B:"[p]OH
(1.00|E~14)/(D)->C:"OH-
100D/M->P:"%IONIZED
ClrDraw
Text(1,26,"AciBASE v3.18"
Horizontal 10
Horizontal ~10
Horizontal 7
Vertical ~10
Vertical 10
Text(11,2,"Ka:"
Text(11,60,K
Text(21,2,"C=[HA]i:"
Text(21,60,M
Text(31,2,"Ka=x^2/(C~x) x="
Text(31,60,D
Text(41,2,"%ion:   100x/C  ="
Text(41,60,P
Text(54,68,"[Enter]
Pause
Goto 2
Lbl WB
While K<=0
	ClrHome
	Disp "WEAK BASE B"
	Input "Kb:",K
End
While M<=0
	Input "[B] (M):",M
End
(~K+(K^2+4KM)^.5)/2->C:"OH-
~log(C)->B:"[p]OH
14-B->A:"[p]H
(1.00|E~14)/(C)->D:"H3O
100C/M->P:"%IONIZED
ClrDraw
Text(1,26,"AciBASE v3.18"
Horizontal 10
Horizontal ~10
Horizontal 7
Vertical ~10
Vertical 10
Text(11,2,"Kb:"
Text(11,60,K
Text(21,2,"C=[B]i:"
Text(21,60,M
Text(31,2,"Kb=x^2/(C~x) x="
Text(31,60,C
Text(41,2,"%ion:   100x/C  ="
Text(41,60,P
Text(54,68,"[Enter]
Pause
Goto 2
Lbl KK
While K<=0
	ClrHome
	Disp "Ka OR Kb","(Ka*Kb=Kw)"
	Input "K:",K
End
(1.00|E~14)/(K)->E:"CONJUGATE K
~log(K)->F:"[p]K
14-F->G:"CONJUGATE [p]K
ClrDraw
Text(1,26,"AciBASE v3.18"
Horizontal 10
Horizontal ~10
Horizontal 7
Vertical ~10
Vertical 10
Text(11,2,"K given:"
Text(11,60,K
Text(21,2,"Kconj:  Kw/K   ="
Text(21,60,E
Text(31,2,"pK:   ~log(K)  ="
Text(31,60,F
Text(41,2,"pKconj: 14~pK  ="
Text(41,60,G
Text(54,68,"[Enter]
Pause
Goto 1
Lbl BF
While K<=0
	ClrHome
	Disp "BUFFER HA/A-"
	Input "Ka:",K
End
While N<=0
	Input "[A-] (M):",N
End
While M<=0
	Input "[HA] (M):",M
End
~log(K)->F:"[p]Ka
N/M->R:"RATIO
F+log(R)->A:"[p]H
14-A->B:"[p]OH
10^(~B)->C:"OH-
10^(~A)->D:"H3O
ClrDraw
Text(1,26,"AciBASE v3.18"
Horizontal 10
Horizontal ~10
Horizontal 7
Vertical ~10
Vertical 10
Text(11,2,"Ka:"
Text(11,60,K
Text(21,2,"pKa:  ~log(Ka) ="
Text(21,60,F
Text(31,2,"[A~]/[HA]      ="
Text(31,60,R
Text(41,2,"pH: pKa+log( ) ="
Text(41,60,A
Text(54,68,"[Enter]
Pause
Goto 2
Lbl TI
ClrHome
Disp "STRONG ACID +","STRONG BASE"
While M<=0
	Input "ACID M:",M
End
While V<=0
	Input "ACID mL:",V
End
While N<=0
	Input "BASE M:",N
End
~1->W
While W<0
	Input "BASE mL:",W
End
MV->P:"MMOL H+
NW->Q:"MMOL OH-
V+W->E:"TOTAL mL
MV/N->G:"EQUIV mL BASE
(P-Q)/E->X:"EXCESS M
If X>=0
Then
	(X+(X^2+4|E~14)^.5)/2->D:"H3O
	~log(D)->A:"[p]H
	14-A->B:"[p]OH
	(1.00|E~14)/(D)->C:"OH-
Else
	(~X+(X^2+4|E~14)^.5)/2->C:"OH-
	~log(C)->B:"[p]OH
	14-B->A:"[p]H
	(1.00|E~14)/(C)->D:"H3O
End
ClrDraw
Text(1,26,"AciBASE v3.18"
Horizontal 10
Horizontal ~10
Horizontal 7
Vertical ~10
Vertical 10
Text(11,2,"mmol H+: MaVa  ="
Text(11,60,P
Text(21,2,"mmol OH~: MbVb ="
Text(21,60,Q
Text(31,2,"Vtot:  Va+Vb   ="
Text(31,60,E
Text(41,2,"Veq:  MaVa/Mb  ="
Text(41,60,G
Text(54,68,"[Enter]
Pause
Goto 2
Lbl 0
AxesOn
FnOn
ClrDraw
ClrHome
Return
Lbl IN
ClrHome
Disp "AciBASE v3.18","","C[r][|e][|a][t][|e][|d] [|b]y","Z[|a][|c]h G[|a]i[n][|e][r] and ","Hansel Wei","","M[|a]y 20[t]h 2014"
Pause
ClrHome
Goto 1
