Rem
Rem $Header: rdbms/demo/schema/order_entry/pcus_v3.sql /main/4 2011/01/19 12:56:23 celsbern Exp $
Rem
Rem pcus_v3.sql
Rem
Rem Copyright (c) 2002, 2015, Oracle and/or its affiliates.  All rights reserved. 
rem 
rem Permission is hereby granted, free of charge, to any person obtaining
rem a copy of this software and associated documentation files (the
rem "Software"), to deal in the Software without restriction, including
rem without limitation the rights to use, copy, modify, merge, publish,
rem distribute, sublicense, and/or sell copies of the Software, and to
rem permit persons to whom the Software is furnished to do so, subject to
rem the following conditions:
rem 
rem The above copyright notice and this permission notice shall be
rem included in all copies or substantial portions of the Software.
rem 
rem THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
rem EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
rem MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
rem NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
rem LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
rem OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
rem WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
Rem
Rem    NAME
Rem      pcus_v3.sql - <one-line expansion of the name>
Rem
Rem    DESCRIPTION
Rem      <short description of component this file declares/defines>
Rem
Rem    NOTES
Rem      <other useful comments, qualifications, etc.>
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    celsbern    12/08/10 - widening cust_email column for bug 6962986
Rem    ahunold     11/21/02 - Bug 2635796
Rem    ahunold     10/24/02 - Bug 2256987
Rem    hyeh        08/29/02 - hyeh_mv_comschema_to_rdbms
Rem    ahunold     07/22/02 - echo
Rem    ahunold     07/15/02 - ahunold_versions01
Rem    ahunold     07/15/02 - Created
Rem

INSERT INTO customers VALUES 
    (101,'Constantin','Welles',cust_address_typ
    ('514 W Superior St','46901','Kokomo','IN','US'),PHONE_LIST_TYP
    ('+1 317 123 4104'),'us','AMERICA','100','Constantin.Welles@ANHINGA.EXAMPLE.COM',
    149,
    MDSYS.SDO_GEOMETRY(2001, 8307, MDSYS.SDO_POINT_TYPE (-86.13631, 40.485424,NULL),
    NULL,NULL));
