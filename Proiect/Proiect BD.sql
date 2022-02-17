CREATE TABLE MAGAZIN(ID_magazin number(3),nr_tel char(10),rating number(2) not null,
PRIMARY KEY(ID_magazin));
insert into MAGAZIN values(100,1234567890,7);
insert into MAGAZIN values(101,1234567893,3);
insert into MAGAZIN values(102,null,7);
insert into MAGAZIN values(103,0777777777,6);
insert into MAGAZIN values(104,null,2);
select * from MAGAZIN;


CREATE TABLE ADRESA(ID_adresa number(3),ID_magazin number(3) not null unique,oras varchar(25)
not null, judet varchar(20) not null,strada varchar(30) not null,PRIMARY KEY(ID_adresa)
,FOREIGN KEY(ID_magazin) references MAGAZIN(ID_magazin),
constraint unic unique(oras,judet,strada));
insert into ADRESA values(100,100,'Pitesti','Arges','Exercitiu');
insert into ADRESA values(101,101,'Sector 3','Bucuresti','Mizil');
insert into ADRESA values(102,102,'Vaslui','Vaslui','Munciii');
insert into ADRESA values(103,103,'Pitesti','Arges','Traian');
insert into ADRESA values(104,104,'Sector 1','Bucuresti','Academiei');
select * from ADRESA;


CREATE TABLE ANGAJAT(ID_angajat number(5),ID_magazin number(3) not null,salariu number(5)
not null,nr_tel char(10) not null,nume varchar(30) not null,prenume varchar(50) not null,
job varchar(30) not null,PRIMARY KEY(ID_angajat),
FOREIGN KEY(ID_magazin) references MAGAZIN(ID_magazin));
insert into ANGAJAT values(300,100,10600,0773618370,'Popescu','Mihnea-Valentin','Manager');
insert into ANGAJAT values(301,100,7000,0773723371,'Potcoveanu','Florin-Razvan','Programator');
insert into ANGAJAT values(302,100,5350,0738218373,'Coman','Eduard-Ionut','IT');
insert into ANGAJAT values(303,101,9500,0773783271,'Marcu','Corina','Manager');
insert into ANGAJAT values(304,101,7600,0783218376,'Cerchia','Raluca','Programator');
select * from ANGAJAT;



CREATE TABLE TRANSPORT(ID_transport number(6),nr_calculatoare_initiale number(3) not null,
nume_firma_curierat varchar(30) not null,PRIMARY KEY(ID_transport));
insert into TRANSPORT values(100,30,'Fan curier');
insert into TRANSPORT values(101,27,'Cargus');
insert into TRANSPORT values(102,5,'Fan curier express');
insert into TRANSPORT values(103,67,'Cargus');
insert into TRANSPORT values(104,2,'Posta Romana');
select * from transport;



CREATE TABLE CALCULATOR(ID_calculator number(10),ID_magazin number(3) not null,ID_transport
number(6),cost number(5) not null,utilizare varchar(20),data_asamblare date,stare varchar(20)
not null,PRIMARY KEY(ID_calculator),FOREIGN KEY (ID_magazin) references MAGAZIN(ID_magazin),
FOREIGN KEY (ID_transport) references TRANSPORT(ID_transport));
insert into CALCULATOR values(100,100,null,4500,'Office',to_date('25/03/2011','DD/MM/YYYY'),'Nou');
insert into CALCULATOR values(101,100,null,7300,'Gaming',to_date('25/04/2011','DD/MM/YYYY'),'Nou');
insert into CALCULATOR values(102,102,101,5630,'Server',to_date('27/11/2010','DD/MM/YYYY'),'Uzat');
insert into CALCULATOR values(103,101,101,3100,'Office',null,'Second-Hand');
insert into CALCULATOR values(104,102,null,9600,'Gaming',to_date('05/07/2012','DD/MM/YYYY'),'Nou');
select * from CALCULATOR;


