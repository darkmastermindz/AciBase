"C[r][|e][|a][t][|e][|d] [|b]y Z[|a][|c]h G[|a]i[n][|e][r] Hansel Wei 05-05-2014
FnOff 
AxesOff
Lbl 1
DelVar ADelVar BDelVar CDelVar D
Menu("  AciBASE Calc  ","[p]H",PH,"[p]OH",PO,"OH-",OH,"H3O+,H+",H3,"Clo[s][|e]",0,"I[n]fo",IN)
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
While C>=0
	ClrHome
	Input "OH-:",C
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
	Text(1,26,"AciBASE v3.17"
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
	Lbl 0
	AxesOn
	FnOn 
	ClrDraw
	ClrHome
	Return
	Lbl IN
	ClrHome
	Disp "AciBASE v3.17","","C[r][|e][|a][t][|e][|d] [|b]y","Z[|a][|c]h G[|a]i[n][|e][r] and ","Hansel Wei","","M[|a]y 20[t]h 2014"
	Pause 
	ClrHome
	Goto 1
