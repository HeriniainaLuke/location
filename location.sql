/*==============================================================*/
/* Nom de SGBD :  PostgreSQL 8                                  */
/* Date de création :  1/03/2017 09:30:11                       */
/*==============================================================*/


drop index CATEGORIE_PK;

drop table CATEGORIE;

drop index ASSOCIATION_2_FK;

drop index ASSOCIATION_1_FK;

drop index LOCATION_PK;

drop table LOCATION;

drop index ASSOCIATION_4_FK;

drop index ASSOCIATION_3_FK;

drop index RESERVATION_PK;

drop table RESERVATION;

drop index TARIFS_PK;

drop table TARIFS;

drop index UTILISATEUR_PK;

drop table UTILISATEUR;

/*==============================================================*/
/* Table : CATEGORIE                                            */
/*==============================================================*/
create table CATEGORIE (
   IDCATEGORIE          SERIAL               not null,
   CATEGORIE            VARCHAR(100)           null,
   constraint PK_CATEGORIE primary key (IDCATEGORIE)
);

/*==============================================================*/
/* Index : CATEGORIE_PK                                         */
/*==============================================================*/
create unique index CATEGORIE_PK on CATEGORIE (
IDCATEGORIE
);

/*==============================================================*/
/* Table : LOCATION                                             */
/*==============================================================*/
create table LOCATION (
   IDLOCATION           SERIAL               not null,
   IDCATEGORIE          INT4                 not null,
   IDTARIF              INT4                 not null,
   DESCRIPTION          TEXT                 not null,
   constraint PK_LOCATION primary key (IDLOCATION)
);

/*==============================================================*/
/* Index : LOCATION_PK                                          */
/*==============================================================*/
create unique index LOCATION_PK on LOCATION (
IDLOCATION
);

/*==============================================================*/
/* Index : ASSOCIATION_1_FK                                     */
/*==============================================================*/
create  index ASSOCIATION_1_FK on LOCATION (
IDTARIF
);

/*==============================================================*/
/* Index : ASSOCIATION_2_FK                                     */
/*==============================================================*/
create  index ASSOCIATION_2_FK on LOCATION (
IDCATEGORIE
);

/*==============================================================*/
/* Table : RESERVATION                                          */
/*==============================================================*/
create table RESERVATION (
   IDRESERVATION        SERIAL               not null,
   IDUTILISATEUR        INT4                 not null,
   IDLOCATION           INT4                 not null,
   HEUREDEBUT           TIME                 not null,
   HEUREFIN             TIME                 not null,
   DATERESERVATION      DATE                 not null,
   constraint PK_RESERVATION primary key (IDRESERVATION)
);

/*==============================================================*/
/* Index : RESERVATION_PK                                       */
/*==============================================================*/
create unique index RESERVATION_PK on RESERVATION (
IDRESERVATION
);

/*==============================================================*/
/* Index : ASSOCIATION_3_FK                                     */
/*==============================================================*/
create  index ASSOCIATION_3_FK on RESERVATION (
IDLOCATION
);

/*==============================================================*/
/* Index : ASSOCIATION_4_FK                                     */
/*==============================================================*/
create  index ASSOCIATION_4_FK on RESERVATION (
IDUTILISATEUR
);

/*==============================================================*/
/* Table : TARIFS                                               */
/*==============================================================*/
create table TARIFS (
   IDTARIF              SERIAL               not null,
   LIEU                 VARCHAR(1)           not null,
   PRIX                 DECIMAL              null,
   constraint PK_TARIFS primary key (IDTARIF)
);

/*==============================================================*/
/* Index : TARIFS_PK                                            */
/*==============================================================*/
create unique index TARIFS_PK on TARIFS (
IDTARIF
);

/*==============================================================*/
/* Table : UTILISATEUR                                          */
/*==============================================================*/
create table UTILISATEUR (
   IDUTILISATEUR        SERIAL               not null,
   NOM                  VARCHAR(1)           not null,
   PRENOM               VARCHAR(1)           not null,
   TELEPHONE            VARCHAR(1)           not null,
   constraint PK_UTILISATEUR primary key (IDUTILISATEUR)
);

/*==============================================================*/
/* Index : UTILISATEUR_PK                                       */
/*==============================================================*/
create unique index UTILISATEUR_PK on UTILISATEUR (
IDUTILISATEUR
);

alter table LOCATION
   add constraint FK_LOCATION_ASSOCIATI_TARIFS foreign key (IDTARIF)
      references TARIFS (IDTARIF)
      on delete restrict on update restrict;

alter table LOCATION
   add constraint FK_LOCATION_ASSOCIATI_CATEGORI foreign key (IDCATEGORIE)
      references CATEGORIE (IDCATEGORIE)
      on delete restrict on update restrict;

alter table RESERVATION
   add constraint FK_RESERVAT_ASSOCIATI_LOCATION foreign key (IDLOCATION)
      references LOCATION (IDLOCATION)
      on delete restrict on update restrict;

alter table RESERVATION
   add constraint FK_RESERVAT_ASSOCIATI_UTILISAT foreign key (IDUTILISATEUR)
      references UTILISATEUR (IDUTILISATEUR)
      on delete restrict on update restrict;
	  
insert into CATEGORIE (CATEGORIE) values ("Voiture");
insert into CATEGORIE (CATEGORIE) values ("Espace");
insert into CATEGORIE (CATEGORIE) values ("Maison");

insert into TARIFS (LIEU, PRIX) values ("Ville",100000);
insert into TARIFS (LIEU, PRIX) values ("Peripherique",200000);

insert into LOCATION (IDCATEGORIE,IDTARIF, DESCRIPTION) values (1,1,"Mitsubishi Pajero v98");
insert into LOCATION (IDCATEGORIE,IDTARIF, DESCRIPTION) values (2,2,"Espace Mahafaly");
insert into LOCATION (IDCATEGORIE,IDTARIF, DESCRIPTION) values (3,3,"Villa basse a Ambohibao");

insert into UTILISATEUR (NOM, PRENOM, TELEPHONE) values ("Rakotoson","Luke","0334567890");
insert into UTILISATEUR (NOM, PRENOM, TELEPHONE) values ("Jean","Marc","0344567890");

insert into RESERVATION (IDUTILISATEUR,IDLOCATION, HEUREDEBUT, HEUREFIN, DATERESERVATION) values (1,1,"08:00","12:00","2017-03-15");
insert into RESERVATION (IDUTILISATEUR,IDLOCATION, HEUREDEBUT, HEUREFIN, DATERESERVATION) values (2,1,"13:00","18:00","2017-03-15");