CREATE TABLE COMPONENTA(ID_componenta number(6),consum_electricitate number (4) not null,greutate
number(5),data_lansare date not null,cost number(7,2) not null,tip varchar(20) not null,PRIMARY
KEY (ID_componenta));
insert into COMPONENTA values(300,245,300,to_date('29/07/2009','DD/MM/YYYY'),3699.99,'GPU');
insert into COMPONENTA values(301,200,100,to_date('29/07/2010','DD/MM/YYYY'),2299.99,'CPU');
insert into COMPONENTA values(302,400,200,to_date('10/03/2011','DD/MM/YYYY'),1299.99,'Motherboard');
insert into COMPONENTA values(303,567,341,to_date('19/07/2007','DD/MM/YYYY'),599.99,'Cooler');
insert into COMPONENTA values(304,300,400,to_date('19/08/2010','DD/MM/YYYY'),4399.99,'GPU');
select * from COMPONENTA;


create TABLE CONTINE(ID_calculator number(10),ID_componenta number(6),
PRIMARY KEY(ID_calculator,ID_componenta),FOREIGN KEY (ID_calculator) 
references CALCULATOR(ID_calculator),FOREIGN KEY(ID_componenta) references COMPONENTA(ID_componenta));
insert into CONTINE values(101,304);
insert into CONTINE values(101,303);
insert into CONTINE values(101,302);
insert into CONTINE values(101,301);
insert into CONTINE values(100,300);
insert into CONTINE values(100,303);
insert into CONTINE values(100,302);
insert into CONTINE values(100,301);
insert into CONTINE values(102,300);
insert into CONTINE values(102,303);
insert into CONTINE values(102,302);
insert into CONTINE values(102,301);
insert into CONTINE values(103,300);
insert into CONTINE values(103,303);
insert into CONTINE values(103,302);
insert into CONTINE values(103,301);
select * from contine;



create TABLE FURNIZOR(ID_furnizor number(3),nr_telef char(10) not null,
tip_componenta varchar(20) not null,data_contract date not null,
durata_aprovizionare number(4) not null,PRIMARY KEY (ID_furnizor));
insert into FURNIZOR values (100,0723712375,'GPU',to_date('23/05/2009','DD/MM/YYYY'),1800);
insert into FURNIZOR values (101,0726438723,'CPU',to_date('09/11/2008','DD/MM/YYYY'),2000);
insert into FURNIZOR values (102,0736238734,'Motherboard',to_date('23/05/2009','DD/MM/YYYY'),1250);
insert into FURNIZOR values (103,0748267834,'GPU',to_date('03/07/2010','DD/MM/YYYY'),1300);
insert into FURNIZOR values (104,0784572375,'CPU',to_date('19/01/2009','DD/MM/YYYY'),1700);
insert into FURNIZOR values (105,0765236523,'Motherboard',to_date('17/03/2012','DD/MM/YYYY'),3700);
select * from FURNIZOR;



create TABLE APROVIZIONEAZA(ID_magazin number(3),ID_furnizor number(3), 
PRIMARY KEY(ID_magazin,ID_furnizor),FOREIGN KEY (ID_magazin) references MAGAZIN(ID_magazin),
FOREIGN KEY (ID_furnizor) references FURNIZOR(ID_furnizor));
insert into APROVIZIONEAZA values (100,100);
insert into APROVIZIONEAZA values (100,101);
insert into APROVIZIONEAZA values (100,102);
insert into APROVIZIONEAZA values (100,103);
insert into APROVIZIONEAZA values (100,104);
insert into APROVIZIONEAZA values (101,103);
insert into APROVIZIONEAZA values (101,104);
insert into APROVIZIONEAZA values (101,102);
insert into APROVIZIONEAZA values (101,105);
insert into APROVIZIONEAZA values (102,100);
insert into APROVIZIONEAZA values (102,101);
insert into APROVIZIONEAZA values (102,102);
insert into APROVIZIONEAZA values (102,103);
select * from APROVIZIONEAZA;



