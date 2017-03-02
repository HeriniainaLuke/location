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
   LIEU                 VARCHAR(100)           not null,
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
   NOM                  VARCHAR(100)           not null,
   PRENOM               VARCHAR(100)           not null,
   TELEPHONE            VARCHAR(100)           not null,
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
	  




