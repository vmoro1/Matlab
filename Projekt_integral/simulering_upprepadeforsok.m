n=1000;
A=1:n;

for k=1:n
    slumpar_punkter;
    A(k)=volym_klot;
end

genomsnitt_volym=mean(A)
procentuell_avvikelse=100*(abs(genomsnitt_volym-teoretisk_volymklot)/teoretisk_volymklot)
Standardavvikelsen=std(A)
Varians=var(A)