CREATE TABLE LIVRARE (ID_transport numeric(6),ID_furnizor numeric(3) not null,
ID_magazin numeric(3) not null,nr_componente numeric(3) not null,cost numeric(7) not null,
data_livrare date not null,tip_curier varchar(30) not null,PRIMARY KEY(ID_transport), 
FOREIGN KEY (ID_furnizor) references FURNIZOR(ID_furnizor),
FOREIGN KEY (ID_magazin) references MAGAZIN(ID_magazin));
insert into LIVRARE values (100,100,100,300,29351,to_date('30/11/2013','DD/MM/YYYY'),'camion');
insert into LIVRARE values (101,100,101,300,12351,to_date('23/07/2012','DD/MM/YYYY'),'nava');
insert into LIVRARE values (102,101,104,300,64351,to_date('04/03/2014','DD/MM/YYYY'),'camion');
insert into LIVRARE values (103,101,100,300,61351,to_date('16/05/2013','DD/MM/YYYY'),'avion');
insert into LIVRARE values (104,102,103,300,32351,to_date('14/11/2013','DD/MM/YYYY'),'vapor');
select * from LIVRARE;

create table CLIENT (ID_client numeric(7),nume varchar(30) not null, prenume varchar(50) not null,
telefon char(10) not null,email varchar(50) not null,PRIMARY KEY (ID_client));
insert into CLIENT values (100,'Mocanu','Eduard-Ionut',0723652376,'email1@gmail.com');
insert into CLIENT values (101,'Din','Andrei-Iulian',0765237634,'email2@gmail.com');
insert into CLIENT values (102,'Nitescu','Andreea',0745762365,'email3@gmail.com');
insert into CLIENT values (103,'Oprescu','Irene',0734762376,'email4@gmail.com');
insert into CLIENT values (104,'Manda','Octavian',0734762343,'email5@gmail.com');
select * from CLIENT;



create table FACTURA (ID_factura numeric(10),ID_magazin numeric(3),ID_calculator numeric(10) 
not null unique,ID_client numeric(7) not null,data_cumpararii date not null,
PRIMARY KEY(ID_factura),FOREIGN KEY (ID_MAGAZIN) references MAGAZIN(ID_magazin),
FOREIGN KEY(ID_client) references CLIENT(ID_client),
FOREIGN KEY (ID_calculator) references CALCULATOR (ID_calculator));
insert into FACTURA values(100,100,100,100,to_date('23/04/2015','DD/MM/YYYY'));
insert into FACTURA values(101,100,101,100,to_date('21/04/2015','DD/MM/YYYY'));
insert into FACTURA values(102,101,103,102,to_date('21/08/2015','DD/MM/YYYY'));
insert into FACTURA values(103,102,102,103,to_date('11/02/2015','DD/MM/YYYY'));
insert into FACTURA values(104,102,104,103,to_date('17/07/2015','DD/MM/YYYY'));
select * from FACTURA;


create table GARANTIE(ID_garantie numeric(10),ID_factura numeric(10) not null unique,
data_emitere date not null,duarata numeric(4) not null,PRIMARY KEY(ID_garantie),
FOREIGN KEY (ID_factura) references FACTURA(ID_factura));
insert into garantie values (100,100,to_date('23/04/2015','DD/MM/YYYY'),365);
insert into garantie values (101,101,to_date('27/09/2015','DD/MM/YYYY'),365);
insert into garantie values (102,102,to_date('23/04/2016','DD/MM/YYYY'),375);
insert into garantie values (103,103,to_date('19/07/2013','DD/MM/YYYY'),180);
insert into garantie values (104,104,to_date('04/06/2014','DD/MM/YYYY'),365);
select * from GARANTIE;

commit;

/* sa se afiseze adresele magazinelor de la care s-a cumparat cel putin un calculator*/
select distinct oras,judet,strada
from client join factura using (id_client) join magazin using (id_magazin) join adresa 
using (id_magazin);
/*foloseste join pe 4 tabele*/


/*sa se afiseze id-ul magazinelor din judetul arges, iar strada sa nu contina litera e si 
strada sa aiba cel putin 5 litere*/
select id_magazin,strada
from magazin join adresa using(id_magazin)
where lower(judet)='arges' and upper(strada) not like '%E%' and length(strada)>5;
/*filtrare pe linii si functii pe caractere*/


