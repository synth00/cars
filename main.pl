% Fahrzeug(Position)
fahrzeug(nord,rechts).
fahrzeug(ost,rechts).
fahrzeug(sued,links).



% Regel: Ein Fahrzeug kann fahren, wenn kein Fahrzeug rechts von ihm ist oder wenn es rechts abbiegt.
kann_fahren(Position,rechts).
kann_fahren(Position,g_aus) :- \+ (rechts_von(Position, RechtsVonPosition), fahrzeug(RechtsVonPosition,_)).

% Regel: Ein Fahrzeug kann fahren, wenn es links abbiegt und ein auto nicht von vorn kommt
kann_fahren(Position,links) :- \+ (rechts_von(Position, RechtsVonPosition), fahrzeug(RechtsVonPosition,_)), \+ (gegenueber(Position,Gegenrichtung), fahrzeug(Gegenrichtung,_)).

% StVO §9 abs 4...linksabbieger die gegenüberstehen müssen voreinander abbiegen(modellieren als: dürfen immer fahren?!)


% Hilfsregel: Bestimme, welche Position rechts von einer gegebenen Position liegt.
rechts_von(nord, ost). %rechts von ost ist nord
rechts_von(ost, sued). %rechts von süd ist ost
rechts_von(sued, west). %rechts von west ist süd
rechts_von(west, nord). % rechts von nord ist west


gegenueber(ost, west).
gegenueber(nord, sued).
gegenueber(sued, nord).
gegenueber(west, nord).