INSERT INTO customers VALUES 
    (102,'Harrison','Pacino',cust_address_typ
    ('2515 Bloyd Ave','46218','Indianapolis','IN','US'),PHONE_LIST_TYP
    ('+1 317 123 4111'),'us','AMERICA','100','Harrison.Pacino@ANI.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-86.120133, 39.795766,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (103,'Manisha','Taylor',cust_address_typ
    ('8768 N State Rd 37','47404','Bloomington','IN','US'),PHONE_LIST_TYP
    ('+1 812 123 4115'),'us','AMERICA','100','Manisha.Taylor@AUKLET.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-86.5173, 39.302695,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (104,'Harrison','Sutherland',cust_address_typ
    ('6445 Bay Harbor Ln','46254','Indianapolis','IN','US'),PHONE_LIST_TYP
    ('+1 317 123 4126'),'us','AMERICA','100','Harrison.Sutherland@GODWIT.EXAMPLE.COM', 
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-86.272743, 39.849678,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (105,'Matthias','MacGraw',cust_address_typ
    ('4019 W 3Rd St','47404','Bloomington','IN','US'),PHONE_LIST_TYP
    ('+1 812 123 4129'),'us','AMERICA','100','Matthias.MacGraw@GOLDENEYE.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-86.58332, 39.164783,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (106,'Matthias','Hannah',cust_address_typ
    ('1608 Portage Ave','46616','South Bend','IN','US'),PHONE_LIST_TYP
    ('+1 219 123 4136'),'us','AMERICA','100','Matthias.Hannah@GREBE.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-86.27021, 41.696023,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (107,'Matthias','Cruise',cust_address_typ
    ('23943 Us Highway 33','46517','Elkhart','IN','US'),PHONE_LIST_TYP
    ('+1 219 123 4138'),'us','AMERICA','100','Matthias.Cruise@GROSBEAK.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-85.91393, 41.631143,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (108,'Meenakshi','Mason',cust_address_typ
    ('136 E Market St # 800','46204','Indianapolis','IN','US'),PHONE_LIST_TYP
    ('+1 317 123 4141'),'us','AMERICA','100','Meenakshi.Mason@JACANA.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-86.155533, 39.768174,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (109,'Christian','Cage',cust_address_typ
    ('1905 College St','46628','South Bend','IN','US'),PHONE_LIST_TYP
    ('+1 219 123 4142'),'us','AMERICA','100','Christian.Cage@KINGLET.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-86.27639, 41.701348,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (110,'Charlie','Sutherland',cust_address_typ
    ('3512 Rockville Rd # 137C','46222','Indianapolis','IN','US'),PHONE_LIST_TYP
    ('+1 317 123 4146'),'us','AMERICA','200','Charlie.Sutherland@LIMPKIN.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-86.219783, 39.762173,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (111,'Charlie','Pacino',cust_address_typ
    ('1303 E University St','47401','Bloomington','IN','US'),PHONE_LIST_TYP
    ('+1 812 123 4150'),'us','AMERICA','200','Charlie.Pacino@LONGSPUR.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-86.5175, 39.160261,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (112,'Guillaume','Jackson',cust_address_typ
    ('115 N Weinbach Ave','47711','Evansville','IN','US'),PHONE_LIST_TYP
    ('+1 812 123 4151'),'us','AMERICA','200','Guillaume.Jackson@MOORHEN.EXAMPLE.COM',
    145,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-87.52901, 37.978385,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (113,'Daniel','Costner',cust_address_typ
    ('2067 Rollett Ln','47712','Evansville','IN','US'),PHONE_LIST_TYP
    ('+1 812 123 4153'),'us','AMERICA','200','Daniel.Costner@PARULA.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-87.6354, 37.955373,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (114,'Dianne','Derek',cust_address_typ
    ('1105 E Allendale Dr','47401','Bloomington','IN','US'),PHONE_LIST_TYP
    ('+1 812 123 4157'),'us','AMERICA','200','Dianne.Derek@SAW-WHET.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-86.52167, 39.131013,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (115,'Geraldine','Schneider',cust_address_typ
    ('18305 Van Dyke St','48234','Detroit','MI','US'),PHONE_LIST_TYP
    ('+1 313 123 4159'),'us','AMERICA','200','Geraldine.Schneider@SCAUP.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-83.024565, 42.438298,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (116,'Geraldine','Martin',cust_address_typ
    ('Lucas Dr Bldg 348','48242','Detroit','MI','US'),PHONE_LIST_TYP
    ('+1 313 123 4160'),'us','AMERICA','200','Geraldine.Martin@SCOTER.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-83.366535, 42.206862,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (117,'Guillaume','Edwards',cust_address_typ
    ('1801 Monroe Ave Nw','49505','Grand Rapids','MI','US'),PHONE_LIST_TYP
    ('+1 616 123 4162'),'us','AMERICA','200','Guillaume.Edwards@SHRIKE.EXAMPLE.COM',
    145,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-85.67059, 42.995694,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (118,'Maurice','Mahoney',cust_address_typ
    ('4925 Kendrick St Se','49512','Grand Rapids','MI','US'),PHONE_LIST_TYP
    ('+1 616 123 4181'),'us','AMERICA','200','Maurice.Mahoney@SNIPE.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-85.54467, 42.872615,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (119,'Maurice','Hasan',cust_address_typ
    ('3310 Dixie Ct','48601','Saginaw','MI','US'),PHONE_LIST_TYP
    ('+1 517 123 4191'),'us','AMERICA','200','Maurice.Hasan@STILT.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-83.89048, 43.366886,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (120,'Diane','Higgins',cust_address_typ
    ('113 Washington Sq N','48933','Lansing','MI','US'),PHONE_LIST_TYP
    ('+1 517 123 4199'),'us','AMERICA','200','Diane.Higgins@TANAGER.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-84.55249, 42.733738,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (121,'Dianne','Sen',cust_address_typ
    ('2500 S Pennsylvania Ave','48910','Lansing','MI','US'),PHONE_LIST_TYP
    ('+1 517 123 4201'),'us','AMERICA','200','Dianne.Sen@TATTLER.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-84.53837, 42.706292,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (122,'Maurice','Daltrey',cust_address_typ
    ('3213 S Cedar St','48910','Lansing','MI','US'),PHONE_LIST_TYP
    ('+1 517 123 4206'),'us','AMERICA','200','Maurice.Daltrey@TEAL.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-84.54811, 42.698823,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (123,'Elizabeth','Brown',cust_address_typ
    ('8110 Jackson Rd','48103','Ann Arbor','MI','US'),PHONE_LIST_TYP
    ('+1 313 123 4219'),'us','AMERICA','200','Elizabeth.Brown@THRASHER.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-83.890694, 42.292947,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (124,'Diane','Mason',cust_address_typ
    ('6654 W Lafayette St','48226','Detroit','MI','US'),PHONE_LIST_TYP
    ('+1 313 123 4222'),'us','AMERICA','200','Diane.Mason@TROGON.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-83.049285, 42.330868,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (125,'Dianne','Andrews',cust_address_typ
    ('27 Benton Rd','48602','Saginaw','MI','US'),PHONE_LIST_TYP
    ('+1 517 123 4225'),'us','AMERICA','200','Dianne.Andrews@TURNSTONE.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-83.99558, 43.412702,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (126,'Charles','Field',cust_address_typ
    ('8201 Livernois Ave','48204','Detroit','MI','US'),PHONE_LIST_TYP
    ('+1 313 123 4226'),'us','AMERICA','300','Charles.Field@BECARD.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-83.137545, 42.354686,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (127,'Charles','Broderick',cust_address_typ
    ('101 N Falahee Rd','49203','Jackson','MI','US'),PHONE_LIST_TYP
    ('+1 517 123 4228'),'us','AMERICA','300','Charles.Broderick@BITTERN.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-84.34679, 42.238519,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (128,'Isabella','Reed',cust_address_typ
    ('3100 E Eisenhower Pky # 100','48108','Ann Arbor','MI','US'),PHONE_LIST_TYP
    ('+1 313 123 4230'),'us','AMERICA','300','Isabella.Reed@BRANT.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-83.716754, 42.244284,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (129,'Louis','Jackson',cust_address_typ
    ('952 Vassar Dr','49001','Kalamazoo','MI','US'),PHONE_LIST_TYP
    ('+1 616 123 4234'),'us','AMERICA','400','Louis.Jackson@CARACARA.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-85.56744, 42.262007,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (130,'Louis','Edwards',cust_address_typ
    ('150 W Jefferson Ave # 2500','48226','Detroit','MI','US'),PHONE_LIST_TYP
    ('+1 313 123 4242'),'us','AMERICA','400','Louis.Edwards@CHACHALACA.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-83.046195, 42.32827,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (131,'Doris','Dutt',cust_address_typ
    ('40 Pearl St Nw # 1020','49503','Grand Rapids','MI','US'),PHONE_LIST_TYP
    ('+1 616 123 4245'),'us','AMERICA','400','Doris.Dutt@CHUKAR.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-85.66949, 42.966096,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (132,'Doris','Spacek',cust_address_typ
    ('1135 Catherine St','48109','Ann Arbor','MI','US'),PHONE_LIST_TYP
    ('+1 313 123 4248'),'us','AMERICA','400','Doris.Spacek@FLICKER.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-83.715384, 42.290596,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (133,'Kristin','Malden',cust_address_typ
    ('301 E Genesee Ave','48607','Saginaw','MI','US'),PHONE_LIST_TYP
    ('+1 517 123 4253'),'us','AMERICA','400','Kristin.Malden@GODWIT.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-83.93747, 43.432862,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (134,'Sissy','Puri',cust_address_typ
    ('9936 Dexter Ave','48206','Detroit','MI','US'),PHONE_LIST_TYP
    ('+1 313 123 4255'),'us','AMERICA','400','Sissy.Puri@GREBE.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-83.121065, 42.374977,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (135,'Doris','Bel Geddes',cust_address_typ
    ('1660 University Ter','48104','Ann Arbor','MI','US'),PHONE_LIST_TYP
    ('+1 313 123 4263'),'us','AMERICA','400','Doris.BelGeddes@GROSBEAK.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-83.727334, 42.281681,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (136,'Sissy','Warden',cust_address_typ
    ('15713 N East St','48906','Lansing','MI','US'),PHONE_LIST_TYP
    ('+1 517 123 4265'),'us','AMERICA','400','Sissy.Warden@JACANA.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-84.54281, 42.7886,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (137,'Elia','Brando',cust_address_typ
    ('555 John F Kennedy Rd','52002','Dubuque','IA','US'),PHONE_LIST_TYP
    ('+1 319 123 4271'),'us','AMERICA','500','Elia.Brando@JUNCO.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-90.72012, 42.496103,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (138,'Mani','Fonda',cust_address_typ
    ('10315 Hickman Rd','50322','Des Moines','IA','US'),PHONE_LIST_TYP
    ('+1 515 123 4273'),'us','AMERICA','500','Mani.Fonda@KINGLET.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-93.75829, 41.614875,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (139,'Placido','Kubrick',cust_address_typ
    ('2115 N Towne Ln Ne','52402','Cedar Rapids','IA','US'),PHONE_LIST_TYP
    ('+1 319 123 4278'),'us','AMERICA','500','Placido.Kubrick@SCOTER.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-91.6714, 42.032886,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (140,'Claudia','Kurosawa',cust_address_typ
    ('1928 Sherwood Dr','51503','Council Bluffs','IA','US'),PHONE_LIST_TYP
    ('+1 712 123 4280'),'us','AMERICA','500','Claudia.Kurosawa@CHUKAR.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-95.81115, 41.276064,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (141,'Maximilian','Henner',cust_address_typ
    ('2102 E Kimberly Rd','52807','Davenport','IA','US'),PHONE_LIST_TYP
    ('+1 319 123 4282'),'us','AMERICA','500','Maximilian.Henner@DUNLIN.EXAMPLE.COM',
    145,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-90.54472, 41.5566,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (142,'Sachin','Spielberg',cust_address_typ
    ('1691 Asbury Rd','52001','Dubuque','IA','US'),PHONE_LIST_TYP
    ('+1 319 123 4288'),'us','AMERICA','500','Sachin.Spielberg@GADWALL.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-90.69686, 42.500903,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (143,'Sachin','Neeson',cust_address_typ
    ('5112 Sw 9Th St','50315','Des Moines','IA','US'),PHONE_LIST_TYP
    ('+1 515 123 4290'),'us','AMERICA','500','Sachin.Neeson@GALLINULE.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-93.62554, 41.537188,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (144,'Sivaji','Landis',cust_address_typ
    ('221 3Rd Ave Se # 300','52401','Cedar Rapids','IA','US'),PHONE_LIST_TYP
    ('+1 319 123 4301'),'us','AMERICA','500','Sivaji.Landis@GOLDENEYE.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-91.66643, 41.977151,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (145,'Mammutti','Pacino',cust_address_typ
    ('2120 Heights Dr','54701','Eau Claire','WI','US'),PHONE_LIST_TYP
    ('+1 745 123 4306'),'us','AMERICA','500','Mammutti.Pacino@GREBE.EXAMPLE.COM',
    145,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-91.51556, 44.795509,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (146,'Elia','Fawcett',cust_address_typ
    ('8989 N Port Washington Rd','53217','Milwaukee','WI','US'),PHONE_LIST_TYP
    ('+1 414 123 4307'),'us','AMERICA','500','Elia.Fawcett@JACANA.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-87.91422, 43.180714,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (147,'Ishwarya','Roberts',cust_address_typ
    ('6555 W Good Hope Rd','53223','Milwaukee','WI','US'),PHONE_LIST_TYP
    ('+1 414 123 4308'),'us','AMERICA','600','Ishwarya.Roberts@LAPWING.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-87.99294, 43.148558,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (148,'Gustav','Steenburgen',cust_address_typ
    ('1314 N Stoughton Rd','53714','Madison','WI','US'),PHONE_LIST_TYP
    ('+1 608 123 4309'),'us','AMERICA','600','Gustav.Steenburgen@PINTAIL.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-89.32103, 43.11362,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (149,'Markus','Rampling',cust_address_typ
    ('4715 Sprecher Rd','53704','Madison','WI','US'),PHONE_LIST_TYP
    ('+1 608 123 4318'),'us','AMERICA','600','Markus.Rampling@PUFFIN.EXAMPLE.COM',
    145,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-89.31665, 43.130717,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (150,'Goldie','Slater',cust_address_typ
    ('6161 N 64Th St','53218','Milwaukee','WI','US'),PHONE_LIST_TYP
    ('+1 414 123 4323'),'us','AMERICA','700','Goldie.Slater@PYRRHULOXIA.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-87.99083, 43.130205,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (151,'Divine','Aykroyd',cust_address_typ
    ('11016 W Lincoln Ave','53227','Milwaukee','WI','US'),PHONE_LIST_TYP
    ('+1 414 123 4324'),'us','AMERICA','700','Divine.Aykroyd@REDSTART.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-88.049291, 43.00271,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (152,'Dieter','Matthau',cust_address_typ
    ('8600 W National Ave','53227','Milwaukee','WI','US'),PHONE_LIST_TYP
    ('+1 414 123 4328'),'us','AMERICA','700','Dieter.Matthau@VERDIN.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (0, NULL,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (153,'Divine','Sheen',cust_address_typ
    ('615 N Sherman Ave','53704','Madison','WI','US'),PHONE_LIST_TYP
    ('+1 608 123 4332'),'us','AMERICA','700','Divine.Sheen@COWBIRD.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-89.3638, 43.107253,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (154,'Frederic','Grodin',cust_address_typ
    ('512 E Grand Ave','53511','Beloit','WI','US'),PHONE_LIST_TYP
    ('+1 608 123 4344'),'us','AMERICA','700','Frederic.Grodin@CREEPER.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-89.03216, 42.499575,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (155,'Frederico','Romero',cust_address_typ
    ('600 N Broadway Fl 1','53202','Milwaukee','WI','US'),PHONE_LIST_TYP
    ('+1 414 123 4347'),'us','AMERICA','700','Frederico.Romero@CURLEW.EXAMPLE.COM',
    145,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-87.90777, 43.037372,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (156,'Goldie','Montand',cust_address_typ
    ('5235 N Ironwood Ln','53217','Milwaukee','WI','US'),PHONE_LIST_TYP
    ('+1 414 123 4348'),'us','AMERICA','700','Goldie.Montand@DIPPER.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-87.91841, 43.113239,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (157,'Sidney','Capshaw',cust_address_typ
    ('322 E Michigan St','53202','Milwaukee','WI','US'),PHONE_LIST_TYP
    ('+1 414 123 4350'),'us','AMERICA','700','Sidney.Capshaw@DUNLIN.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-87.90745, 43.037389,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (158,'Frederico','Lyon',cust_address_typ
    ('1400 Bellinger St Fl 4','54703','Eau Claire','WI','US'),PHONE_LIST_TYP
    ('+1 745 123 4367'),'us','AMERICA','700','Frederico.Lyon@FLICKER.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-91.51112, 44.813529,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (159,'Eddie','Boyer',cust_address_typ
    ('411 E Wisconsin Ave # 2550','53202','Milwaukee','WI','US'),PHONE_LIST_TYP
    ('+1 414 123 4369'),'us','AMERICA','700','Eddie.Boyer@GALLINULE.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-87.90645, 43.038621,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (160,'Eddie','Stern',cust_address_typ
    ('808 3Rd St # 100','54403','Wausau','WI','US'),PHONE_LIST_TYP
    ('+1 715 123 4372'),'us','AMERICA','700','Eddie.Stern@GODWIT.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-89.62748, 44.963124,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (161,'Ernest','Weaver',cust_address_typ
    ('300 Crooks St','54301','Green Bay','WI','US'),PHONE_LIST_TYP
    ('+1 414 123 4373'),'us','AMERICA','900','Ernest.Weaver@GROSBEAK.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-88.01714, 44.510237,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (162,'Ernest','George',cust_address_typ
    ('122 E Dayton St','53703','Madison','WI','US'),PHONE_LIST_TYP
    ('+1 608 123 4374'),'us','AMERICA','900','Ernest.George@LAPWING.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-89.38472, 43.077067,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (163,'Ernest','Chandar',cust_address_typ
    ('633 S Hawley Rd','53214','Milwaukee','WI','US'),PHONE_LIST_TYP
    ('+1 414 123 4376'),'us','AMERICA','900','Ernest.Chandar@LIMPKIN.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-87.98592, 43.025362,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (164,'Charlotte','Kazan',cust_address_typ
    ('2122 Campbell Rd','54601','La Crosse','WI','US'),PHONE_LIST_TYP
    ('+1 608 123 4378'),'us','AMERICA','1200','Charlotte.Kazan@MERGANSER.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-91.22433, 43.815379,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (165,'Charlotte','Fonda',cust_address_typ
    ('3324 N Oakland Ave','53211','Milwaukee','WI','US'),PHONE_LIST_TYP
    ('+1 414 123 4381'),'us','AMERICA','1200','Charlotte.Fonda@MOORHEN.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-87.88781, 43.078038,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (166,'Dheeraj','Alexander',cust_address_typ
    ('666 22Nd Ave Ne','55418','Minneapolis','MN','US'),PHONE_LIST_TYP
    ('+1 612 123 4397'),'us','AMERICA','1200','Dheeraj.Alexander@NUTHATCH.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-93.25421, 45.009864,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (167,'Gerard','Hershey',cust_address_typ
    ('1501 Lowry Ave N','55411','Minneapolis','MN','US'),PHONE_LIST_TYP
    ('+1 612 123 4399'),'us','AMERICA','1200','Gerard.Hershey@PARULA.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-93.29798, 45.01319,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (168,'Hema','Voight',cust_address_typ
    ('113 N 1St St','55401','Minneapolis','MN','US'),PHONE_LIST_TYP
    ('+1 612 123 4408'),'us','AMERICA','1200','Hema.Voight@PHALAROPE.EXAMPLE.COM',
    145,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-93.26806, 44.984747,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (169,'Dheeraj','Davis',cust_address_typ
    ('4200 Yosemite Ave S','55416','Minneapolis','MN','US'),PHONE_LIST_TYP
    ('+1 612 123 4417'),'us','AMERICA','1200','Dheeraj.Davis@PIPIT.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-93.35285, 44.924115,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (170,'Harry Dean','Fonda',cust_address_typ
    ('2800 Chicago Ave # 100','55407','Minneapolis','MN','US'),PHONE_LIST_TYP
    ('+1 612 123 4419'),'us','AMERICA','1200','HarryDean.Fonda@PLOVER.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-93.26233, 44.951875,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (171,'Hema','Powell',cust_address_typ
    ('200 1St St Sw','55905','Rochester','MN','US'),PHONE_LIST_TYP
    ('+1 507 123 4421'),'us','AMERICA','1200','Hema.Powell@SANDERLING.EXAMPLE.COM',
    145,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-92.46698, 44.021392,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (172,'Harry Mean','Peckinpah',cust_address_typ
    ('314 W Superior St # 1015','55802','Duluth','MN','US'),PHONE_LIST_TYP
    ('+1 218 123 4429'),'us','AMERICA','1200','HarryMean.Peckinpah@VERDIN.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (0, NULL,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (173,'Kathleen','Walken',cust_address_typ
    ('1409 Willow St # 600','55403','Minneapolis','MN','US'),PHONE_LIST_TYP
    ('+1 612 123 4434'),'us','AMERICA','1200','Kathleen.Walken@VIREO.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-93.28193, 44.968631,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (174,'Blake','Seignier',cust_address_typ
    ('2720 Brewerton Rd','13211','Syracuse','NY','US'),PHONE_LIST_TYP
    ('+1 315 123 4442'),'us','AMERICA','1200','Blake.Seignier@GALLINULE.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-76.14607, 43.106533,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (175,'Claude','Powell',cust_address_typ
    ('2134 W Genesee St','13219','Syracuse','NY','US'),PHONE_LIST_TYP
    ('+1 315 123 4447'),'us','AMERICA','1200','Claude.Powell@GODWIT.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-76.19845, 43.047707,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (176,'Faye','Glenn',cust_address_typ
    ('1522 Main St','14305','Niagara Falls','NY','US'),PHONE_LIST_TYP
    ('+1 716 123 4457'),'us','AMERICA','1200','Faye.Glenn@GREBE.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-79.05241, 43.102789,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (177,'Gerhard','Seignier',cust_address_typ
    ('49 N Pine Ave','12203','Albany','NY','US'),PHONE_LIST_TYP
    ('+1 518 123 4459'),'us','AMERICA','1200','Gerhard.Seignier@JACANA.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-73.7927, 42.668507,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (178,'Grace','Belushi',cust_address_typ
    ('726 Union St','12534','Hudson','NY','US'),PHONE_LIST_TYP
    ('+1 518 123 4464'),'us','AMERICA','1200',
    'Grace.Belushi@KILLDEER.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-73.784949, 42.246766,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (179,'Harry dean','Forrest',cust_address_typ
    ('137 Lark St','12210','Albany','NY','US'),PHONE_LIST_TYP
    ('+1 518 123 4474'),'us','AMERICA','1200',
    'Harrydean.Forrest@KISKADEE.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-73.76188, 42.658418,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (180,'Harry dean','Cage',cust_address_typ
    ('33 Fulton St','12601','Poughkeepsie','NY','US'),PHONE_LIST_TYP
    ('+1 914 123 4494'),'us','AMERICA','1200',
    'Harrydean.Cage@LAPWING.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-73.928561, 41.723468,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (181,'Lauren','Hershey',cust_address_typ
    ('2360 Maxon Rd','12308','Schenectady','NY','US'),PHONE_LIST_TYP
    ('+1 518 123 4496'),'us','AMERICA','1200',
    'Lauren.Hershey@LIMPKIN.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-73.91984, 42.833987,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (182,'Lauren','Dench',cust_address_typ
    ('85 High St','14203','Buffalo','NY','US'),PHONE_LIST_TYP
    ('+1 716 123 4575'),'us','AMERICA','1200',
    'Lauren.Dench@LONGSPUR.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-78.86586, 42.900169,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (183,'Lauren','Altman',cust_address_typ
    ('1 Palisade Ave Fl 2','10701','Yonkers','NY','US'),PHONE_LIST_TYP
    ('+1 914 123 4578'),'us','AMERICA','1200','Lauren.Altman@MERGANSER.EXAMPLE.COM',
    145,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-73.89811, 40.933646,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (184,'Mary Beth','Roberts',cust_address_typ
    ('500 S Salina St # 500','13202','Syracuse','NY','US'),PHONE_LIST_TYP
    ('+1 315 123 4597'),'us','AMERICA','1200','MaryBeth.Roberts@NUTHATCH.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-76.15252, 43.044258,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (185,'Matthew','Wright',cust_address_typ
    ('33 Pine St','14094','Lockport','NY','US'),PHONE_LIST_TYP
    ('+1 716 123 4599'),'us','AMERICA','1200','Matthew.Wright@OVENBIRD.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-78.69231, 43.169422,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (186,'Meena','Alexander',cust_address_typ
    ('Po Box 2152','14240','Buffalo','NY','US'),PHONE_LIST_TYP
    ('+1 716 123 4605'),'us','AMERICA','1200','Meena.Alexander@PARULA.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-78.82672, 42.884822,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (187,'Grace','Dvrrie',cust_address_typ
    ('2979 Hamburg St','12303','Schenectady','NY','US'),PHONE_LIST_TYP
    ('+1 518 123 4617'),'us','AMERICA','1200','Grace.Dvrrie@PHOEBE.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-73.93703, 42.76779,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (188,'Charlotte','Buckley',cust_address_typ
    ('1790 Grand Blvd','12309','Schenectady','NY','US'),PHONE_LIST_TYP
    ('+1 518 123 4618'),'us','AMERICA','1200','Charlotte.Buckley@PINTAIL.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-73.90567, 42.814971,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (189,'Gena','Harris',cust_address_typ
    ('7 Ingelside Ln','10605','White Plains','NY','US'),PHONE_LIST_TYP
    ('+1 914 123 4619'),'us','AMERICA','1200','Gena.Harris@PIPIT.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-73.7369, 40.999002,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (190,'Gena','Curtis',cust_address_typ
    ('18 Glenridge Rd','12302','Schenectady','NY','US'),PHONE_LIST_TYP
    ('+1 518 123 4624'),'us','AMERICA','1200','Gena.Curtis@PLOVER.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-73.92997, 42.868566,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (191,'Maureen','Sanders',cust_address_typ
    ('6432 Rising Sun Ave','19111','Philadelphia','PA','US'),PHONE_LIST_TYP
    ('+1 215 123 4644'),'us','AMERICA','1200','Maureen.Sanders@PUFFIN.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-75.095, 40.050359,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (192,'Sean','Stockwell',cust_address_typ
    ('Rr 10','19606','Reading','PA','US'),PHONE_LIST_TYP
    ('+1 610 123 4657'),'us','AMERICA','1200','Sean.Stockwell@PYRRHULOXIA.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-75.85273, 40.333337,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (193,'Harry dean','Kinski',cust_address_typ
    ('2455 Rose Garden Rd','15220','Pittsburgh','PA','US'),PHONE_LIST_TYP
    ('+1 412 123 4662'),'us','AMERICA','1200','Harrydean.Kinski@REDPOLL.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-80.045732, 40.407729,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (194,'Kathleen','Garcia',cust_address_typ
    ('1812 Timberline Rd','16601','Altoona','PA','US'),PHONE_LIST_TYP
    ('+1 814 123 4663'),'us','AMERICA','1200','Kathleen.Garcia@REDSTART.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-78.44857, 40.487139,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (195,'Sean','Olin',cust_address_typ
    ('141 Schiller St','19601','Reading','PA','US'),PHONE_LIST_TYP
    ('+1 610 123 4664'),'us','AMERICA','1200','Sean.Olin@SCAUP.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-75.93642, 40.342217,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (196,'Gerard','Dench',cust_address_typ
    ('1126 Pawlings Rd','19403','Norristown','PA','US'),PHONE_LIST_TYP
    ('+1 610 123 4667'),'us','AMERICA','1200','Gerard.Dench@SCOTER.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-75.432962, 40.126981,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (197,'Gerard','Altman',cust_address_typ
    ('55 Church Hill Rd','19606','Reading','PA','US'),PHONE_LIST_TYP
    ('+1 610 123 4669'),'us','AMERICA','1200','Gerard.Altman@SHRIKE.EXAMPLE.COM',
    145,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-75.85054, 40.359876,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (198,'Maureen','de Funes',cust_address_typ
    ('354 N Prince St','17603','Lancaster','PA','US'),PHONE_LIST_TYP
    ('+1 717 123 4674'),'us','AMERICA','1200','Maureen.deFunes@SISKIN.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-76.30895, 40.043037,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (199,'Clint','Chapman',cust_address_typ
    ('115 Chestnut St','19106','Philadelphia','PA','US'),PHONE_LIST_TYP
    ('+1 215 123 4676'),'us','AMERICA','1400','Clint.Chapman@SNIPE.EXAMPLE.COM',
    145,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-75.14343, 39.94801,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (200,'Clint','Gielgud',cust_address_typ
    ('2899 Grand Ave','15225','Pittsburgh','PA','US'),PHONE_LIST_TYP
    ('+1 412 123 4681'),'us','AMERICA','1400','Clint.Gielgud@STILT.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-80.117174, 40.508616,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (201,'Eric','Prashant',cust_address_typ
    ('Po Box 39','15701','Indiana','PA','US'),PHONE_LIST_TYP
    ('+1 412 123 4684'),'us','AMERICA','1400','Eric.Prashant@TATTLER.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-79.151699, 40.620971,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (202,'Ingrid','Welles',cust_address_typ
    ('1604 Broadway Ave','15216','Pittsburgh','PA','US'),PHONE_LIST_TYP
    ('+1 412 123 4688'),'us','AMERICA','1400','Ingrid.Welles@TEAL.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-80.024861, 40.410256,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (203,'Ingrid','Rampling',cust_address_typ
    ('4734 Liberty Ave','15224','Pittsburgh','PA','US'),PHONE_LIST_TYP
    ('+1 412 123 4691'),'us','AMERICA','1400','Ingrid.Rampling@WIGEON.EXAMPLE.COM',
    145,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-79.94906, 40.461561,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (204,'Cliff','Puri',cust_address_typ
    ('21 Thornwood Rd','17112','Harrisburg','PA','US'),PHONE_LIST_TYP
    ('+1 717 123 4692'),'us','AMERICA','1400','Cliff.Puri@CORMORANT.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-76.80393, 40.314701,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (205,'Emily','Pollack',cust_address_typ
    ('3725 W Lake Rd','16505','Erie','PA','US'),PHONE_LIST_TYP
    ('+1 814 123 4696'),'us','AMERICA','1400','Emily.Pollack@DIPPER.EXAMPLE.COM',
    145,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-80.16936, 42.097165,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (206,'Fritz','Hackman',cust_address_typ
    ('1808 4Th Ave','16602','Altoona','PA','US'),PHONE_LIST_TYP
    ('+1 814 123 4697'),'us','AMERICA','1400','Fritz.Hackman@DUNLIN.EXAMPLE.COM',
    145,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-78.399501, 40.505884,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (207,'Cybill','Laughton',cust_address_typ
    ('Station Sq','15219','Pittsburgh','PA','US'),PHONE_LIST_TYP
    ('+1 412 123 4700'),'us','AMERICA','1400','Cybill.Laughton@EIDER.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-79.9818, 40.443237,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (208,'Cyndi','Griem',cust_address_typ
    ('4020 Garden Ave','16508','Erie','PA','US'),PHONE_LIST_TYP
    ('+1 814 123 4706'),'us','AMERICA','1400','Cyndi.Griem@GALLINULE.EXAMPLE.COM',
    145,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-80.11026, 42.083634,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (209,'Cyndi','Collins',cust_address_typ
    ('100 N Peach St','19139','Philadelphia','PA','US'),PHONE_LIST_TYP
    ('+1 215 123 4708'),'us','AMERICA','1400','Cyndi.Collins@GODWIT.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-75.22731, 39.961649,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (210,'Cybill','Clapton',cust_address_typ
    ('835 Heister Ln','19605','Reading','PA','US'),PHONE_LIST_TYP
    ('+1 610 123 4714'),'us','AMERICA','1400','Cybill.Clapton@GOLDENEYE.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-75.92064, 40.364485,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (211,'Luchino','Jordan',cust_address_typ
    ('378 S Negley Ave','15232','Pittsburgh','PA','US'),PHONE_LIST_TYP
    ('+1 412 123 4718'),'us','AMERICA','1500','Luchino.Jordan@GREBE.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-79.93347, 40.459305,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (212,'Luchino','Falk',cust_address_typ
    ('5643 N 5Th St','19120','Philadelphia','PA','US'),PHONE_LIST_TYP
    ('+1 215 123 4721'),'us','AMERICA','1500','Luchino.Falk@OVENBIRD.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-75.13043, 40.036595,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (213,'Luchino','Bradford',cust_address_typ
    ('1401 W Warren Rd','16701','Bradford','PA','US'),PHONE_LIST_TYP
    ('+1 814 123 4722'),'us','AMERICA','1500','Luchino.Bradford@PARULA.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-78.651424, 41.905571,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (214,'Robin','Danson',cust_address_typ
    ('815 Freeport Rd','15215','Pittsburgh','PA','US'),PHONE_LIST_TYP
    ('+1 412 123 4724'),'us','AMERICA','1500','Robin.Danson@PHAINOPEPLA.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-79.896621, 40.487805,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (215,'Orson','Perkins',cust_address_typ
    ('327 N Washington Ave # 300','18503','Scranton','PA','US'),PHONE_LIST_TYP
    ('+1 717 123 4730'),'us','AMERICA','1900','Orson.Perkins@PINTAIL.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-75.662181, 41.409215,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (216,'Orson','Koirala',cust_address_typ
    ('810 Race St','19107','Philadelphia','PA','US'),PHONE_LIST_TYP
    ('+1 215 123 4738'),'us','AMERICA','1900','Orson.Koirala@PIPIT.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-75.15289, 39.95474,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (217,'Bryan','Huston',cust_address_typ
    ('4901 Locust Ln','17109','Harrisburg','PA','US'),PHONE_LIST_TYP
    ('+1 717 123 4739'),'us','AMERICA','2300','Bryan.Huston@PYRRHULOXIA.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-76.80639, 40.293213,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (218,'Bryan','Dvrrie',cust_address_typ
    ('3376 Perrysville Ave','15214','Pittsburgh','PA','US'),PHONE_LIST_TYP
    ('+1 412 123 4740'),'us','AMERICA','2300','Bryan.Dvrrie@REDPOLL.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-80.014072, 40.481972,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (219,'Ajay','Sen',cust_address_typ
    ('220 Penn Ave # 300','18503','Scranton','PA','US'),PHONE_LIST_TYP
    ('+1 717 123 4741'),'us','AMERICA','2300','Ajay.Sen@TROGON.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-75.666231, 41.409595,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (220,'Carol','Jordan',cust_address_typ
    ('135 S 18Th St # 1','19103','Philadelphia','PA','US'),PHONE_LIST_TYP
    ('+1 215 123 4743'),'us','AMERICA','2300','Carol.Jordan@TURNSTONE.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-75.17787, 39.949455,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (221,'Carol','Bradford',cust_address_typ
    ('522 Swede St','19401','Norristown','PA','US'),PHONE_LIST_TYP
    ('+1 610 123 4744'),'us','AMERICA','2300','Carol.Bradford@VERDIN.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-75.343572, 40.11615,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (222,'Cary','Stockwell',cust_address_typ
    ('7708 City Ave','19151','Philadelphia','PA','US'),PHONE_LIST_TYP
    ('+1 215 123 4745'),'us','AMERICA','2300','Cary.Stockwell@VIREO.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-75.278794, 39.975525,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (223,'Cary','Olin',cust_address_typ
    ('1801 Lititz Pike','17601','Lancaster','PA','US'),PHONE_LIST_TYP
    ('+1 717 123 4746'),'us','AMERICA','2300','Cary.Olin@WATERTHRUSH.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-76.30826, 40.07257,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (224,'Clara','Krige',cust_address_typ
    ('101 E Olney Ave','19120','Philadelphia','PA','US'),PHONE_LIST_TYP
    ('+1 215 123 4748'),'us','AMERICA','2300','Clara.Krige@WHIMBREL.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-75.12021, 40.034937,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (225,'Clara','Ganesan',cust_address_typ
    ('612 Jefferson Ave','18510','Scranton','PA','US'),PHONE_LIST_TYP
    ('+1 717 123 4752'),'us','AMERICA','2300','Clara.Ganesan@WIGEON.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-75.655941, 41.411024,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (226,'Ajay','Andrews',cust_address_typ
    ('223 4Th Ave # 1100','15222','Pittsburgh','PA','US'),PHONE_LIST_TYP
    ('+1 412 123 4763'),'us','AMERICA','2300','Ajay.Andrews@YELLOWTHROAT.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-80.0027, 40.439706,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (227,'Kathy','Prashant',cust_address_typ
    ('36 W 34Th St','16508','Erie','PA','US'),PHONE_LIST_TYP
    ('+1 814 123 4766'),'us','AMERICA','2400','Kathy.Prashant@ANI.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-80.07008, 42.105437,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (228,'Graham','Neeson',cust_address_typ
    ('1007 Mount Royal Blvd','15223','Pittsburgh','PA','US'),PHONE_LIST_TYP
    ('+1 412 123 4767'),'us','AMERICA','2400','Graham.Neeson@AUKLET.EXAMPLE.COM',
    145,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-79.959364, 40.516644,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (229,'Ian','Chapman',cust_address_typ
    ('601 Market St','19106','Philadelphia','PA','US'),PHONE_LIST_TYP
    ('+1 215 123 4768'),'us','AMERICA','2400','Ian.Chapman@AVOCET.EXAMPLE.COM',
    145,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-75.15065, 39.950394,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (230,'Danny','Wright',cust_address_typ
    ('5565 Baynton St','19144','Philadelphia','PA','US'),PHONE_LIST_TYP
    ('+1 215 123 4771'),'us','AMERICA','2400','Danny.Wright@BITTERN.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-75.16979, 40.036941,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (231,'Danny','Rourke',cust_address_typ
    ('5640 Fishers Ln','20852','Rockville','MD','US'),PHONE_LIST_TYP
    ('+1 301 123 4794'),'us','AMERICA','2400','Danny.Rourke@BRANT.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-77.115297, 39.062872,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (232,'Donald','Hunter',cust_address_typ
    ('5122 Sinclair Ln','21206','Baltimore','MD','US'),PHONE_LIST_TYP
    ('+1 410 123 4795'),'us','AMERICA','2400','Donald.Hunter@CHACHALACA.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-76.545732, 39.322775,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (233,'Graham','Spielberg',cust_address_typ
    ('680 Bel Air Rd','21014','Bel Air','MD','US'),PHONE_LIST_TYP
    ('+1 410 123 4800'),'us','AMERICA','2400','Graham.Spielberg@CHUKAR.EXAMPLE.COM',
    145,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-76.357073, 39.523878,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (234,'Dan','Roberts',cust_address_typ
    ('4301 Ashland Ave','21205','Baltimore','MD','US'),PHONE_LIST_TYP
    ('+1 410 123 4805'),'us','AMERICA','2400','Dan.Roberts@NUTHATCH.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-76.561682, 39.301622,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (235,'Edward','Oates',cust_address_typ
    ('8004 Stansbury Rd','21222','Baltimore','MD','US'),PHONE_LIST_TYP
    ('+1 410 012 4715', '+1 410 083 4715'),'us','AMERICA','2400','Edward.Oates@OVENBIRD.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-76.500344, 39.25618,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (236,'Edward','Julius',cust_address_typ
    ('10209 Yearling Dr','20850','Rockville','MD','US'),PHONE_LIST_TYP
    ('+1 301 123 4809'),'us','AMERICA','2400','Edward.Julius@PARULA.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-77.212047, 39.098763,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (237,'Farrah','Quinlan',cust_address_typ
    ('3000 Greenmount Ave','21218','Baltimore','MD','US'),PHONE_LIST_TYP
    ('+1 410 123 4812'),'us','AMERICA','2400','Farrah.Quinlan@PHAINOPEPLA.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-76.609501, 39.324878,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (238,'Farrah','Lange',cust_address_typ
    ('200 E Fort Ave','21230','Baltimore','MD','US'),PHONE_LIST_TYP
    ('+1 410 123 4813'),'us','AMERICA','2400','Farrah.Lange@PHALAROPE.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-76.610142, 39.272749,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (239,'Hal','Stockwell',cust_address_typ
    ('1262 Vocke Rd','21502','Cumberland','MD','US'),PHONE_LIST_TYP
    ('+1 301 123 4814'),'us','AMERICA','2400','Hal.Stockwell@PHOEBE.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (0, NULL,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (240,'Malcolm','Kanth',cust_address_typ
    ('3314 Eastern Ave','21224','Baltimore','MD','US'),PHONE_LIST_TYP
    ('+1 410 123 4816'),'us','AMERICA','2400','Malcolm.Kanth@PIPIT.EXAMPLE.COM',
    145,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-76.570102, 39.28652,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (241,'Malcolm','Broderick',cust_address_typ
    ('12817 Coastal Hwy','21842','Ocean City','MD','US'),PHONE_LIST_TYP
    ('+1 410 123 4817'),'us','AMERICA','2400','Malcolm.Broderick@PLOVER.EXAMPLE.COM',
    145,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-75.056879, 38.422394,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (242,'Mary','Lemmon',cust_address_typ
    ('11200 Scaggsville Rd','20723','Laurel','MD','US'),PHONE_LIST_TYP
    ('+1 301 123 4818'),'us','AMERICA','2400','Mary.Lemmon@PUFFIN.EXAMPLE.COM',
    145,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-76.904846, 39.138404,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (243,'Mary','Collins',cust_address_typ
    ('9435 Washington Blvd N # M','20723','Laurel','MD','US'),PHONE_LIST_TYP
    ('+1 301 123 4819'),'us','AMERICA','2400','Mary.Collins@PYRRHULOXIA.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-76.830336, 39.117905,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (244,'Matt','Gueney',cust_address_typ
    ('2300 Harford Rd','21218','Baltimore','MD','US'),PHONE_LIST_TYP
    ('+1 410 123 4822'),'us','AMERICA','2400','Matt.Gueney@REDPOLL.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-76.5969, 39.315728,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (245,'Max','von Sydow',cust_address_typ
    ('2 2Nd St # A','21842','Ocean City','MD','US'),PHONE_LIST_TYP
    ('+1 410 123 4840'),'us','AMERICA','2400','Max.vonSydow@REDSTART.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-75.084509, 38.333211,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (246,'Max','Schell',cust_address_typ
    ('6917 W Oklahoma Ave','53219','Milwaukee','WI','US'),PHONE_LIST_TYP
    ('+1 414 123 4363'),'us','AMERICA','2400','Max.Schell@SANDERLING.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-87.99935, 42.988358,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (247,'Cynda','Whitcraft',cust_address_typ
    ('206 S Broadway # 707','55904','Rochester','MN','US'),PHONE_LIST_TYP
    ('+1 507 123 4387'),'us','AMERICA','2400','Cynda.Whitcraft@SANDPIPER.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-92.46291, 44.021356,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (248,'Donald','Minnelli',cust_address_typ
    ('160 Glenwood Ave','55405','Minneapolis','MN','US'),PHONE_LIST_TYP
    ('+1 612 123 4436'),'us','AMERICA','2400','Donald.Minnelli@SCAUP.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-93.28336, 44.979113,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (249,'Hannah','Broderick',cust_address_typ
    ('6915 Grand Ave','46323','Hammond','IN','US'),PHONE_LIST_TYP
    ('+1 219 123 4145'),'us','AMERICA','2400','Hannah.Broderick@SHRIKE.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-87.44218, 41.587639,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (250,'Dan','Williams',cust_address_typ
    ('2215 Oak Industrial Dr Ne','49505','Grand Rapids','MI','US'),PHONE_LIST_TYP
    ('+1 616 123 4190'),'us','AMERICA','2400','Dan.Williams@SISKIN.EXAMPLE.COM',
    145,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-85.61161, 42.975227,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (251,'Raul','Wilder',cust_address_typ
    ('65 Cadillac Sq # 2701','48226','Detroit','MI','US'),PHONE_LIST_TYP
    ('+1 313 123 4241'),'us','AMERICA','2500','Raul.Wilder@STILT.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-83.045345, 42.331799,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (252,'Shah Rukh','Field',cust_address_typ
    ('3435 Tuscany Dr Se','49546','Grand Rapids','MI','US'),PHONE_LIST_TYP
    ('+1 616 123 4259'),'us','AMERICA','2500','ShahRukh.Field@WHIMBREL.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-85.49774, 42.900677,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (253,'Sally','Bogart',cust_address_typ
    ('215 4Th Ave Se','52401','Cedar Rapids','IA','US'),PHONE_LIST_TYP
    ('+1 319 123 4269'),'us','AMERICA','2500','Sally.Bogart@WILLET.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-91.66561, 41.976278,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (254,'Bruce','Bates',cust_address_typ
    ('1751 Madison Ave','51503','Council Bluffs','IA','US'),PHONE_LIST_TYP
    ('+1 712 123 4284'),'us','AMERICA','3500','Bruce.Bates@COWBIRD.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-95.82708, 41.244721,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (255,'Brooke','Shepherd',cust_address_typ
    ('810 1St Ave','51501','Council Bluffs','IA','US'),PHONE_LIST_TYP
    ('+1 712 123 4289'),'us','AMERICA','3500','Brooke.Shepherd@KILLDEER.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-95.85574, 41.260392,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (256,'Ben','de Niro',cust_address_typ
    ('500 W Oklahoma Ave','53207','Milwaukee','WI','US'),PHONE_LIST_TYP
    ('+1 414 123 4312'),'us','AMERICA','3500','Ben.deNiro@KINGLET.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-87.91708, 42.987664,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (257,'Emmet','Walken',cust_address_typ
    ('4811 S 76Th St # 205','53220','Milwaukee','WI','US'),PHONE_LIST_TYP
    ('+1 414 123 4364'),'us','AMERICA','3600','Emmet.Walken@LIMPKIN.EXAMPLE.COM',
    145,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-88.008361, 42.957388,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (258,'Ellen','Palin',cust_address_typ
    ('310 Broadway St','56308','Alexandria','MN','US'),PHONE_LIST_TYP
    ('+1 320 123 4385'),'us','AMERICA','3600','Ellen.Palin@LONGSPUR.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-95.377469, 45.890088,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (259,'Denholm','von Sydow',cust_address_typ
    ('1721 E Lake St','55407','Minneapolis','MN','US'),PHONE_LIST_TYP
    ('+1 612 123 4407'),'us','AMERICA','3600','Denholm.vonSydow@MERGANSER.EXAMPLE.COM',
    145,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-93.24927, 44.94833,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (260,'Ellen','Khan',cust_address_typ
    ('255 Great Arrow Ave','14207','Buffalo','NY','US'),PHONE_LIST_TYP
    ('+1 716 123 4456'),'us','AMERICA','3600','Ellen.Khan@VERDIN.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-78.8782, 42.939107,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (261,'Emmet','Garcia',cust_address_typ
    ('800 Carter St','14621','Rochester','NY','US'),PHONE_LIST_TYP
    ('+1 716 123 4582'),'us','AMERICA','3600','Emmet.Garcia@VIREO.EXAMPLE.COM',
    145,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-77.59255, 43.19264,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (262,'Fred','Reynolds',cust_address_typ
    ('6640 Campbell Blvd','14094','Lockport','NY','US'),PHONE_LIST_TYP
    ('+1 716 123 4627'),'us','AMERICA','3600','Fred.Reynolds@WATERTHRUSH.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-78.77288, 43.103915,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (263,'Fred','Lithgow',cust_address_typ
    ('802 North Ave','15209','Pittsburgh','PA','US'),PHONE_LIST_TYP
    ('+1 412 123 4677'),'us','AMERICA','3600','Fred.Lithgow@WHIMBREL.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-79.973484, 40.488173,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (264,'George','Adjani',cust_address_typ
    ('1136 Arch St','19107','Philadelphia','PA','US'),PHONE_LIST_TYP
    ('+1 215 123 4702'),'us','AMERICA','3600','George.Adjani@WILLET.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-75.15858, 39.953503,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (265,'Irene','Laughton',cust_address_typ
    ('6Th And Master St','19122','Philadelphia','PA','US'),PHONE_LIST_TYP
    ('+1 215 123 4749'),'us','AMERICA','3600','Irene.Laughton@ANHINGA.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-75.146, 39.972648,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (266,'Prem','Cardinale',cust_address_typ
    ('Rt 6 E','16365','Warren','PA','US'),PHONE_LIST_TYP
    ('+1 814 123 4755'),'us','AMERICA','3700','Prem.Cardinale@BITTERN.EXAMPLE.COM',
    145,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-79.093419, 41.836445,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (267,'Prem','Walken',cust_address_typ
    ('1924 Bedford St','21502','Cumberland','MD','US'),PHONE_LIST_TYP
    ('+1 301 123 4831'),'us','AMERICA','3700','Prem.Walken@BRANT.EXAMPLE.COM',
    145,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-78.74141, 39.67579,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (268,'Kyle','Schneider',cust_address_typ
    ('2674 Collingwood St','48206','Detroit','MI','US'),PHONE_LIST_TYP
    ('+1 313 123 4167'),'us','AMERICA','3700','Kyle.Schneider@DUNLIN.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-83.114655, 42.379998,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (269,'Kyle','Martin',cust_address_typ
    ('2713 N Bendix Dr','46628','South Bend','IN','US'),PHONE_LIST_TYP
    ('+1 219 123 4116'),'us','AMERICA','3700','Kyle.Martin@EIDER.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-86.29384, 41.713988,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (270,'Meg','Derek',cust_address_typ
    ('23985 Bedford Rd N','49017','Battle Creek','MI','US'),PHONE_LIST_TYP
    ('+1 616 123 4166'),'us','AMERICA','3700','Meg.Derek@FLICKER.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-85.23775, 42.419583,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (271,'Shelley','Peckinpah',cust_address_typ
    ('752 W Huron St','48341','Pontiac','MI','US'),PHONE_LIST_TYP
    ('+1 810 123 4212'),'us','AMERICA','3700','Shelley.Peckinpah@GODWIT.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-83.319991, 42.635196,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (272,'Prem','Garcia',cust_address_typ
    ('660 Woodward Ave # 2290','48226','Detroit','MI','US'),PHONE_LIST_TYP
    ('+1 313 123 4240'),'us','AMERICA','3700','Prem.Garcia@JACANA.EXAMPLE.COM',
    145,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-83.045995, 42.330983,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (273,'Bo','Hitchcock',cust_address_typ
    ('1330 N Memorial Dr','53404','Racine','WI','US'),PHONE_LIST_TYP
    ('+1 414 123 4340'),'us','AMERICA','5000','Bo.Hitchcock@ANHINGA.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-87.8003, 42.737121,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (274,'Bob','McCarthy',cust_address_typ
    ('701 Seneca St','14210','Buffalo','NY','US'),PHONE_LIST_TYP
    ('+1 716 123 4485'),'us','AMERICA','5000','Bob.McCarthy@ANI.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-78.85093, 42.876154,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (275,'Dom','McQueen',cust_address_typ
    ('8 Automation Ln','12205','Albany','NY','US'),PHONE_LIST_TYP
    ('+1 518 123 4532'),'us','AMERICA','5000','Dom.McQueen@AUKLET.EXAMPLE.COM',
    145,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-73.81064, 42.719449,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (276,'Dom','Hoskins',cust_address_typ
    ('811 N Brandywine Ave','12308','Schenectady','NY','US'),PHONE_LIST_TYP
    ('+1 518 123 4562'),'us','AMERICA','5000','Dom.Hoskins@AVOCET.EXAMPLE.COM',
    145,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-73.91715, 42.806965,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (277,'Don','Siegel',cust_address_typ
    ('2904 S Salina St','13205','Syracuse','NY','US'),PHONE_LIST_TYP
    ('+1 315 123 4585'),'us','AMERICA','5000','Don.Siegel@BITTERN.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-76.14293, 43.01943,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (278,'Gvtz','Bradford',cust_address_typ
    ('3025 Sussex Ave','15226','Pittsburgh','PA','US'),PHONE_LIST_TYP
    ('+1 412 123 4659'),'us','AMERICA','5000','Gvtz.Bradford@BULBUL.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-80.016204, 40.384079,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (279,'Holly','Kurosawa',cust_address_typ
    ('932 High St','17603','Lancaster','PA','US'),PHONE_LIST_TYP
    ('+1 717 123 4679'),'us','AMERICA','5000','Holly.Kurosawa@CARACARA.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-76.31964, 40.028889,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (280,'Rob','MacLaine',cust_address_typ
    ('5344 Haverford Ave','19139','Philadelphia','PA','US'),PHONE_LIST_TYP
    ('+1 215 123 4709'),'us','AMERICA','5000','Rob.MacLaine@COOT.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (0, NULL,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (281,'Don','Barkin',cust_address_typ
    ('6959 Tulip St','19135','Philadelphia','PA','US'),PHONE_LIST_TYP
    ('+1 215 123 4751'),'us','AMERICA','5000','Don.Barkin@CORMORANT.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-75.04023, 40.024509,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (282,'Kurt','Danson',cust_address_typ
    ('511 S Central Ave # A','21202','Baltimore','MD','US'),PHONE_LIST_TYP
    ('+1 410 123 4807'),'us','AMERICA','5000','Kurt.Danson@COWBIRD.EXAMPLE.COM',
    149,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-76.59934, 39.28475,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (283,'Kurt','Heard',cust_address_typ
    ('400 E Joppa Rd','21286','Baltimore','MD','US'),PHONE_LIST_TYP
    ('+1 410 123 4829'),'us','AMERICA','5000','Kurt.Heard@CURLEW.EXAMPLE.COM',
    NULL,MDSYS.SDO_GEOMETRY
    (2001, 8307, MDSYS.SDO_POINT_TYPE
    (-76.595984, 39.401932,NULL),NULL,NULL));
INSERT INTO customers VALUES 
    (308,'Glenda','Dunaway',cust_address_typ
    ('1795 Wu Meng','21191','Muang Chonburi','','CN'),PHONE_LIST_TYP
    ('+86 811 012 4093'),'zhs','CHINA','1200','Glenda.Dunaway@DOWITCHER.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (309,'Glenda','Bates',cust_address_typ
    ('1796 Tsing Tao','11111','Muang Nonthaburi','','CN'),PHONE_LIST_TYP
    ('+86 123 012 4095'),'zhs','CHINA','1200','Glenda.Bates@DIPPER.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (323,'Goetz','Falk',cust_address_typ
    ('1810 Tucker Crt','361181','Mumbai','','IN'),PHONE_LIST_TYP
    ('+91 80 012 4123', '+91 80 083 4833'),'hi','INDIA','5000',
    'Goetz.Falk@VEERY.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (326,'Hal','Olin',cust_address_typ
    ('Walpurgisstr 69','81243','Munich','','DE'),PHONE_LIST_TYP
    ('+49 89 012 4129', '+49 89 083 4839'),'d','GERMANY','2400',
    'Hal.Olin@FLICKER.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (327,'Hannah','Kanth',cust_address_typ
    ('Sendlinger Tor 4','81696','Munich','','DE'),PHONE_LIST_TYP
    ('+49 90 012 4131', '+49 90 083 4131'),'d','GERMANY','2400',
    'Hannah.Kanth@GADWALL.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (328,'Hannah','Field',cust_address_typ
    ('Theresienstr 15','81999','Munich','','DE'),PHONE_LIST_TYP
    ('+49 91 012 4133', '+49 91 083 4133'),'d','GERMANY','2400',
    'Hannah.Field@GALLINULE.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (333,'Margret','Powell',cust_address_typ
    ('Via Frenzy 6903','361196','Roma','','IT'),PHONE_LIST_TYP
    ('+39 6 012 4543'),'i','ITALY','1200',
    'Margret.Powell@ANI.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (334,'Harry Mean','Taylor',cust_address_typ
    ('1822 Ironweed St','91261','Toronto','ONT','CA'),PHONE_LIST_TYP
    ('+1 416 012 4147'),'us','AMERICA','1200','HarryMean.Taylor@REDPOLL.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (335,'Margrit','Garner',cust_address_typ
    ('Via Luminosa 162','361197','Firenze','','IT'),PHONE_LIST_TYP
    ('+39 55 012 4547'),'i','ITALY','500','Margrit.Garner@STILT.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (337,'Maria','Warden',cust_address_typ
    ('Via Notoriosa 1932 Rd','361198','Firenze','','IT'),PHONE_LIST_TYP
    ('+39 55 012 4551'),'i','ITALY','500','Maria.Warden@TANAGER.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (339,'Marilou','Landis',cust_address_typ
    ('Via Notoriosa 1941','361199','Firenze','','IT'),PHONE_LIST_TYP
    ('+39 55 012 4555'),'i','ITALY','500','Marilou.Landis@TATTLER.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (361,'Marilou','Chapman',cust_address_typ
    ('Via Notoriosa 1942','361200','Firenze','','IT'),PHONE_LIST_TYP
    ('+39 55 012 4559'),'i','ITALY','500','Marilou.Chapman@TEAL.EXAMPLE.COM',
    145,NULL);
INSERT INTO customers VALUES 
    (363,'Kathy','Lambert',cust_address_typ
    ('Via Delle Grazie 11','361225','Tellaro','','IT'),PHONE_LIST_TYP
    ('+39 10 012 4363'),'i','ITALY','2400','Kathy.Lambert@COOT.EXAMPLE.COM',
    145,NULL);
INSERT INTO customers VALUES 
    (360,'Helmut','Capshaw',cust_address_typ
    ('1831 No Wong','111181','Peking','','CN'),PHONE_LIST_TYP
    ('+86 10 012 4165'),'zhs','CHINA','3600','Helmut.Capshaw@TROGON.EXAMPLE.COM',
    145,NULL);
INSERT INTO customers VALUES 
    (341,'Keir','George',cust_address_typ
    ('Via Dolorosa 69','361229','Tellaro','','IT'),PHONE_LIST_TYP
    ('+39 10 012 4365'),'i','ITALY','700','Keir.George@VIREO.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (342,'Marlon','Laughton',cust_address_typ
    ('Via Notoriosa 1943','361201','Firenze','','IT'),PHONE_LIST_TYP
    ('+39 55 012 4565'),'i','ITALY','2400','Marlon.Laughton@CORMORANT.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (343,'Keir','Chandar',cust_address_typ
    ('Via Luminosa 162','361231','Tellaro','','IT'),PHONE_LIST_TYP
    ('+39 10 012 4367'),'i','ITALY','700','Keir.Chandar@WATERTHRUSH.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (344,'Marlon','Godard',cust_address_typ
    ('2017 Convoy St','876508','Tokyo','','JP'),PHONE_LIST_TYP
    ('+81 565 012 4567'),'ja','JAPAN','2400','Marlon.Godard@MOORHEN.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (345,'Keir','Weaver',cust_address_typ
    ('Via Di Firenze 231','361228','Tellaro','','IT'),PHONE_LIST_TYP
    ('+39 10 012 4369'),'i','ITALY','700','Keir.Weaver@WHIMBREL.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (346,'Marlon','Clapton',cust_address_typ
    ('Via Notoriosa 1949','361202','Firenze','','IT'),PHONE_LIST_TYP
    ('+39 55 012 4569'),'i','ITALY','2400','Marlon.Clapton@COWBIRD.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (347,'Kelly','Quinlan',cust_address_typ
    ('Via Frenzy 6903','361230','Tellaro','','IT'),PHONE_LIST_TYP
    ('+39 10 012 4371', '+39 10 083 4371'),'i','ITALY','3600',
    'Kelly.Quinlan@PYRRHULOXIA.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (348,'Kelly','Lange',cust_address_typ
    ('Piazza Del Congresso 22','361219','San Giminiano','','IT'),PHONE_LIST_TYP
    ('+39 49 012 4373', '+39 49 083 4373'),'i','ITALY','3600',
    'Kelly.Lange@SANDPIPER.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (349,'Ken','Glenn',cust_address_typ
    ('Piazza Quattre Stagioni 4','361220','San Giminiano','','IT'),PHONE_LIST_TYP
    ('+39 49 012 4375', '+39 49 083 4375'),'i','ITALY','3600',
    'Ken.Glenn@SAW-WHET.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (350,'Ken','Chopra',cust_address_typ
    ('Piazza Cacchiatore 23','361218','San Giminiano','','IT'),PHONE_LIST_TYP
    ('+39 49 012 4377', '+39 49 083 4377'),'i','ITALY','3600',
    'Ken.Chopra@SCAUP.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (351,'Ken','Wenders',cust_address_typ
    ('Via Notoriosa 1932','361232','Tellaro','','IT'),PHONE_LIST_TYP
    ('+39 10 012 4379', '+39 10 083 4379'),'i','ITALY','3600',
    'Ken.Wenders@REDPOLL.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (352,'Kenneth','Redford',cust_address_typ
    ('Via Notoriosa 1949','361236','Ventimiglia','','IT'),PHONE_LIST_TYP
    ('+39 10 012 4381', '+39 10 083 4381'),'i','ITALY','3600',
    'Kenneth.Redford@REDSTART.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (378,'Meg','Sen',cust_address_typ
    ('2033 Spartacus St','','Samutprakarn','','TH'),PHONE_LIST_TYP
    ('+66 76 012 4633', '+66 76 083 4633'),'th','THAILAND','3700',
    'Meg.Sen@COWBIRD.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (380,'Meryl','Holden',cust_address_typ
    ('2034 Sabrina Rd','361182','Samutprakarn','','IN'),PHONE_LIST_TYP
    ('+91 80 012 4637', '+91 80 083 4637'),'hi','INDIA','3700',
    'Meryl.Holden@DIPPER.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (447,'Richard','Coppola',cust_address_typ
    ('Piazza Svizzera','361211','Milano','','IT'),PHONE_LIST_TYP
    ('+39 2 012 4771'),'i','ITALY','500','Richard.Coppola@SISKIN.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (448,'Richard','Winters',cust_address_typ
    ('Ruella Delle Spiriti','361212','Milano','','IT'),PHONE_LIST_TYP
    ('+39 2 012 4773'),'i','ITALY','500','Richard.Winters@SNIPE.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (449,'Rick','Romero',cust_address_typ
    ('Via Del Disegno 194','361213','Milano','','IT'),PHONE_LIST_TYP
    ('+39 2 012 4775'),'i','ITALY','1500','Rick.Romero@LONGSPUR.EXAMPLE.COM',
    145,NULL);
INSERT INTO customers VALUES 
    (450,'Rick','Lyon',cust_address_typ
    ('Via Delle Capeletti 52','361214','San Giminiano','','IT'),PHONE_LIST_TYP
    ('+39 49 012 4777'),'i','ITALY','1500','Rick.Lyon@MERGANSER.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (451,'Ridley','Hackman',cust_address_typ
    ('Via Delle Grazie 11','361215','San Giminiano','','IT'),PHONE_LIST_TYP
    ('+39 49 012 4779'),'i','ITALY','700','Ridley.Hackman@ANHINGA.EXAMPLE.COM',
    145,NULL);
INSERT INTO customers VALUES 
    (452,'Ridley','Coyote',cust_address_typ
    ('Via Delli Capelli 2','361216','San Giminiano','','IT'),PHONE_LIST_TYP
    ('+39 49 012 4781'),'i','ITALY','700','Ridley.Coyote@ANI.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (453,'Ridley','Young',cust_address_typ
    ('1592 Silverado St','361123','Bangalore','Kar','IN'),PHONE_LIST_TYP
    ('+91 80 012 4783'),'hi','INDIA','700','Ridley.Young@CHUKAR.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (454,'Rob','Russell',cust_address_typ
    ('1593 Silverado St','361112','Bangalore','Kar','IN'),PHONE_LIST_TYP
    ('+91 80 012 4785', '+91 80 083 4785'),'hi','INDIA','5000',
    'Rob.Russell@VERDIN.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (458,'Robert','de Niro',cust_address_typ
    ('1597 Legend St','','Mysore','Kar','IN'),PHONE_LIST_TYP
    ('+91 80 012 4793'),'hi','INDIA','3700',
    'Robert.deNiro@DOWITCHER.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (463,'Robin','Adjani',cust_address_typ
    ('1602 Sholay St','','Chennai','Tam','IN'),PHONE_LIST_TYP
    ('+91 80 012 4803'),'hi','INDIA','1500','Robin.Adjani@MOORHEN.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (466,'Rodolfo','Hershey',cust_address_typ
    ('1605 Bazigar Crt','','Pune','','IN'),PHONE_LIST_TYP
    ('+91 80 012 4809', '+91 80 083 4809'),'hi','INDIA','5000',
    'Rodolfo.Hershey@VIREO.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (467,'Rodolfo','Dench',cust_address_typ
    ('1606 Sangam Blvd','361196','New Delhi','','IN'),PHONE_LIST_TYP
    ('+91 11 012 4811', '+91 11 083 4811'),'hi','INDIA','5000',
    'Rodolfo.Dench@SCOTER.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (468,'Rodolfo','Altman',cust_address_typ
    ('1607 Sangam Blvd','361114','New Delhi','','IN'),PHONE_LIST_TYP
    ('+91 11 012 4813', '+91 11 083 4813'),'hi','INDIA','5000',
    'Rodolfo.Altman@SHRIKE.EXAMPLE.COM',
    145,NULL);
INSERT INTO customers VALUES 
    (470,'Roger','Mastroianni',cust_address_typ
    ('1609 Pakija Rd','','New Delhi','','IN'),PHONE_LIST_TYP
    ('+91 11 012 4817', '+91 11 083 4817'),'hi','INDIA','3700',
    'Roger.Mastroianni@CREEPER.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (473,'Rolf','Ashby',cust_address_typ
    ('1612 Talaivar St','','Chennai','Tam','IN'),PHONE_LIST_TYP
    ('+91 80 012 4823', '+91 80 083 4823'),'hi','INDIA','5000',
    'Rolf.Ashby@WATERTHRUSH.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (474,'Romy','Sharif',cust_address_typ
    ('1613 Victoria St','','Calcutta','','IN'),PHONE_LIST_TYP
    ('+91 33 012 4825', '+91 33 083 4825'),'hi','INDIA','5000',
    'Romy.Sharif@SNIPE.EXAMPLE.COM',
    145,NULL);
INSERT INTO customers VALUES 
    (475,'Romy','McCarthy',cust_address_typ
    ('1614 Gitanjali Rd','361168','Calcutta','','IN'),PHONE_LIST_TYP
    ('+91 33 012 4827', '+91 33 083 4827'),'hi','INDIA','5000',
    'Romy.McCarthy@STILT.EXAMPLE.COM',
    145,NULL);
INSERT INTO customers VALUES 
    (476,'Rosanne','Hopkins',cust_address_typ
    ('1615 Crackers Crt','361168','Chennai - India','','IN'),PHONE_LIST_TYP
    ('+91 80 012 4829'),'hi','INDIA','300','Rosanne.Hopkins@ANI.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (477,'Rosanne','Douglas',cust_address_typ
    ('1616 Mr. India Ln','361168','Bombay - India','Kar','IN'),PHONE_LIST_TYP
    ('+91 22 012 4831'),'hi','INDIA','300','Rosanne.Douglas@ANHINGA.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (478,'Rosanne','Baldwin',cust_address_typ
    ('1617 Crackers St','361168','Bangalore - India','Kar','IN'),PHONE_LIST_TYP
    ('+91 80 012 4833'),'hi','INDIA','300','Rosanne.Baldwin@AUKLET.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (479,'Roxanne','Shepherd',cust_address_typ
    ('1618 Villains St','361168','New Delhi - India','','IN'),PHONE_LIST_TYP
    ('+91 11 012 4835', '+91 11 083 4835'),'hi','INDIA','1200',
    'Roxanne.Shepherd@DUNLIN.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (480,'Roxanne','Michalkow',cust_address_typ
    ('1619 Bowlers Rd','361168','Chandigarh','Har','IN'),PHONE_LIST_TYP
    ('+91 172 012 4837'),'hi','INDIA','1200','Roxanne.Michalkow@EIDER.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (481,'Roy','Hulce',cust_address_typ
    ('1620 Sixers Crt','361168','Bombay','Kar','IN'),PHONE_LIST_TYP
    ('+91 22 012 4839', '+91 22 083 4839'),'hi','INDIA','5000',
    'Roy.Hulce@SISKIN.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (482,'Roy','Dunaway',cust_address_typ
    ('1622 Roja St','361168','Chennai','Tam','IN'),PHONE_LIST_TYP
    ('+91 80 012 4841', '+91 80 083 4841'),'hi','INDIA','5000',
    'Roy.Dunaway@WHIMBREL.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (483,'Roy','Bates',cust_address_typ
    ('1623 Hey Ram St','361168','Chennai - India','','IN'),PHONE_LIST_TYP
    ('+91 80 012 4843', '+91 80 083 4843'),'hi','INDIA','5000',
    'Roy.Bates@WIGEON.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (487,'Rufus','Dvrrie',cust_address_typ
    ('1627 Sowdagar St','361168','New Delhi','','IN'),PHONE_LIST_TYP
    ('+91 11 012 4851', '+91 11 083 4851'),'hi','INDIA','1900',
    'Rufus.Dvrrie@PLOVER.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (488,'Rufus','Belushi',cust_address_typ
    ('1628 Pataudi St','361168','New Delhi','','IN'),PHONE_LIST_TYP
    ('+91 11 012 4853', '+91 11 083 4853'),'hi','INDIA','1900',
 'Rufus.Belushi@PUFFIN.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (492,'Sally','Edwards',cust_address_typ
    ('1632 Splash St','361168','Chandigarh','Har','IN'),PHONE_LIST_TYP
    ('+91 172 012 4861'),'hi','INDIA','2500',
 'Sally.Edwards@TURNSTONE.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (496,'Scott','Jordan',cust_address_typ
    ('1636 Pretty Blvd','361168','Bangalore','Kar','IN'),PHONE_LIST_TYP
    ('+91 80 012 4869'),'hi','INDIA','5000','Scott.Jordan@WILLET.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (605,'Shammi','Pacino',cust_address_typ
    ('1646 Brazil Blvd','361168','Chennai','Tam','IN'),PHONE_LIST_TYP
    ('+91 80 012 4887'),'hi','INDIA','500','Shammi.Pacino@BITTERN.EXAMPLE.COM',
    145,NULL);
INSERT INTO customers VALUES 
    (606,'Sharmila','Kazan',cust_address_typ
    ('1647 Suspense St','361168','Cochin','Ker','IN'),PHONE_LIST_TYP
    ('+91 80 012 4889'),'hi','INDIA','500','Sharmila.Kazan@BRANT.EXAMPLE.COM',
    145,NULL);
INSERT INTO customers VALUES 
    (607,'Sharmila','Fonda',cust_address_typ
    ('1648 Anamika St','361168','Cochin','Ker','IN'),PHONE_LIST_TYP
    ('+91 80 012 4891'),'hi','INDIA','500','Sharmila.Fonda@BUFFLEHEAD.EXAMPLE.COM',
    145,NULL);
INSERT INTO customers VALUES 
    (609,'Shelley','Taylor',cust_address_typ
    ('1650 Teesri Manjil Crt','361168','Kashmir','','IN'),PHONE_LIST_TYP
    ('+91 141 012 4895', '+91 141 083 4895'),'hi','INDIA','3700',
 'Shelley.Taylor@CURLEW.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (615,'Shyam','Plummer',cust_address_typ
    ('1656 Veterans Rd','361168','Chennai','Tam','IN'),PHONE_LIST_TYP
    ('+91 80 012 4907'),'hi','INDIA','2500','Shyam.Plummer@VEERY.EXAMPLE.COM',
    145,NULL);
INSERT INTO customers VALUES 
    (621,'Silk','Kurosawa',cust_address_typ
    ('1662 Talaivar St','361168','Chennai','Tam','IN'),PHONE_LIST_TYP
    ('+91 80 012 4919'),'hi','INDIA','1500','Silk.Kurosawa@NUTHATCH.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (627,'Sivaji','Gielgud',cust_address_typ
    ('1667 2010 St','61311','Batavia','Ker','IN'),PHONE_LIST_TYP
    ('+91 80 012 4931'),'hi','INDIA','500','Sivaji.Gielgud@BULBUL.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (712,'M. Emmet','Stockwell',cust_address_typ
    ('Piazza Del Congresso 22','361185','Roma','','IT'),PHONE_LIST_TYP
    ('+39 6 012 4501', '+39 6 083 4501'),'i','ITALY','3700',
    'M.Emmet.Stockwell@COOT.EXAMPLE.COM',
    145,NULL);
INSERT INTO customers VALUES 
    (713,'M. Emmet','Olin',cust_address_typ
    ('Piazza Quattre Stagioni 4','361186','Roma','','IT'),PHONE_LIST_TYP
    ('+39 6 012 4503', '+39 6 083 4503'),'i','ITALY','3700',
    'M.Emmet.Olin@CORMORANT.EXAMPLE.COM',
    145,NULL);
INSERT INTO customers VALUES 
    (715,'Malcolm','Field',cust_address_typ
    ('Piazza Svizzera','361187','Roma','','IT'),PHONE_LIST_TYP
    ('+39 6 012 4507', '+39 6 083 4507'),'i','ITALY','2400',
    'Malcolm.Field@DOWITCHER.EXAMPLE.COM',
    145,NULL);
INSERT INTO customers VALUES 
    (717,'Mammutti','Sutherland',cust_address_typ
    ('Ruella Delle Spiriti','361188','Roma','','IT'),PHONE_LIST_TYP
    ('+39 6 012 4511'),'i','ITALY','500',
    'Mammutti.Sutherland@TOWHEE.EXAMPLE.COM',
    145,NULL);
INSERT INTO customers VALUES 
    (719,'Mani','Kazan',cust_address_typ
    ('Via Del Disegno 194','361189','Roma','','IT'),PHONE_LIST_TYP
    ('+39 6 012 4515'),'i','ITALY','500','Mani.Kazan@TROGON.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (721,'Mani','Buckley',cust_address_typ
    ('Via Delle Capeletti 52','361190','Roma','','IT'),PHONE_LIST_TYP
    ('+39 6 012 4519'),'i','ITALY','500','Mani.Buckley@TURNSTONE.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (727,'Margaret','Ustinov',cust_address_typ
    ('Via Dello Croce 93','361193','Roma','','IT'),PHONE_LIST_TYP
    ('+39 6 012 4531'),'i','ITALY','1200','Margaret.Ustinov@ANHINGA.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (729,'Margaux','Krige',cust_address_typ
    ('Via Di Firenze 231','361194','Roma','','IT'),PHONE_LIST_TYP
    ('+39 6 012 4535', '+39 6 083 4535'),'i','ITALY','2400',
    'Margaux.Krige@DUNLIN.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (731,'Margaux','Capshaw',cust_address_typ
    ('Via Dolorosa 69','361195','Roma','','IT'),PHONE_LIST_TYP
    ('+39 6 012 4539', '+39 6 083 4539'),'i','ITALY','2400',
    'Margaux.Capshaw@EIDER.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (754,'Kevin','Goodman',cust_address_typ
    ('Via Notoriosa 1942','361234','Ventimiglia','','IT'),PHONE_LIST_TYP
    ('+39 10 012 4385'),'i','ITALY','700','Kevin.Goodman@WIGEON.EXAMPLE.COM',
    145,NULL);
INSERT INTO customers VALUES 
    (755,'Kevin','Cleveland',cust_address_typ
    ('Via Notoriosa 1943','361235','Ventimiglia','','IT'),PHONE_LIST_TYP
    ('+39 10 012 4387'),'i','ITALY','700','Kevin.Cleveland@WILLET.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (756,'Kevin','Wilder',cust_address_typ
    ('Canale Grande 2','361183','Roma','','IT'),PHONE_LIST_TYP
    ('+39 6 012 4389'),'i','ITALY','700','Kevin.Wilder@AUKLET.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (757,'Kiefer','Reynolds',cust_address_typ
    ('Piazza Cacchiatore 23','361184','Roma','','IT'),PHONE_LIST_TYP
    ('+39 6 012 4391'),'i','ITALY','700','Kiefer.Reynolds@AVOCET.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (766,'Klaus','Young',cust_address_typ
    ('Via Del Disegno 194','361223','San Giminiano','','IT'),PHONE_LIST_TYP
    ('+39 49 012 4409'),'i','ITALY','600','Klaus.Young@OVENBIRD.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (767,'Klaus Maria','Russell',cust_address_typ
    ('Piazza Svizzera','361221','San Giminiano','','IT'),PHONE_LIST_TYP
    ('+39 49 012 4411'),'i','ITALY','100','KlausMaria.Russell@COOT.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (768,'Klaus Maria','MacLaine',cust_address_typ
    ('Via Dello Croce 93','361227','Tellaro','','IT'),PHONE_LIST_TYP
    ('+39 10 012 4413'),'i','ITALY','100','KlausMaria.MacLaine@CHUKAR.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (769,'Kris','Harris',cust_address_typ
    ('Via Dello Croce 93','361217','San Giminiano','','IT'),PHONE_LIST_TYP
    ('+39 49 012 4415'),'i','ITALY','400','Kris.Harris@DIPPER.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (770,'Kris','Curtis',cust_address_typ
    ('Ruella Delle Spiriti','361222','San Giminiano','','IT'),PHONE_LIST_TYP
    ('+39 49 012 4417'),'i','ITALY','400','Kris.Curtis@DOWITCHER.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (771,'Kris','de Niro',cust_address_typ
    ('Via Delle Capeletti 52','361224','San Giminiano','','IT'),PHONE_LIST_TYP
    ('+39 49 012 4419'),'i','ITALY','400','Kris.deNiro@DUNLIN.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (772,'Kristin','Savage',cust_address_typ
    ('Via Delli Capelli 2','361226','Tellaro','','IT'),PHONE_LIST_TYP
    ('+39 10 012 4421'),'i','ITALY','400','Kristin.Savage@CURLEW.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (782,'Laurence','Seignier',cust_address_typ
    ('1971 Limelight Blvd','','Samutprakarn','','TH'),PHONE_LIST_TYP
    ('+66 76 012 4441'),'th','THAILAND','1200','Laurence.Seignier@CREEPER.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (825,'Alain','Dreyfuss',cust_address_typ
    ('Harmoniegasse 3','3413','Baden-Daettwil','AG','CH'),PHONE_LIST_TYP
    ('+41 56 012 3527'),'d','SWITZERLAND','500','Alain.Dreyfuss@VEERY.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (826,'Alain','Barkin',cust_address_typ
    ('Sonnenberg 4','3413','Baden-Daettwil','AG','CH'),PHONE_LIST_TYP
    ('+41 57 012 3529'),'d','SWITZERLAND','500','Alain.Barkin@VERDIN.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (827,'Alain','Siegel',cust_address_typ
    ('Alfred E. Neumann-Weg 3','3413','Baden-Daettwil','AG','CH'),PHONE_LIST_TYP
    ('+41 58 012 3531'),'d','SWITZERLAND','500','Alain.Siegel@VIREO.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (828,'Alan','Minnelli',cust_address_typ
    ('Dr. Herbert Bitto Str 23','3413','Baden-Daettwil','AG','CH'),PHONE_LIST_TYP
    ('+41 59 012 3533', '+41 59 083 3533'),'d','SWITZERLAND','2300',
    'Alan.Minnelli@TANAGER.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (829,'Alan','Hunter',cust_address_typ
    ('Taefernstr 4','3413',
    'Baden-Daettwil','AG','CH'),PHONE_LIST_TYP
    ('+41 60 012 3535', '+41 60 083 3535'),'d','SWITZERLAND',
    '2300','Alan.Hunter@TATTLER.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (830,'Albert','Dutt',cust_address_typ
    ('Kreuzritterplatz 5','3413','Baden-Daettwil','AG','CH'),PHONE_LIST_TYP
    ('+41 61 012 3537', '+41 61 083 3537'),'d','SWITZERLAND','3500',
    'Albert.Dutt@CURLEW.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (831,'Albert','Bel Geddes',cust_address_typ
    ('Helebardenweg 5','3413','Baden-Daettwil','AG','CH'),PHONE_LIST_TYP
    ('+41 62 012 3539', '+41 62 083 3539'),'d','SWITZERLAND','3500',
    'Albert.BelGeddes@DIPPER.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (832,'Albert','Spacek',cust_address_typ
    ('Zum Freundlichen Nachbarn 5','3413',
    'Baden-Daettwil','AG','CH'),PHONE_LIST_TYP
    ('+41 63 012 3541', '+41 63 083 3541'),'d','SWITZERLAND','3500',
    'Albert.Spacek@DOWITCHER.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (833,'Alec','Moranis',cust_address_typ
    ('Ziegenwiese 3','3413','Baden-Daettwil','AG','CH'),PHONE_LIST_TYP
    ('+41 64 012 3543', '+41 64 083 3543'),'d','SWITZERLAND','3500',
    'Alec.Moranis@DUNLIN.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (834,'Alec','Idle',cust_address_typ
    ('Am Waldrand 5','3413','Baden-Daettwil','AG','CH'),PHONE_LIST_TYP
    ('+41 65 012 3545', '+41 65 083 3545'),'d','SWITZERLAND','3500',
    'Alec.Idle@EIDER.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (835,'Alexander','Eastwood',cust_address_typ
    ('Zur Kantine 9','3413','Baden-Daettwil','AG','CH'),PHONE_LIST_TYP
    ('+41 66 012 3547'),'d','SWITZERLAND','1200',
    'Alexander.Eastwood@AVOCET.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (836,'Alexander','Berenger',cust_address_typ
    ('Grosse Bahnhostrasse 3','3413','Baden-Daettwil','AG','CH'),PHONE_LIST_TYP
    ('+41 67 012 3549'),'d','SWITZERLAND','1200',
    'Alexander.Berenger@BECARD.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (837,'Alexander','Stanton',cust_address_typ
    ('Paradeplatz 4','8001','Zuerich','ZH','CH'),PHONE_LIST_TYP
    ('+41 2 012 3551', '+41 2 083 3551'),'d','SWITZERLAND','1200',
    'Alexander.Stanton@AUKLET.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (838,'Alfred','Nicholson',cust_address_typ
    ('Badenerstr 1941','8004','Zuerich','ZH','CH'),PHONE_LIST_TYP
    ('+41 3 012 3553', '+41 3 083 3553'),'d','SWITZERLAND','3500',
    'Alfred.Nicholson@CREEPER.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (839,'Alfred','Johnson',cust_address_typ
    ('Welschdoerfchen 1941','7001','Chur','ZH','CH'),PHONE_LIST_TYP
    ('+41 81 012 3555'),'d','SWITZERLAND','3500','Alfred.Johnson@FLICKER.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (840,'Ali','Elliott',cust_address_typ
    ('Le Reduit','7064','Tschiertschen','GR','CH'),PHONE_LIST_TYP
    ('+41 81 012 3557'),'d','SWITZERLAND','1400','Ali.Elliott@ANHINGA.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (841,'Ali','Boyer',cust_address_typ
    ('Bendlehn','9062','Trogen','SG','CH'),PHONE_LIST_TYP
    ('+41 71 012 3559'),'d','SWITZERLAND','1400','Ali.Boyer@WILLET.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (842,'Ali','Stern',cust_address_typ
    ('Spisertor 3','7000','St. Gallen','SG','CH'),PHONE_LIST_TYP
    ('+41 71 012 3561'),'d','SWITZERLAND','1400','Ali.Stern@YELLOWTHROAT.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (843,'Alice','Oates',cust_address_typ
    ('Langstr 14','8004','Zuerich','ZH','CH'),PHONE_LIST_TYP
    ('+41 4 012 3563'),'d','SWITZERLAND','700','Alice.Oates@BECARD.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (844,'Alice','Julius',cust_address_typ
    ('Roessligasse 4','8001','Zurich','ZH','CH'),PHONE_LIST_TYP
    ('+41 6 012 3565'),'d','SWITZERLAND','700','Alice.Julius@BITTERN.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (845,'Ally','Fawcett',cust_address_typ
    ('Zum Froehlichen Schweizer 3','8000','Zurich','ZH','CH'),PHONE_LIST_TYP
    ('+41 7 012 3567', '+41 7 083 3567'),'d','SWITZERLAND','5000',
    'Ally.Fawcett@PLOVER.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (846,'Ally','Brando',cust_address_typ
    ('Chrottenweg','3000','Bern','BE','CH'),PHONE_LIST_TYP
    ('+41 31 012 3569', '+41 31 083 3569'),'d','SWITZERLAND','5000',
    'Ally.Brando@PINTAIL.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (847,'Ally','Streep',cust_address_typ
    ('Bruppacher Str 3','3413','Baden-Daettwil','AG','CH'),PHONE_LIST_TYP
    ('+41 68 012 3571', '+41 68 083 3571'),'d','SWITZERLAND','5000',
    'Ally.Streep@PIPIT.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (848,'Alonso','Olmos',cust_address_typ
    ('Limmatquai','8001','Zuerich','ZH','CH'),PHONE_LIST_TYP
    ('+41 5 012 3573', '+41 5 083 3573'),'d','SWITZERLAND','1800',
    'Alonso.Olmos@PHALAROPE.EXAMPLE.COM',
    145,NULL);
INSERT INTO customers VALUES 
    (849,'Alonso','Kaurusmdki',cust_address_typ
    ('Dreikoenigsstr 3','8001','Zurich','ZH','CH'),PHONE_LIST_TYP
    ('+41 8 012 3575', '+41 8 083 3575'),'d','SWITZERLAND','1800',
    'Alonso.Kaurusmdki@PHOEBE.EXAMPLE.COM',
    145,NULL);
INSERT INTO customers VALUES 
    (850,'Amanda','Finney',cust_address_typ
    ('Pfannenstilstr 13','8132','Egg','ZH','CH'),PHONE_LIST_TYP
    ('+41 1 012 3577', '+41 1 083 3577'),'d','SWITZERLAND','2300',
    'Amanda.Finney@STILT.EXAMPLE.COM',
    145,NULL);
INSERT INTO customers VALUES 
    (851,'Amanda','Brown',cust_address_typ
    ('Kreuzstr 32','8032','Zurich','ZH','CH'),PHONE_LIST_TYP
    ('+41 9 012 3579', '+41 9 083 3579'),'d','SWITZERLAND','2300',
    'Amanda.Brown@THRASHER.EXAMPLE.COM',
    145,NULL);
INSERT INTO customers VALUES 
    (852,'Amanda','Tanner',cust_address_typ
    ('1539 Stripes Rd','3413','Baden-Daettwil','AG','CH'),PHONE_LIST_TYP
    ('+41 69 012 3581', '+41 69 083 3581'),'d','SWITZERLAND','2300',
    'Amanda.Tanner@TEAL.EXAMPLE.COM',
    145,NULL);
INSERT INTO customers VALUES 
    (853,'Amrish','Palin',cust_address_typ
    ('1540 Stripes Crt','3413','Baden-Daettwil','AG','CH'),PHONE_LIST_TYP
    ('+41 70 012 3583'),'d','SWITZERLAND','400','Amrish.Palin@EIDER.EXAMPLE.COM',
    145,NULL);
INSERT INTO customers VALUES 
    (905,'Billy','Hershey',cust_address_typ
    ('1592 Silverado St','361123','Bangalore','Kar','IN'),PHONE_LIST_TYP
    ('+91 80 012 3687'),'hi','INDIA','1400','Billy.Hershey@BULBUL.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (906,'Billy','Dench',cust_address_typ
    ('1593 Silverado St','361112','Bangalore','Kar','IN'),PHONE_LIST_TYP
    ('+91 80 012 3689'),'hi','INDIA','1400','Billy.Dench@CARACARA.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (909,'Blake','Mastroianni',cust_address_typ
    ('1596 Commando Blvd','361126','Bangalore','Kar','IN'),PHONE_LIST_TYP
    ('+91 80 012 3695'),'hi','INDIA','1200','Blake.Mastroianni@FLICKER.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (911,'Bo','Dickinson',cust_address_typ
    ('1598 Legend St','361149','Bangalore','Kar','IN'),PHONE_LIST_TYP
    ('+91 80 012 3699', '+91 80 083 3699'),'hi','INDIA','5000',
    'Bo.Dickinson@TANAGER.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (912,'Bo','Ashby',cust_address_typ
    ('1599 Legend Rd','361128','Bangalore','Kar','IN'),PHONE_LIST_TYP
    ('+91 80 012 3701', '+91 80 083 3701'),'hi','INDIA','5000',
    'Bo.Ashby@TATTLER.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (913,'Bob','Sharif',cust_address_typ
    ('1600 Target Crt','361191','Bangalore','Kar','IN'),PHONE_LIST_TYP
    ('+91 80 012 3703', '+91 80 083 3703'),'hi','INDIA','5000',
    'Bob.Sharif@TEAL.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (916,'Brian','Douglas',cust_address_typ
    ('1603 Rebel St','361129','Bangalore','Kar','IN'),PHONE_LIST_TYP
    ('+91 80 012 3709'),'hi','INDIA','500','Brian.Douglas@AVOCET.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (917,'Brian','Baldwin',cust_address_typ
    ('1604 Volunteers Rd','361121','Bangalore','Kar','IN'),PHONE_LIST_TYP
    ('+91 80 012 3711'),'hi','INDIA','500','Brian.Baldwin@BECARD.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (919,'Brooke','Michalkow',cust_address_typ
    ('1606 Volunteers Blvd','361196','Bangalore','Kar','IN'),PHONE_LIST_TYP
    ('+91 80 012 3715'),'hi','INDIA','3500','Brooke.Michalkow@GROSBEAK.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (920,'Bruce','Hulce',cust_address_typ
    ('1607 Abwdrts St','361114','Bangalore','Kar','IN'),PHONE_LIST_TYP
    ('+91 80 012 3717'),'hi','INDIA','3500','Bruce.Hulce@JACANA.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (921,'Bruce','Dunaway',cust_address_typ
    ('1608 Amadeus St','361198','Bangalore','Kar','IN'),PHONE_LIST_TYP
    ('+91 80 012 3719', '+91 80 083 3719'),'hi','INDIA','3500',
    'Bruce.Dunaway@JUNCO.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (923,'Bruno','Slater',cust_address_typ
    ('1610 Betrayal Crt','361119','Bangalore','Kar','IN'),PHONE_LIST_TYP
    ('+91 80 012 3723', '+91 80 083 3723'),'hi','INDIA','5000',
    'Bruno.Slater@THRASHER.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (924,'Bruno','Montand',cust_address_typ
    ('1611 Carmen Blvd','361118','Bangalore','Kar','IN'),PHONE_LIST_TYP
    ('+91 80 012 3725', '+91 80 083 3725'),'hi','INDIA','5000',
    'Bruno.Montand@TOWHEE.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (927,'Bryan','Belushi',cust_address_typ
    ('1614 Crackers Rd','361168','Bangalore - India','Kar','IN'),PHONE_LIST_TYP
    ('+91 80 012 3731', '+91 80 083 3731'),'hi','INDIA','2300',
    'Bryan.Belushi@TOWHEE.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (928,'Burt','Spielberg',cust_address_typ
    ('1615 Crackers Crt','361168','Bangalore - India','Kar','IN'),PHONE_LIST_TYP
    ('+91 80 012 3733', '+91 80 083 3733'),'hi','INDIA','5000',
    'Burt.Spielberg@TROGON.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (929,'Burt','Neeson',cust_address_typ
    ('1616 Crackers Blvd','361168','Bangalore - India','Kar','IN')
    ,PHONE_LIST_TYP
    ('+91 80 012 3735', '+91 80 083 3735'),'hi','INDIA','5000',
    'Burt.Neeson@TURNSTONE.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (930,'Buster','Jackson',cust_address_typ
    ('1617 Crackers St','361168','Bangalore - India','Kar','IN'),PHONE_LIST_TYP
    ('+91 80 012 3737'),'hi','INDIA','900','Buster.Jackson@KILLDEER.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (931,'Buster','Edwards',cust_address_typ
    ('1618 Footloose St','361168','Bangalore - India','Kar','IN'),PHONE_LIST_TYP
    ('+91 80 012 3739'),'hi','INDIA','900','Buster.Edwards@KINGLET.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (932,'Buster','Bogart',cust_address_typ
    ('1619 Footloose Rd','361168','Bangalore - India','Kar','IN'),PHONE_LIST_TYP
    ('+91 80 012 3741'),'hi','INDIA','900','Buster.Bogart@KISKADEE.EXAMPLE.COM',
    NULL,NULL);
INSERT INTO customers VALUES 
    (934,'C. Thomas','Nolte',cust_address_typ
    ('1621 Gargon! Blvd','361168','Bangalore - India','Kar','IN'),PHONE_LIST_TYP
    ('+91 80 012 3745'),'hi','INDIA','600','C.Thomas.Nolte@PHOEBE.EXAMPLE.COM',
    145,NULL);
INSERT INTO customers VALUES 
    (980,'Daniel','Loren',cust_address_typ
    ('1667 2010 St','61311','Batavia','IL','IN'),PHONE_LIST_TYP
    ('+91 80 012 3837'),'hi','INDIA','200','Daniel.Loren@REDSTART.EXAMPLE.COM',
    149,NULL);
INSERT INTO customers VALUES 
    (981,'Daniel','Gueney',cust_address_typ
    ('1668 Chong Tao','111181','Beijing','','CN'),PHONE_LIST_TYP
    ('+86 10 012 3839'),'zhs','CHINA','200','Daniel.Gueney@REDPOLL.EXAMPLE.COM',
    149,NULL); 

COMMIT;

UPDATE customers c SET account_mgr_id = 147 
 WHERE c.cust_address.country_id IN ('CH','DE','IT','CA');

UPDATE customers c SET account_mgr_id = 145 
 WHERE c.cust_address.country_id='US' and c.cust_address.state_province='IA';

UPDATE customers c SET account_mgr_id = 145
 WHERE c.cust_address.country_id='US' and c.cust_address.state_province='IN';

UPDATE customers c SET account_mgr_id = 145
 WHERE c.cust_address.country_id='US' and c.cust_address.state_province='MD';

UPDATE customers c SET account_mgr_id = 145
 WHERE c.cust_address.country_id='US' and c.cust_address.state_province='MI';

UPDATE customers c SET account_mgr_id = 145
 WHERE c.cust_address.country_id='US' and c.cust_address.state_province='MN';

UPDATE customers c SET account_mgr_id = 149
 WHERE c.cust_address.country_id='US' and c.cust_address.state_province='NY';

UPDATE customers c SET account_mgr_id = 149
 WHERE c.cust_address.country_id='US' and c.cust_address.state_province='PA';

UPDATE customers c SET account_mgr_id = 145
 WHERE c.cust_address.country_id='US' and c.cust_address.state_province='WI';

UPDATE customers c SET account_mgr_id = 148
 WHERE c.cust_address.country_id IN ('CN','IN','JP');

COMMIT;
