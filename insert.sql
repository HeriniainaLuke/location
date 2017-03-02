insert into CATEGORIE (CATEGORIE) values ('Voiture');
insert into CATEGORIE (CATEGORIE) values ('Espace');
insert into CATEGORIE (CATEGORIE) values ('Maison');

insert into TARIFS (LIEU, PRIX) values ('Ville',100000);
insert into TARIFS (LIEU, PRIX) values ('Peripherique',200000);

insert into UTILISATEUR (NOM, PRENOM, TELEPHONE) values ('Rakotoson','Luke','0334567890');
insert into UTILISATEUR (NOM, PRENOM, TELEPHONE) values ('Jean','Marc','0344567890');

insert into LOCATION (IDCATEGORIE,IDTARIF, DESCRIPTION) values (10,7,'Mitsubishi Pajero v98');
insert into LOCATION (IDCATEGORIE,IDTARIF, DESCRIPTION) values (11,8,'Espace Mahafaly');
insert into LOCATION (IDCATEGORIE,IDTARIF, DESCRIPTION) values (12,7,'Villa basse a Ambohibao');

insert into RESERVATION (IDUTILISATEUR,IDLOCATION, HEUREDEBUT, HEUREFIN, DATERESERVATION) values (1,9,'08:00','12:00','2017-03-15');
insert into RESERVATION (IDUTILISATEUR,IDLOCATION, HEUREDEBUT, HEUREFIN, DATERESERVATION) values (2,10,'13:00','18:00','2017-03-15');