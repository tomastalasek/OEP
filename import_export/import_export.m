%Vytvoříme pomocnou matici, obsahující na prvním řádku čísla 1 až 5 a na druhém 6 až 10
A=rand(5,3)'

%Vytvoříme velkou matici pro potřeby příkazu SAVE
B=rand(1000);

%=============================
%Ulož data a načti je - OCTAVE
%=============================


%ulož všechny proměnné do souboru data1.mat
%data budou uložena v textové podobě - po otevření v textovém editoru bude vše čitelné
save data1.mat

%ulož pouze proměnnou A do souboru data2.mat
save data2.mat A

%ulož proměnné A a B do souboru data3.mat
save data3.mat A B

%POZOR - u větších souborů může být takto uložený soubor velmi velký:

%ulož proměnnou B (matice obsahuje milion čísel) do souboru data_big1.mat (výsledný soubor má velikost 18.1 MB)
save data_big1.mat B

%prověď stejnou operaci, ale ulož data v nativním formátu Octave (výsledný soubor má velikost 7.6 MB, ale již není čitelný v textovém editoru)
save -binary data_big2.mat B

%prověď stejnou operaci, ale ulož data v nativním formátu Matlab (výsledný soubor má velikost 7.6 MB, nyní jej bez prolbému otevřeme v Matlabu)
save -mat data_big3.mat B

%POZNÁMKA: Pro Matlab bylo vyvinuto několik verzí formátu pro ukládání dat. Příkaz -mat ukládáme do verze 6. Pro novější verzi 7 lze využít příkaz -mat7-binary a pro starší verzi 4 lze využít příkaz mat4-binary


%"Vyčistíme" proměnné A a B
clear A B


%Načti data ze souboru data1.mat
load data1.mat

%"Vyčistíme" proměnné A a B
clear A B

%Načti jen proměnnou A ze souboru data1.mat
load data1.mat A

%"Vyčistíme" proměnné A a B
clear A B

%Načti data ze souboru data_big2.mat - při načítání dat uložených pomocí příkazu -binary nebo -mat není nutné tento příkaz zadávat - Octave rozpozná formát souboru sám, nicméně je možné mu tento příkaz podat
load data_big2.mat








%"Vyčistíme" proměnné A a B
clear A B

%obnovíme siu proměnné A a B
load data1.mat



%============================
%Ulož data a načti je - CSV
%============================

%ulož hodnoty matice A do csv souboru data1.csv - jednotlivé položky budou oddělené čárkou
csvwrite('data1.csv',A)

%zaokrouhlíme výstup na 3 desetinná místa
csvwrite('data2.csv',A,'precision',3)

%ulož hodnoty matice A do csv souboru data3.csv - jednotlivé položky budou oddělené středníkem
dlmwrite('data3.csv',A,';')

%TIP - dlmwrite lze použít místo csvwrite
dlmwrite('data4.csv',A,',')

%TIP - i zde lze pomocí příkazu precision nastavit počet desetinných míst
dlmwrite('data5.csv',A,';','precision',3)




%do proměnné nactena_data1 načti data z csv souboru data1.csv
nactena_data1=csvread('data1.csv')

%do proměnné nactena_data2 načti data z csv souboru data2.csv
nactena_data2=csvread('data2.csv')

%do proměnné nactena_data3 načti data z csv souboru data3.csv
nactena_data3=dlmread('data3.csv',';')









%============================
%Ulož data a načti je - EXCEL
%============================

%POZOR - je třeba nainstalovat package io: https://octave.sourceforge.io/io/index.html
%Následující příkaz knihovnu nainstaluje:
%pkg install io-2.4.10.tar.gz   (čísla se budou měnit podle verze)
%Nicméně při každém spuštění musí být načtena (pokud ji chceme použít)
%
%POZOR - knihovna io umí pracovat se soubory xlsx, ale ne xls!!


%načti knihovnu io
pkg load io

%do souboru data.xlsx nahraj hodnoty z matice A na list NasList od buňky C3
xlswrite('data.xlsx',A,'NasList','C3')

%do proměnné nactena_data ulož hodnotu z excelovského souboru data.xlsx z listu NasList z buňky D3
nactena_data=xlsread('data.xlsx','NasList','D3')

%do proměnné nactena_data ulož hodnotu z excelovského souboru data.xlsx z listu NasList z buňek D3-G3
nactena_data=xlsread('data.xlsx','NasList','E3:G3')