/*sa se afiseze job-urile care au media salariului mai mare ca 6000, ordonat crescator*/
select avg(salariu),job
from angajat
group by job
having avg(salariu)>6000
order by 1 asc;
/*grupari de date,functii de grup,filtrare la nivel de grupuri si ordonari*/

/*sa se afiseze informatiile despre fiecare calculator si cate luni au trecut de la asamblare
sau -1 daca este second hand.Daca transportul este null sa se afiseze nu este vandut.
Sa se afiseze pretul marit cu 10% daca este calculator de gaming si cu 5% daca este calculator 
server*/
select id_calculator,decode(id_transport,null,'nu este vandut',id_transport),
case lower(utilizare)
when 'gaming' then cost+cost*0.1
when 'server' then cost+cost*0.05
else cost
end cost
,utilizare,nvl(round(months_between(sysdate,data_asamblare)),-1) luni_vechime
from calculator;
/*functie decode,nvl,case si functii pe date)*/


/*sa se afiseze informatii despre calculatoarele si componentele lor al caror 
pret este mai mic ca
pretul mediu pt tipul sau(tipul calculatorului) din magaziele cu rating mai mare de 6 
si care se afla in orasul Pitesti */
select c.id_calculator,c.stare,c.cost,c.utilizare,com.id_componenta,com.cost,com.tip
from calculator c left join contine con on (con.id_calculator=c.id_calculator)
left join componenta com on (com.id_componenta=con.id_componenta)
where c.cost<(select avg(c2.cost)
            from calculator c2 join magazin using (id_magazin) join adresa using (id_magazin)
            where c.utilizare=c2.utilizare
            and rating>6
            and lower(oras)='pitesti');         
/*subcerere sincronizata cu 3 tabele*/


/*utilizand clauza with sa se afiseze costul total al transporturilor in functie 
de tipul de componenta
se vor considera tipurile de componente a caror valoare totala a costului este mai 
mica decat media
costului tuturor transporturilor*/
with
cost_mediu as (select avg(cost) cost_mediu from livrare),
cost_total as (select sum(cost) cost_total,tip_componenta
from livrare join furnizor using (id_furnizor)
group by tip_componenta)
select cost_total,tip_componenta
from cost_total
where cost_total<(select cost_mediu from cost_mediu);
/* bloc de cerere cu with*/


/*sa se afiseze doar magazinele cu furnizorii ale caror contracte au fost incheiate
dupa data lansarii celei mai noi componente care se afla intr-un calculator care are o stare noua*/
select m.id_magazin,m.nr_tel,m.rating,f.tip_componenta,f.data_contract
from magazin m join aprovizioneaza a on (m.ID_magazin=a.ID_magazin) join furnizor f 
using (ID_furnizor)
where data_contract>(select max(data_lansare)
                     from componenta join contine using (id_componenta) join calculator using (id_calculator)
                    where lower(stare) like 'nou');                
/*subcerere nesincronizata cu 3 tabele*/


/*sa se seteze toate salariile programatorilor ca media salariilor+300*/
update angajat
set salariu=(select avg(salariu)+300
             from angajat)
where lower(job)='programator';
select * from angajat;
rollback;


/*sa se seteze tipurile calculatoarelor la tipul celui mai vechi calculator*/
update calculator
set utilizare=(select utilizare
                from calculator
                where data_asamblare=(select min(data_asamblare) 
                                        from calculator));
select * from calculator;


/* sa se seteze costul fiecarei componente care consuma mai multa electricitate decat media
la costul maxim al componentelor care consuma cea mai multa electricitate*/
update componenta
set cost=(select max(cost) 
from componenta
where consum_electricitate=(select max(consum_electricitate)
                            from componenta))
where consum_electricitate>(select avg(consum_electricitate)
              from componenta);
select * from componenta;


/*sa se creeze o secventa care sa adauge furnizorii 100-104 la magazinul 104*/
create sequence seq_aprovizionare
start with 100
increment by 1
maxvalue 104
nocycle
nocache;
insert into aprovizioneaza values(104,seq_aprovizionare.nextval);
drop sequence seq_aprovizionare;
select * from aprovizioneaza;
rollback;

commit;

