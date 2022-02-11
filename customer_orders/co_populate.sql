rem
rem Copyright (c) 2022 Oracle
rem
rem Permission is hereby granted, free of charge, to any person obtaining a
rem copy of this software and associated documentation files (the "Software"),
rem to deal in the Software without restriction, including without limitation
rem the rights to use, copy, modify, merge, publish, distribute, sublicense,
rem and/or sell copies of the Software, and to permit persons to whom the
rem Software is furnished to do so, subject to the following conditions:
rem
rem The above copyright notice and this permission notice shall be included in
rem all copies or substantial portions rem of the Software.
rem
rem THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
rem IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
rem FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
rem THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
rem LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
rem OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
rem SOFTWARE.
rem
rem NAME
rem   co_populate.sql - populates the CO (Customer Orders) tables with data
rem
rem DESCRIPTON
rem   This script populates the CO tables with rows of data
rem
rem SCHEMA VERSION
rem   21
rem
rem RELEASE DATE
rem   08-FEB-2022
rem
rem SUPPORTED with DB VERSIONS
rem   19c and higher
rem
rem MAJOR CHANGES IN THIS RELEASE
rem
rem
rem SCHEMA DEPENDENCIES AND REQUIREMENTS
rem   This script is called from the co_install.sql script
rem
rem INSTALL INSTRUCTIONS
rem    Run the co_install.sql script to call this script
rem
rem NOTES
rem   tbd
rem
rem --------------------------------------------------------------------------


SET VERIFY OFF
SET DEFINE OFF
ALTER SESSION SET NLS_LANGUAGE=American;

REM *************************** insert data into the CUSTOMERS table

Prompt ******  Populating CUSTOMERS table ....

BEGIN
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (1,'tammy.bryant@internalmail','Tammy Bryant');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (2,'roy.white@internalmail','Roy White');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (3,'gary.jenkins@internalmail','Gary Jenkins');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (4,'victor.morris@internalmail','Victor Morris');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (5,'beverly.hughes@internalmail','Beverly Hughes');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (6,'evelyn.torres@internalmail','Evelyn Torres');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (7,'carl.lee@internalmail','Carl Lee');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (8,'douglas.flores@internalmail','Douglas Flores');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (9,'norma.robinson@internalmail','Norma Robinson');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (10,'gregory.sanchez@internalmail','Gregory Sanchez');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (11,'judy.evans@internalmail','Judy Evans');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (12,'jean.patterson@internalmail','Jean Patterson');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (13,'michelle.ramirez@internalmail','Michelle Ramirez');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (14,'elizabeth.martinez@internalmail','Elizabeth Martinez');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (15,'walter.rogers@internalmail','Walter Rogers');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (16,'ralph.foster@internalmail','Ralph Foster');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (17,'tina.simmons@internalmail','Tina Simmons');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (18,'peter.jones@internalmail','Peter Jones');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (19,'kathryn.rogers@internalmail','Kathryn Rogers');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (20,'dennis.lopez@internalmail','Dennis Lopez');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (21,'martha.baker@internalmail','Martha Baker');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (22,'raymond.bailey@internalmail','Raymond Bailey');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (23,'christopher.allen@internalmail','Christopher Allen');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (24,'jonathan.coleman@internalmail','Jonathan Coleman');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (25,'walter.turner@internalmail','Walter Turner');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (26,'anna.murphy@internalmail','Anna Murphy');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (27,'carol.alexander@internalmail','Carol Alexander');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (28,'teresa.brown@internalmail','Teresa Brown');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (29,'beverly.rivera@internalmail','Beverly Rivera');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (30,'lisa.hughes@internalmail','Lisa Hughes');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (31,'deborah.taylor@internalmail','Deborah Taylor');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (32,'cheryl.young@internalmail','Cheryl Young');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (33,'carolyn.wood@internalmail','Carolyn Wood');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (34,'patricia.robinson@internalmail','Patricia Robinson');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (35,'joshua.nelson@internalmail','Joshua Nelson');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (36,'mary.barnes@internalmail','Mary Barnes');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (37,'sandra.bennett@internalmail','Sandra Bennett');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (38,'jack.brooks@internalmail','Jack Brooks');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (39,'harry.powell@internalmail','Harry Powell');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (40,'ernest.foster@internalmail','Ernest Foster');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (41,'jeremy.howard@internalmail','Jeremy Howard');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (42,'adam.walker@internalmail','Adam Walker');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (43,'michael.marker@internalmail','Michael Marker');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (44,'kris.krill@internalmail','Kris Krill');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (45,'fred.fontain@internalmail','Fred Fontain');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (46,'alwin.elliott@internalmail','Alwin Elliott');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (47,'finian.park@internalmail','Finian Park');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (48,'florencia.hopkins@internalmail','Florencia Hopkins');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (49,'kaija.crawford@internalmail','Kaija Crawford');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (50,'kimiko.brien@internalmail','Kimiko Brien');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (51,'michael.harris@internalmail','Michael Harris');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (52,'lola.whitley@internalmail','Lola Whitley');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (53,'witney.rockwell@internalmail','Witney Rockwell');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (54,'kellan.ye@internalmail','Kellan Ye');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (55,'michael.kim@internalmail','Michael Kim');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (56,'tamika.hu@internalmail','Tamika Hu');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (57,'michael.smith@internalmail','Michael Smith');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (58,'shamira.jones@internalmail','Shamira Jones');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (59,'debbie.sawbridge@internalmail','Debbie Sawbridge');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (60,'clair.maldonado@internalmail','Clair Maldonado');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (61,'pedro.aenlo@internalmail','Pedro Aenlo');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (62,'nus.biollix@internalmail','Nus Biollix');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (63,'eva.ogatius@internalmail','Eva Ogatius');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (64,'harriet.auxus@internalmail','Harriet Auxus');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (65,'domingo.morano@internalmail','Domingo Morano');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (66,'john.venzl@internalmail','John Venzl');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (67,'roberto.sipaia@internalmail','Roberto Sipaia');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (68,'emilio.sessaia@internalmail','Emilio Sessaia');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (69,'felix.auvacia@internalmail','Felix Auvacia');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (70,'santiago.vautus@internalmail','Santiago Vautus');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (71,'eduardo.flignia@internalmail','Eduardo Flignia');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (72,'raul.haelfeius@internalmail','Raul Haelfeius');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (73,'carlos.maza@internalmail','Carlos Maza');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (74,'alex.loera@internalmail','Alex Loera');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (75,'oscar.moye@internalmail','Oscar Moye');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (76,'daniella.almonte@internalmail','Daniella Almonte');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (77,'paz.montilla@internalmail','Paz Montilla');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (78,'gricelda.luebbers@internalmail','Gricelda Luebbers');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (79,'dean.bollich@internalmail','Dean Bollich');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (80,'milo.manoni@internalmail','Milo Manoni');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (81,'laurice.karl@internalmail','Laurice Karl');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (82,'august.rupel@internalmail','August Rupel');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (83,'salome.guisti@internalmail','Salome Guisti');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (84,'lovie.ritacco@internalmail','Lovie Ritacco');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (85,'chaya.greczkowski@internalmail','Chaya Greczkowski');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (86,'twila.coolbeth@internalmail','Twila Coolbeth');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (87,'carlotta.achenbach@internalmail','Carlotta Achenbach');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (88,'jeraldine.audet@internalmail','Jeraldine Audet');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (89,'august.arouri@internalmail','August Arouri');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (90,'ward.stepney@internalmail','Ward Stepney');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (91,'ayana.barkhurst@internalmail','Ayana Barkhurst');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (92,'luana.berends@internalmail','Luana Berends');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (93,'lecia.alvino@internalmail','Lecia Alvino');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (94,'joleen.himmelmann@internalmail','Joleen Himmelmann');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (95,'monty.kinnamon@internalmail','Monty Kinnamon');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (96,'dania.grizzard@internalmail','Dania Grizzard');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (97,'inez.yamnitz@internalmail','Inez Yamnitz');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (98,'fidel.creps@internalmail','Fidel Creps');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (99,'luis.pothoven@internalmail','Luis Pothoven');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (100,'bernardo.phoenix@internalmail','Bernardo Phoenix');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (101,'carolyne.centore@internalmail','Carolyne Centore');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (102,'cornell.pratico@internalmail','Cornell Pratico');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (103,'sam.rueb@internalmail','Sam Rueb');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (104,'shakita.sablock@internalmail','Shakita Sablock');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (105,'sandy.heffren@internalmail','Sandy Heffren');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (106,'tressa.coppens@internalmail','Tressa Coppens');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (107,'shira.arocho@internalmail','Shira Arocho');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (108,'carter.sacarello@internalmail','Carter Sacarello');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (109,'linda.merida@internalmail','Linda Merida');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (110,'winfred.sohn@internalmail','Winfred Sohn');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (111,'nestor.caparros@internalmail','Nestor Caparros');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (112,'brooks.craker@internalmail','Brooks Craker');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (113,'ruthann.nixa@internalmail','Ruthann Nixa');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (114,'kenny.campobasso@internalmail','Kenny Campobasso');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (115,'hildred.donnel@internalmail','Hildred Donnel');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (116,'luther.ardinger@internalmail','Luther Ardinger');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (117,'rhoda.hasfjord@internalmail','Rhoda Hasfjord');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (118,'cori.ablin@internalmail','Cori Ablin');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (119,'reinaldo.feltner@internalmail','Reinaldo Feltner');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (120,'coralee.acerno@internalmail','Coralee Acerno');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (121,'katherine.tagg@internalmail','Katherine Tagg');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (122,'lenore.sullivan@internalmail','Lenore Sullivan');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (123,'erda.sheer@internalmail','erda Sheer');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (124,'pete.chevis@internalmail','Pete Chevis');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (125,'joseph.wilke@internalmail','Joseph Wilke');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (126,'nella.rupnick@internalmail','Nella Rupnick');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (127,'azalee.goodwater@internalmail','Azalee Goodwater');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (128,'stefany.waninger@internalmail','Stefany Waninger');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (129,'arron.waclawski@internalmail','Arron Waclawski');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (130,'boyd.rearden@internalmail','Boyd Rearden');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (131,'erasmo.riviera@internalmail','Erasmo Riviera');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (132,'ambrose.hiday@internalmail','Ambrose Hiday');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (133,'horacio.rainbolt@internalmail','Horacio Rainbolt');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (134,'taylor.cauchon@internalmail','Taylor Cauchon');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (135,'marc.domanski@internalmail','Marc Domanski');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (136,'kaylene.lusco@internalmail','Kaylene Lusco');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (137,'norris.michener@internalmail','Norris Michener');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (138,'rob.kempt@internalmail','Rob Kempt');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (139,'elaine.moncure@internalmail','Elaine Moncure');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (140,'joshua.disano@internalmail','Joshua Disano');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (141,'lai.kurtich@internalmail','Lai Kurtich');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (142,'lucas.summerill@internalmail','Lucas Summerill');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (143,'vincent.hibberd@internalmail','Vincent Hibberd');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (144,'sharla.topper@internalmail','Sharla Topper');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (145,'andrew.schieferstein@internalmail','Andrew Schieferstein');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (146,'rey.wada@internalmail','Rey Wada');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (147,'jonell.pecatoste@internalmail','Jonell Pecatoste');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (148,'kurtis.parham@internalmail','Kurtis Parham');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (149,'quinn.yerdon@internalmail','Quinn Yerdon');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (150,'meg.vetterkind@internalmail','Meg Vetterkind');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (151,'alex.binette@internalmail','Alex Binette');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (152,'ali.brengle@internalmail','Ali Brengle');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (153,'jaimee.gammons@internalmail','Jaimee Gammons');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (154,'alva.halajian@internalmail','Alva Halajian');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (155,'latoria.siprasoeuth@internalmail','Latoria Siprasoeuth');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (156,'merlyn.summerford@internalmail','Merlyn Summerford');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (157,'nelson.koschnitzki@internalmail','Nelson Koschnitzki');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (158,'adeline.iannotti@internalmail','Adeline Iannotti');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (159,'saul.mokry@internalmail','Saul Mokry');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (160,'laveta.wida@internalmail','Laveta Wida');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (161,'dexter.petiet@internalmail','Dexter Petiet');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (162,'chet.morano@internalmail','Chet Morano');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (163,'jannie.thibideau@internalmail','Jannie Thibideau');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (164,'janey.fornell@internalmail','Janey Fornell');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (165,'gerda.bartha@internalmail','Gerda Bartha');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (166,'kristina.livshits@internalmail','Kristina Livshits');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (167,'matilda.toedebusch@internalmail','Matilda Toedebusch');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (168,'ami.dardar@internalmail','Ami Dardar');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (169,'desmond.lifschitz@internalmail','Desmond Lifschitz');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (170,'marco.slivka@internalmail','Marco Slivka');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (171,'danica.riogas@internalmail','Danica Riogas');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (172,'cathey.salen@internalmail','Cathey Salen');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (173,'tabetha.florentino@internalmail','Tabetha Florentino');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (174,'daisy.liddicoat@internalmail','Daisy Liddicoat');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (175,'jacklyn.niskala@internalmail','Jacklyn Niskala');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (176,'herb.tammen@internalmail','Herb Tammen');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (177,'verlie.ashland@internalmail','Verlie Ashland');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (178,'jacklyn.clippard@internalmail','Jacklyn Clippard');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (179,'verlie.bekerman@internalmail','Verlie Bekerman');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (180,'teisha.grimstead@internalmail','Teisha Grimstead');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (181,'scotty.goffredo@internalmail','Scotty Goffredo');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (182,'nelson.golz@internalmail','Nelson Golz');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (183,'jewel.clippard@internalmail','Jewel Clippard');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (184,'rudolph.bekerman@internalmail','Rudolph Bekerman');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (185,'laurice.grimstead@internalmail','Laurice Grimstead');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (186,'laurice.goffredo@internalmail','Laurice Goffredo');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (187,'scotty.r.goffredo@internalmail','Scotty R Goffredo');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (188,'emmett.golz@internalmail','Emmett Golz');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (189,'norman.lobregat@internalmail','Norman Lobregat');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (190,'tim.blasingim@internalmail','Tim Blasingim');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (191,'brandy.genco@internalmail','Brandy Genco');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (192,'jewel.pedroncelli@internalmail','Jewel Pedroncelli');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (193,'verda.puchalla@internalmail','Verda Puchalla');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (194,'norman.s.lobregat@internalmail','Norman Simon Lobregat');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (195,'tim.d.blasingim@internalmail','Tim Dominic Blasingim');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (196,'tim.genco@internalmail','Tim Genco');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (197,'hung.pedroncelli@internalmail','Hung Pedroncelli');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (198,'loyd.puchalla@internalmail','Loyd Puchalla');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (199,'eustolia.temores@internalmail','Eustolia Temores');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (200,'jessika.doorn@internalmail','Jessika Doorn');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (201,'marvis.chou@internalmail','Marvis Chou');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (202,'loyd.huckeba@internalmail','Loyd Huckeba');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (203,'leon.schoepfer@internalmail','Leon Schoepfer');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (204,'luigi.nored@internalmail','Luigi Nored');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (205,'thaddeus.geneseo@internalmail','Thaddeus Geneseo');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (206,'casey.chestand@internalmail','Casey Chestand');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (207,'pete.carvallo@internalmail','Pete Carvallo');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (208,'angel.sakoda@internalmail','Angel Sakoda');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (209,'donnell.huttle@internalmail','Donnell Huttle');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (210,'tyler.curlee@internalmail','Tyler Curlee');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (211,'markita.larner@internalmail','Markita Larner');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (212,'chante.parez@internalmail','Chante Parez');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (213,'alvin.gagner@internalmail','Alvin Gagner');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (214,'richard.howard@internalmail','Richard Howard');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (215,'donna.foster@internalmail','Donna Foster');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (216,'ruth.robinson@internalmail','Ruth Robinson');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (217,'william.diaz@internalmail','William Diaz');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (218,'susan.jenkins@internalmail','Susan Jenkins');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (219,'carol.barnes@internalmail','Carol Barnes');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (220,'sarah.murphy@internalmail','Sarah Murphy');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (221,'dorothy.gray@internalmail','Dorothy Gray');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (222,'ruth.graham@internalmail','Ruth Graham');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (223,'robert.west@internalmail','Robert West');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (224,'carol.metrick@internalmail','Carol Metrick');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (225,'li.robleto@internalmail','Li Robleto');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (226,'bert.takes@internalmail','Bert Takes');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (227,'son.mclagan@internalmail','Son McLagan');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (228,'van.seaforth@internalmail','Van Seaforth');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (229,'florance.bateman@internalmail','Florance Bateman');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (230,'bridgette.crevier@internalmail','Bridgette Crevier');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (231,'murray.vicario@internalmail','Murray Vicario');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (232,'loris.thibadeau@internalmail','Loris Thibadeau');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (233,'lakia.fitzen@internalmail','Lakia Fitzen');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (234,'angelo.carreon@internalmail','Angelo Carreon');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (235,'collene.guderjahn@internalmail','Collene Guderjahn');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (236,'trenton.stoermer@internalmail','Trenton Stoermer');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (237,'barry.tolliver@internalmail','Barry Tolliver');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (238,'lloyd.shackley@internalmail','Lloyd Shackley');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (239,'luciano.lingenfelter@internalmail','Luciano Lingenfelter');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (240,'edmund.hikel@internalmail','Edmund Hikel');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (241,'jolene.johannesen@internalmail','Jolene Johannesen');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (242,'raymon.survant@internalmail','Raymon Survant');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (243,'reyes.paczkowski@internalmail','Reyes Paczkowski');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (244,'freddie.kirkhart@internalmail','Freddie Kirkhart');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (245,'jamison.scrobola@internalmail','Jamison Scrobola');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (246,'rasheeda.teegarden@internalmail','Rasheeda Teegarden');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (247,'haywood.burd@internalmail','Haywood Burd');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (248,'eldon.lannon@internalmail','Eldon Lannon');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (249,'marissa.pontius@internalmail','Marissa Pontius');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (250,'otha.murton@internalmail','Otha Murton');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (251,'dannie.mccoin@internalmail','Dannie McCoin');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (252,'trey.gorham@internalmail','Trey Gorham');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (253,'nanci.bunt@internalmail','Nanci Bunt');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (254,'will.parliman@internalmail','Will Parliman');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (255,'justin.dorff@internalmail','Justin Dorff');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (256,'wyatt.tschache@internalmail','Wyatt Tschache');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (257,'chong.carpinelli@internalmail','Chong Carpinelli');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (258,'adan.lamica@internalmail','Adan Lamica');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (259,'beckie.lagrenade@internalmail','Beckie Lagrenade');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (260,'jacques.bartash@internalmail','Jacques Bartash');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (261,'buster.landin@internalmail','Buster Landin');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (262,'kendrick.mcmurtrey@internalmail','Kendrick McMurtrey');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (263,'jerrell.kereluk@internalmail','Jerrell Kereluk');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (264,'monroe.braylock@internalmail','Monroe Braylock');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (265,'anderson.keaffaber@internalmail','Anderson Keaffaber');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (266,'love.whistlehunt@internalmail','Love Whistlehunt');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (267,'petrina.gummo@internalmail','Petrina Gummo');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (268,'jeremiah.nuanes@internalmail','Jeremiah Nuanes');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (269,'shon.capetl@internalmail','Shon Capetl');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (270,'chasidy.fetui@internalmail','Chasidy Fetui');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (271,'dorsey.arking@internalmail','Dorsey Arking');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (272,'dagny.bumatay@internalmail','Dagny Bumatay');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (273,'elden.arancibia@internalmail','Elden Arancibia');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (274,'broderick.dourado@internalmail','Broderick Dourado');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (275,'elden.bufton@internalmail','Elden Bufton');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (276,'chassidy.hinderaker@internalmail','Chassidy Hinderaker');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (277,'broderick.faur@internalmail','Broderick Faur');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (278,'jewel.ginnery@internalmail','Jewel Ginnery');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (279,'james.williams@internalmail','James Williams');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (280,'james.wilson@internalmail','James Wilson');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (281,'mary.wilson@internalmail','Mary Wilson');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (282,'patricia.wilson@internalmail','Patricia Wilson');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (283,'james.smith@internalmail','James Smith');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (284,'zavert.zimmer@internalmail','Zavert Zimmer');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (285,'albert.altmeer@internalmail','Albert Altmeer');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (286,'wilfred.welch@internalmail','Wilfred Welch');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (287,'kristina.nunez@internalmail','Kristina Nunez');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (288,'mable.ballard@internalmail','Mable Ballard');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (289,'diane.wilkerson@internalmail','Diane Wilkerson');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (290,'sheryl.banks@internalmail','Sheryl Banks');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (291,'opal.cruz@internalmail','Opal Cruz');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (292,'dale.hughes@internalmail','Dale Hughes');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (293,'diana.fowler@internalmail','Diana Fowler');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (294,'travis.schwartz@internalmail','Travis Schwartz');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (295,'anthony.boone@internalmail','Anthony Boone');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (296,'tim.harmon@internalmail','Tim Harmon');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (297,'kristin.brooks@internalmail','Kristin Brooks');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (298,'kathy.dennis@internalmail','Kathy Dennis');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (299,'vickie.james@internalmail','Vickie James');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (300,'sandra.bass@internalmail','Sandra Bass');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (301,'nelson.tate@internalmail','Nelson Tate');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (302,'tiffany.pena@internalmail','Tiffany Pena');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (303,'jeannette.hunt@internalmail','Jeannette Hunt');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (304,'willie.cunningham@internalmail','Willie Cunningham');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (305,'paulette.byrd@internalmail','Paulette Byrd');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (306,'tasha.cobb@internalmail','Tasha Cobb');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (307,'eloise.burton@internalmail','Eloise Burton');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (308,'felix.fox@internalmail','Felix Fox');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (309,'gary.barton@internalmail','Gary Barton');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (310,'tracy.mcbride@internalmail','Tracy Mcbride');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (311,'lorita.koenig@internalmail','Lorita Koenig');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (312,'kaleigh.meade@internalmail','Kaleigh Meade');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (313,'lexie.magee@internalmail','Lexie Magee');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (314,'landon.neville@internalmail','Landon Neville');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (315,'lillia.talbott@internalmail','Lillia Talbott');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (316,'dinah.paredes@internalmail','Dinah Paredes');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (317,'mercy.whiting@internalmail','Mercy Whiting');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (318,'thomas.huddleston@internalmail','Thomas Huddleston');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (319,'rubi.carlisle@internalmail','Rubi Carlisle');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (320,'vivien.cameron@internalmail','Vivien Cameron');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (321,'maia.leggett@internalmail','Maia Leggett');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (322,'florencia.kohler@internalmail','Florencia Kohler');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (323,'lucila.heck@internalmail','Lucila Heck');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (324,'kendrick.caraballo@internalmail','Kendrick Caraballo');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (325,'annemarie.pinckney@internalmail','Annemarie Pinckney');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (326,'carmella.avalos@internalmail','Carmella Avalos');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (327,'jules.ruffin@internalmail','Jules Ruffin');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (328,'tish.stapleton@internalmail','Tish Stapleton');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (329,'elin.seidel@internalmail','Elin Seidel');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (330,'shawn.sorenson@internalmail','Shawn Sorenson');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (331,'winfred.august@internalmail','Winfred August');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (332,'virgie.breeden@internalmail','Virgie Breeden');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (333,'ericka.oconner@internalmail','Ericka Oconner');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (334,'cheree.kemp@internalmail','Cheree Kemp');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (335,'rayford.salley@internalmail','Rayford Salley');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (336,'zulma.olds@internalmail','Zulma Olds');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (337,'salena.wadsworth@internalmail','Salena Wadsworth');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (338,'mohammad.cervantes@internalmail','Mohammad Cervantes');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (339,'tanja.vanover@internalmail','Tanja Vanover');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (340,'lonnie.colby@internalmail','Lonnie Colby');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (341,'monte.calloway@internalmail','Monte Calloway');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (342,'melisa.banda@internalmail','Melisa Banda');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (343,'gisela.costello@internalmail','Gisela Costello');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (344,'libby.krauss@internalmail','Libby Krauss');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (345,'mireille.pauley@internalmail','Mireille Pauley');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (346,'hassie.grogan@internalmail','Hassie Grogan');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (347,'chi.mcwhorter@internalmail','Chi Mcwhorter');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (348,'connie.delagarza@internalmail','Connie Delagarza');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (349,'britney.gable@internalmail','Britney Gable');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (350,'lorilee.bautista@internalmail','Lorilee Bautista');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (351,'anisa.kurtz@internalmail','Anisa Kurtz');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (352,'maryalice.evers@internalmail','Maryalice Evers');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (353,'andria.myles@internalmail','Andria Myles');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (354,'dede.bundy@internalmail','Dede Bundy');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (355,'twila.hilliard@internalmail','Twila Hilliard');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (356,'gene.mcginnis@internalmail','Gene Mcginnis');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (357,'shaquana.carney@internalmail','Shaquana Carney');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (358,'gita.dobbs@internalmail','Gita Dobbs');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (359,'dorathy.hutchings@internalmail','Dorathy Hutchings');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (360,'shirley.ward@internalmail','Shirley Ward');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (361,'frank.perez@internalmail','Frank Perez');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (362,'barbara.allen@internalmail','Barbara Allen');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (363,'justin.king@internalmail','Justin King');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (364,'harold.griffin@internalmail','Harold Griffin');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (365,'jeffrey.coleman@internalmail','Jeffrey Coleman');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (366,'margaret.bennett@internalmail','Margaret Bennett');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (367,'cheryl.phillips@internalmail','Cheryl Phillips');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (368,'joan.miller@internalmail','Joan Miller');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (369,'chris.powell@internalmail','Chris Powell');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (370,'russell.rivera@internalmail','Russell Rivera');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (371,'nancy.hall@internalmail','Nancy Hall');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (372,'gerald.evans@internalmail','Gerald Evans');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (373,'jennifer.cooper@internalmail','Jennifer Cooper');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (374,'irene.moore@internalmail','Irene Moore');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (375,'sean.adams@internalmail','Sean Adams');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (376,'stephen.butler@internalmail','Stephen Butler');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (377,'adam.martinez@internalmail','Adam Martinez');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (378,'angela.bailey@internalmail','Angela Bailey');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (379,'pamela.gonzalez@internalmail','Pamela Gonzalez');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (380,'arthur.hill@internalmail','Arthur Hill');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (381,'jesse.nelson@internalmail','Jesse Nelson');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (382,'stephanie.jones@internalmail','Stephanie Jones');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (383,'robert.simmons@internalmail','Robert Simmons');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (384,'denise.white@internalmail','Denise White');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (385,'theresa.wilson@internalmail','Theresa Wilson');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (386,'andrea.james@internalmail','Andrea James');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (387,'steven.brown@internalmail','Steven Brown');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (388,'nicholas.diaz@internalmail','Nicholas Diaz');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (389,'justin.bailey@internalmail','Justin Bailey');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (390,'pamela.alexander@internalmail','Pamela Alexander');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (391,'edward.coleman@internalmail','Edward Coleman');
  insert into customers (CUSTOMER_ID,EMAIL_ADDRESS,FULL_NAME) values (392,'adam.miller@internalmail','Adam Miller');
END;
/

REM *************************** insert data into the PRODUCTS table

Prompt ******  Populating PRODUCTS table ....

BEGIN
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (1,'Boy''s Shirt (White)',29.55,UTL_RAW.CAST_TO_RAW( '{"colour":"white","gender":"Boy''s","brand":"COMTOURS","description":"Labore commodo velit cupidatat ullamco ea proident velit sunt adipisicing. Esse tempor exercitation reprehenderit ullamco esse incididunt dolore laboris Lorem ipsum fugiat ea.","sizes":["1 Yr","2 Yr","3-4 Yr","5-6 Yr","7-8 Yr","9-10 Yr"],"reviews":[]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (2,'Women''s Shirt (Green)',16.67,UTL_RAW.CAST_TO_RAW( '{"colour":"green","gender":"Women''s","brand":"FLEETMIX","description":"Excepteur anim adipisicing aliqua ad. Ex aliquip ad tempor cupidatat dolore ipsum ex anim Lorem aute amet.","sizes":[0,2,4,6,8,10,12,14,16,18,20],"reviews":[{"rating":8,"review":"Laborum ipsum adipisicing magna nulla tempor incididunt."},{"rating":10,"review":"Cupidatat dolore nulla pariatur quis quis."},{"rating":9,"review":"Pariatur mollit dolor in deserunt cillum consectetur."},{"rating":3,"review":"Dolore occaecat mollit id ad aliqua irure reprehenderit amet eiusmod pariatur."},{"rating":10,"review":"Est pariatur et qui minim velit non consectetur sint fugiat ad."},{"rating":6,"review":"Et pariatur ipsum eu qui."},{"rating":6,"review":"Voluptate labore irure cupidatat mollit irure quis fugiat enim laborum consectetur officia sunt."},{"rating":8,"review":"Irure elit do et elit aute veniam proident sunt."},{"rating":8,"review":"Aute mollit proident id veniam occaecat dolore mollit dolore nostrud."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (3,'Boy''s Sweater (Green)',44.17,UTL_RAW.CAST_TO_RAW( '{"colour":"green","gender":"Boy''s","brand":"KINETICA","description":"Occaecat dolore in ut et ad pariatur laborum mollit nulla exercitation. Laboris esse tempor quis velit nostrud exercitation veniam reprehenderit minim minim exercitation.","sizes":["1 Yr","2 Yr","3-4 Yr","5-6 Yr","7-8 Yr","9-10 Yr"],"reviews":[{"rating":5,"review":"Sunt ad proident excepteur laboris officia eu reprehenderit dolor nostrud elit nulla pariatur incididunt Lorem."},{"rating":2,"review":"Ullamco ad amet fugiat adipisicing."}]}') );

  -- split over two lines as 32k varchar2 to avoid SQL*Plus length limit
  prod_details := '{"colour":"white","gender":"Boy''s","brand":"INTERLOO","description":"Nostrud esse velit incididunt occaecat ullamco dolor quis reprehenderit proident dolore deserunt tempor qui proident. Magna deserunt sit minim eu commodo minim labore occaecat ea id sint laborum.","sizes":["1 Yr","2 Yr","3-4 Yr","5-6 Yr","7-8 Yr","9-10 Yr"],"reviews":[{"rating":7,"review":"Anim culpa qui est adipisicing qui dolore enim. Sint duis aute laborum nisi ut elit Lorem nisi proident consectetur."},{"rating":6,"review":"Reprehenderit ad ipsum sint mollit aliqua."},{"rating":4,"review":"Enim culpa reprehenderit non ullamco non ex veniam. Sit do incididunt ullamco ad et et aliquip deserunt dolor officia nostrud ipsum officia nostrud. Lorem esse tempor aliqua ut quis occaecat."},{"rating":9,"review":"Pariatur sit dolor dolor tempor commodo aute culpa sit."},{"rating":2,"review":"Sunt enim sunt occaecat exercitation deserunt nisi anim mollit deserunt non laboris cillum."},{"rating":8,"review":"Exercitation et duis quis minim id duis veniam occaecat amet cillum velit pariatur tempor. Culpa aliquip adipisicing aliquip non minim occaecat eu nisi esse veniam eu aliqua."},{"rating":5,"review":"Culpa elit nulla dolore mollit tempor mollit in. Voluptate deserunt eiusmod sint id excepteur eiusmod excepteur qui enim cupidatat. Nostrud enim anim commodo adipisicing nisi dolore commodo elit commodo aliqua aliquip laborum."},{"rating":4,"review":"Exercitation sunt consequat anim nisi sunt cillum esse amet ut reprehenderit ea. Laborum labore ipsum consectetur ad excepteur proident fugiat consectetur eiusmod incididunt officia enim ullamco."},{"rating":2,"review":"Duis elit dolore Lorem commodo fugiat ad aliquip mollit ea. Sit fugiat officia tempor magna sit nisi irure exercitation deserunt mollit. Consequat est sunt qui non adipisicing."},{"rating":8,"review":"Nostrud laboris enim enim officia officia in non proident in do fugiat sit Lorem aliquip. Culpa ex voluptate exercitation velit."},{"rating":4,"review":"Sit ullamco est esse dolore sint aliquip enim id velit aliqua ex. Ex velit nulla occaecat ipsum reprehenderit."},{"rating":5,"review":"Deserunt nisi minim culpa cupidatat Lorem nisi anim pariatur tempor ut officia. Est minim veniam eiusmod eiusmod mollit aliqua incididunt aliqua nisi officia dolor amet cillum est."},' || chr(10) ||
'{"rating":2,"review":"Labore incididunt quis dolor nostrud cupidatat culpa aute ullamco culpa proident aliqua. Ut minim ullamco mollit do elit laboris adipisicing elit."},{"rating":3,"review":"Sunt nisi est culpa anim eu et cillum eu deserunt fugiat et id ullamco ea. Aliquip et amet est Lorem duis aliquip sunt aliqua adipisicing occaecat dolor."},{"rating":2,"review":"Ipsum culpa elit id officia consequat tempor esse enim cupidatat."},{"rating":9,"review":"Quis do duis Lorem dolor proident ex Lorem eiusmod quis deserunt officia reprehenderit. Sint ullamco in in reprehenderit excepteur. Eiusmod ut enim id nisi."},{"rating":7,"review":"Dolor nisi laboris cillum laboris amet fugiat magna enim est veniam quis. Ipsum voluptate ea ipsum consequat nisi velit."},{"rating":2,"review":"Sunt occaecat irure excepteur Lorem eiusmod laboris sit ex duis ea non sunt. Eiusmod cillum ex in labore cillum sint ex eiusmod reprehenderit elit. Proident aute ad occaecat esse minim."},{"rating":2,"review":"Voluptate enim minim elit esse ea laboris esse."},{"rating":7,"review":"Cillum ullamco consectetur irure reprehenderit voluptate cillum pariatur cillum. Fugiat elit elit anim culpa exercitation ex enim."},{"rating":1,"review":"Pariatur reprehenderit velit excepteur esse eiusmod sit. Veniam ut do cupidatat duis."},{"rating":2,"review":"Tempor velit irure duis voluptate."},{"rating":7,"review":"Reprehenderit culpa ad nisi ut minim anim id dolore."},{"rating":8,"review":"Cupidatat aute incididunt nostrud ex aute ad dolore. Enim labore elit voluptate culpa deserunt aliquip minim."},{"rating":9,"review":"Ad ea exercitation laboris proident occaecat laborum veniam ipsum occaecat aute proident ad."},{"rating":9,"review":"Velit ipsum nulla in adipisicing. Dolore eu et enim enim esse culpa irure non ut in labore labore aliqua. Sint ullamco laboris eiusmod minim veniam voluptate esse veniam exercitation voluptate qui pariatur."},{"rating":10,"review":"Dolor duis pariatur aliqua excepteur exercitation pariatur incididunt sit proident eu labore ea. Sint tempor proident amet sint anim Lorem reprehenderit sit pariatur voluptate dolore velit."},{"rating":1,"review":"Eiusmod ad aute ullamco aute mollit est reprehenderit consectetur nisi nulla amet consectetur culpa. Do et commodo sit deserunt aliqua deserunt non culpa est occaecat."},{"rating":4,"review":"Cupidatat est sint velit amet incididunt esse magna nostrud ea mollit nisi enim ad voluptate."},{"rating":10}]}';

  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (4,'Boy''s Trousers (White)',43.71,UTL_RAW.CAST_TO_RAW( prod_details ) );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (5,'Girl''s Shorts (Red)',38.28,UTL_RAW.CAST_TO_RAW( '{"colour":"red","gender":"Girl''s","brand":"OZEAN","description":"Reprehenderit labore id in quis nulla in proident duis fugiat. Amet do occaecat ut voluptate id do.","sizes":["1 Yr","2 Yr","3-4 Yr","5-6 Yr","7-8 Yr","9-10 Yr"],"reviews":[]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (6,'Boy''s Socks (Grey)',19.16,UTL_RAW.CAST_TO_RAW( '{"colour":"grey","gender":"Boy''s","brand":"GROK","description":"Pariatur elit adipisicing aute dolor sunt laborum ullamco aliqua exercitation consectetur. Lorem qui sint ullamco sint commodo anim.","sizes":["1 Yr","2 Yr","3-4 Yr","5-6 Yr","7-8 Yr","9-10 Yr"],"reviews":[{"rating":5,"review":"Ea eu sit est consectetur quis in dolor ut."},{"rating":6,"review":"In do cillum occaecat minim."},{"rating":6,"review":"Laborum laborum excepteur ipsum aliquip reprehenderit cillum irure proident voluptate eiusmod in culpa."},{"rating":9,"review":"Exercitation magna proident non deserunt consectetur consectetur do ex sint id irure ipsum voluptate."},{"rating":7,"review":"Aliquip irure minim quis quis voluptate reprehenderit mollit dolore."},{"rating":1,"review":"Duis mollit aute cillum aute culpa magna."},{"rating":9,"review":"Magna exercitation exercitation sit commodo proident fugiat occaecat ullamco voluptate do consectetur officia velit."},{"rating":7,"review":"Laboris nostrud et nulla tempor commodo non aute ipsum excepteur qui dolore enim."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (7,'Boy''s Socks (Black)',19.58,UTL_RAW.CAST_TO_RAW( '{"colour":"black","gender":"Boy''s","brand":"ENERVATE","description":"Sit minim sunt nulla proident velit Lorem dolor. Aute reprehenderit laborum labore proident non esse nisi ex magna consectetur minim ex est.","sizes":["1 Yr","2 Yr","3-4 Yr","5-6 Yr","7-8 Yr","9-10 Yr"],"reviews":[{"rating":8,"review":"Laborum laboris eu occaecat amet adipisicing consequat veniam velit."},{"rating":2,"review":"Mollit fugiat commodo minim sint do irure duis quis ex minim ad."},{"rating":2,"review":"Sit duis aliquip proident et nostrud enim anim amet dolor consequat tempor culpa."},{"rating":3,"review":"Proident aute voluptate aute irure."},{"rating":2,"review":"Ex excepteur duis irure veniam elit occaecat sit Lorem labore id minim tempor dolore officia."},{"rating":2,"review":"Amet fugiat commodo qui eiusmod dolore sint fugiat commodo elit qui esse in officia."},{"rating":2,"review":"Dolor proident proident ad officia cillum dolor aute officia enim exercitation."},{"rating":4,"review":"Dolor esse cupidatat eiusmod non veniam elit nostrud aliquip eu elit."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (8,'Boy''s Coat (Brown)',21.16,UTL_RAW.CAST_TO_RAW( '{"colour":"brown","gender":"Boy''s","brand":"KOFFEE","description":"Voluptate quis excepteur mollit id dolore. Sunt aliquip in magna ut irure nostrud duis officia fugiat aute.","sizes":["1 Yr","2 Yr","3-4 Yr","5-6 Yr","7-8 Yr","9-10 Yr"],"reviews":[]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (9,'Women''s Jeans (Brown)',29.49,UTL_RAW.CAST_TO_RAW( '{"colour":"brown","gender":"Women''s","brand":"PROTODYNE","description":"Est dolor tempor sint commodo irure sint ut dolor proident enim Lorem. Pariatur deserunt nostrud quis minim non.","sizes":[0,2,4,6,8,10,12,14,16,18,20],"reviews":[{"rating":2,"review":"Occaecat cupidatat in id elit magna Lorem esse ad magna labore non qui magna."},{"rating":8,"review":"Cupidatat cupidatat laboris consectetur labore veniam aliqua et incididunt duis sunt proident."},{"rating":2,"review":"Esse ipsum veniam ullamco irure ad minim mollit consequat non dolor labore."},{"rating":1,"review":"Cillum ea minim voluptate id ut consectetur commodo nostrud cillum eiusmod eiusmod dolore cillum veniam."},{"rating":5,"review":"Excepteur adipisicing culpa dolor id et irure sint ex non nostrud velit pariatur esse quis."},{"rating":9,"review":"Do fugiat aliqua sunt quis proident fugiat."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (10,'Women''s Skirt (Red)',30.69,UTL_RAW.CAST_TO_RAW( '{"colour":"green","gender":"Women''s","brand":"FLYBOYZ","description":"Qui aliquip dolor aute labore amet nostrud deserunt nulla ut veniam id. Ut aute velit tempor anim ex sit nisi.","sizes":[0,2,4,6,8,10,12,14,16,18,20],"reviews":[{"rating":7,"review":"Mollit consequat minim sit consequat deserunt duis."},{"rating":8,"review":"Quis eu esse proident elit eu aliqua magna voluptate labore adipisicing voluptate ex do."},{"rating":6,"review":"Laborum nulla aliquip nulla adipisicing aliquip qui cupidatat aliquip in."},{"rating":3,"review":"Exercitation aute voluptate voluptate tempor sit enim ut veniam do."},{"rating":8,"review":"Cillum cillum anim aliqua eu deserunt amet eu ut veniam in qui."},{"rating":7,"review":"Nostrud aliqua ullamco irure consectetur elit nisi eu elit reprehenderit ut."},{"rating":5,"review":"Irure nisi dolore dolore ut non ad minim pariatur."},{"rating":2,"review":"Laboris aliqua sint est incididunt sunt non tempor irure reprehenderit labore."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (11,'Boy''s Shorts (Blue)',10.48,UTL_RAW.CAST_TO_RAW( '{"colour":"blue","gender":"Boy''s","brand":"WRAPTURE","description":"Id sit adipisicing ea dolore fugiat laborum ut dolore. Reprehenderit aliqua non adipisicing aliqua adipisicing aute ullamco consectetur est aliqua.","sizes":["1 Yr","2 Yr","3-4 Yr","5-6 Yr","7-8 Yr","9-10 Yr"],"reviews":[{"rating":7,"review":"Laborum labore exercitation culpa sint cillum aute duis labore do excepteur."},{"rating":10,"review":"Do velit laborum adipisicing velit."},{"rating":6,"review":"Culpa dolor aute adipisicing ad."},{"rating":6,"review":"Sit sunt elit proident fugiat consectetur id incididunt nulla nulla magna consectetur."},{"rating":6,"review":"Adipisicing ipsum eiusmod sint ullamco dolor irure qui officia."},{"rating":4,"review":"Ipsum commodo amet non ut labore."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (12,'Boy''s Socks (White)',12.64,UTL_RAW.CAST_TO_RAW( '{"colour":"grey","gender":"Boy''s","brand":"HANDSHAKE","description":"Tempor laborum voluptate mollit aliquip et tempor nostrud Lorem. Nostrud anim exercitation est fugiat elit est deserunt mollit exercitation.","sizes":["1 Yr","2 Yr","3-4 Yr","5-6 Yr","7-8 Yr","9-10 Yr"],"reviews":[{"rating":8,"review":"Quis culpa laborum ex magna."},{"rating":3,"review":"Culpa ullamco deserunt ex ea."},{"rating":3,"review":"Fugiat ullamco reprehenderit tempor nulla ad fugiat qui excepteur sunt officia deserunt nulla."},{"rating":2,"review":"Mollit dolore magna magna veniam culpa ullamco tempor esse id in occaecat excepteur ullamco ea."},{"rating":10,"review":"Culpa dolore enim consequat aliquip nulla ipsum."},{"rating":2,"review":"Excepteur aliqua sunt exercitation mollit pariatur anim tempor."},{"rating":8,"review":"Proident culpa tempor dolore deserunt anim ea deserunt quis duis."},{"rating":8,"review":"Reprehenderit est do quis quis reprehenderit adipisicing qui Lorem mollit sit labore veniam."},{"rating":1,"review":"Mollit dolore ad laboris ut cillum velit in sint labore nulla Lorem minim."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (13,'Boy''s Hoodie (Grey)',26.14,UTL_RAW.CAST_TO_RAW( '{"colour":"grey","gender":"Boy''s","brand":"SUNCLIPSE","description":"Voluptate irure voluptate labore sint amet occaecat elit ea incididunt aliquip. Tempor laboris tempor tempor magna officia in aliqua consequat elit occaecat.","sizes":["1 Yr","2 Yr","3-4 Yr","5-6 Yr","7-8 Yr","9-10 Yr"],"reviews":[{"rating":7,"review":"Fugiat officia nostrud cillum duis consequat sunt culpa duis laborum reprehenderit laborum."},{"rating":10,"review":"Et do reprehenderit do irure tempor id aliquip voluptate anim consequat amet sunt."},{"rating":3,"review":"Minim adipisicing dolore eiusmod laborum aliqua non Lorem laboris minim est cillum qui qui Lorem."},{"rating":4,"review":"Esse Lorem aute deserunt quis."},{"rating":1,"review":"Ex deserunt aliqua consectetur elit cillum cillum ex et mollit sint."},{"rating":4,"review":"Magna esse ipsum ipsum irure officia nostrud ad velit sit."},{"rating":8,"review":"Mollit et tempor esse fugiat fugiat ad voluptate irure est sunt proident magna anim ex."},{"rating":4,"review":"Nulla nisi esse ut exercitation commodo irure non amet labore mollit et elit."},{"rating":1,"review":"Enim officia anim proident consequat."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (14,'Women''s Skirt (Brown)',13.97,UTL_RAW.CAST_TO_RAW( '{"colour":"brown","gender":"Women''s","brand":"ISOTRONIC","description":"Magna Lorem do ad incididunt qui magna irure commodo nisi. Dolore ipsum adipisicing magna ea ullamco Lorem officia culpa do laborum voluptate.","sizes":[0,2,4,6,8,10,12,14,16,18,20],"reviews":[{"rating":1,"review":"Officia occaecat laboris magna sint tempor officia deserunt proident eu excepteur."},{"rating":2,"review":"Aliqua nisi sint enim ad mollit qui."},{"rating":3,"review":"Fugiat excepteur eiusmod incididunt Lorem nostrud nostrud labore aute esse aliquip."},{"rating":8,"review":"Voluptate ad enim anim culpa veniam amet."},{"rating":3,"review":"Do cillum quis cillum Lorem tempor labore laboris."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (15,'Girl''s Coat (Blue)',13.09,UTL_RAW.CAST_TO_RAW( '{"colour":"blue","gender":"Girl''s","brand":"DECRATEX","description":"Proident ut officia non duis est eu aliquip culpa cupidatat est incididunt amet ipsum veniam. Aliqua ea cupidatat incididunt ad excepteur irure ad pariatur occaecat duis incididunt excepteur amet.","sizes":["1 Yr","2 Yr","3-4 Yr","5-6 Yr","7-8 Yr","9-10 Yr"],"reviews":[{"rating":8,"review":"Officia irure deserunt mollit Lorem dolor dolor minim deserunt."},{"rating":10,"review":"Aliqua nostrud dolore enim dolore reprehenderit officia quis aliquip irure occaecat et."},{"rating":2,"review":"Consectetur consequat ut cupidatat et elit et cillum veniam exercitation Lorem culpa ipsum."},{"rating":9,"review":"Nisi tempor incididunt Lorem sit sit do mollit qui aliquip qui eu quis Lorem."},{"rating":9,"review":"Sunt nulla ad dolore fugiat cillum et."},{"rating":8,"review":"Incididunt nostrud officia sunt cupidatat culpa ex id ut."},{"rating":1,"review":"Deserunt sit officia enim adipisicing exercitation velit ipsum dolore laboris officia mollit ex esse et."},{"rating":3,"review":"Aliqua nulla laborum id mollit irure incididunt aliqua mollit qui nostrud consectetur sint aliqua quis."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (16,'Women''s Socks (Grey)',39.89,UTL_RAW.CAST_TO_RAW( '{"colour":"grey","gender":"Women''s","brand":"PODUNK","description":"Ullamco aute sit magna est in dolore. Qui nisi laboris in voluptate aute quis esse esse cupidatat do et ipsum ad.","sizes":[0,2,4,6,8,10,12,14,16,18,20],"reviews":[{"rating":5,"review":"Enim ad Lorem mollit esse mollit sunt aliquip pariatur magna mollit Lorem sint."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (17,'Women''s Sweater (Brown)',24.46,UTL_RAW.CAST_TO_RAW( '{"colour":"brown","gender":"Women''s","brand":"KLUGGER","description":"Dolore adipisicing commodo consequat Lorem ut incididunt. Ullamco nulla qui qui pariatur qui officia adipisicing magna aliqua ex qui incididunt.","sizes":[0,2,4,6,8,10,12,14,16,18,20],"reviews":[{"rating":7,"review":"Fugiat cillum anim in qui laborum velit eu consectetur ad fugiat."},{"rating":6,"review":"Elit duis nostrud ad non enim elit mollit deserunt."},{"rating":2,"review":"Amet anim mollit laboris deserunt deserunt laboris anim ad commodo dolor."},{"rating":7,"review":"Labore nulla ullamco aute labore esse do proident sit."},{"rating":5,"review":"Non amet cillum eu cillum cupidatat occaecat excepteur ad voluptate culpa id."},{"rating":4,"review":"Non aliqua nisi anim qui consectetur id dolore duis sint aliqua ea tempor laborum."},{"rating":5,"review":"Elit ea Lorem duis amet."},{"rating":10,"review":"Aliqua velit nulla exercitation dolor minim ipsum culpa nostrud occaecat proident voluptate."},{"rating":3,"review":"Exercitation anim eu et veniam tempor ea."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (18,'Women''s Jacket (Black)',14.34,UTL_RAW.CAST_TO_RAW( '{"colour":"black","gender":"Women''s","brand":"GEOLOGIX","description":"Voluptate anim commodo culpa qui deserunt consequat elit exercitation dolor tempor enim officia amet deserunt. Dolore deserunt Lorem labore et.","sizes":[0,2,4,6,8,10,12,14,16,18,20],"reviews":[{"rating":6,"review":"Veniam exercitation adipisicing irure et Lorem anim qui proident voluptate cupidatat sint veniam."},{"rating":5,"review":"Quis pariatur ea do reprehenderit mollit."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (19,'Men''s Coat (Red)',28.21,UTL_RAW.CAST_TO_RAW( '{"colour":"red","gender":"Men''s","brand":"VELOS","description":"Sint quis dolor in dolore sint elit ullamco ex magna laborum id eu. Magna fugiat qui pariatur dolore ex est esse minim elit velit.","sizes":["XS","S","M","L","XL","XXL"],"reviews":[{"rating":7,"review":"Esse velit est cupidatat ea labore cupidatat ipsum ullamco cupidatat Lorem."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (20,'Girl''s Shorts (Green)',38.34,UTL_RAW.CAST_TO_RAW( '{"colour":"green","gender":"Girl''s","brand":"TRASOLA","description":"Dolor eu Lorem dolore minim nisi pariatur. Consequat cillum id consequat mollit ad consectetur nostrud.","sizes":["1 Yr","2 Yr","3-4 Yr","5-6 Yr","7-8 Yr","9-10 Yr"],"reviews":[{"rating":7,"review":"Veniam consectetur ea nisi irure aute cillum."},{"rating":8,"review":"Consequat ex incididunt pariatur mollit magna incididunt veniam pariatur aliqua ex exercitation aute mollit ullamco."},{"rating":4,"review":"Proident tempor cupidatat ut cillum nisi sunt consectetur veniam dolore est ut."},{"rating":8,"review":"Deserunt amet quis do duis nulla officia anim sint do eiusmod exercitation."},{"rating":5,"review":"Anim magna incididunt mollit deserunt proident veniam occaecat ex ut ex incididunt."},{"rating":4,"review":"Consectetur cillum minim dolore cupidatat esse."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (21,'Girl''s Pyjamas (White)',39.78,UTL_RAW.CAST_TO_RAW( '{"colour":"black","gender":"Girl''s","brand":"UTARIAN","description":"Fugiat adipisicing sunt ullamco est ea. Dolor excepteur sit ad eu.","sizes":["1 Yr","2 Yr","3-4 Yr","5-6 Yr","7-8 Yr","9-10 Yr"],"reviews":[{"rating":7,"review":"Proident consequat consequat eu enim Lorem incididunt ad amet excepteur tempor aliquip ad aliquip ea."},{"rating":7,"review":"Nulla sint anim aliqua laboris sint eu adipisicing incididunt."},{"rating":10,"review":"Aliqua aliquip non commodo duis consequat ad nisi et magna."},{"rating":9,"review":"Tempor consequat Lorem ipsum proident do nisi est dolore."},{"rating":7,"review":"Pariatur amet laborum dolor dolore incididunt sint labore."},{"rating":10,"review":"Eu exercitation incididunt et est."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (22,'Men''s Shorts (Black)',10.33,UTL_RAW.CAST_TO_RAW( '{"colour":"black","gender":"Men''s","brand":"TERSANKI","description":"Occaecat veniam do aliqua irure consectetur ea fugiat aliqua qui ea veniam officia. Culpa officia Lorem dolor ullamco culpa adipisicing qui exercitation labore minim exercitation sunt.","sizes":["XS","S","M","L","XL","XXL"],"reviews":[{"rating":3,"review":"Consequat anim reprehenderit commodo non aliqua laborum aute."},{"rating":6,"review":"Labore cillum do qui magna culpa ea excepteur quis."},{"rating":1,"review":"Dolor amet quis ea magna."},{"rating":7,"review":"Minim sit nostrud anim nostrud excepteur nostrud ea ex veniam consectetur elit."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (23,'Men''s Pyjamas (Blue)',48.39,UTL_RAW.CAST_TO_RAW( '{"colour":"blue","gender":"Men''s","brand":"ADORNICA","description":"Irure amet Lorem consequat aliquip officia dolore amet officia. Do elit laboris non dolore nostrud dolore cupidatat ea quis aliquip ex aliquip non ex.","sizes":["XS","S","M","L","XL","XXL"],"reviews":[{"rating":3,"review":"Laboris elit pariatur labore duis fugiat ad in nulla tempor."},{"rating":5,"review":"Voluptate minim officia id excepteur."},{"rating":8,"review":"Eiusmod cupidatat et nisi ipsum non aliqua."},{"rating":1,"review":"Aute veniam irure dolor laborum esse ut ex tempor non velit."},{"rating":2,"review":"Nostrud nostrud mollit incididunt et tempor excepteur sit ut id exercitation."},{"rating":6,"review":"Labore tempor cillum laborum commodo et sit est qui aute enim id aute."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (24,'Boy''s Sweater (Red)',9.8,UTL_RAW.CAST_TO_RAW( '{"colour":"red","gender":"Boy''s","brand":"PHARMEX","description":"Ex occaecat nulla esse duis nulla laboris aute. Commodo magna Lorem exercitation occaecat do anim minim non ad non ex do nulla ad.","sizes":["1 Yr","2 Yr","3-4 Yr","5-6 Yr","7-8 Yr","9-10 Yr"],"reviews":[{"rating":7,"review":"Ea reprehenderit occaecat commodo exercitation ut adipisicing laboris adipisicing ex aute reprehenderit nisi sint qui."},{"rating":8,"review":"Qui anim sint dolore id dolor proident occaecat."},{"rating":5,"review":"Dolore fugiat mollit Lorem aliqua id consequat irure veniam."},{"rating":2,"review":"Esse dolore occaecat consectetur sit sit labore exercitation sint occaecat quis enim occaecat."},{"rating":4,"review":"Do commodo do laboris qui minim fugiat nisi nostrud elit."},{"rating":7,"review":"Pariatur eu non eiusmod ex dolor veniam."},{"rating":3,"review":"Magna aliqua dolor sint anim aliquip officia officia esse labore do."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (25,'Girl''s Jeans (Grey)',48.75,UTL_RAW.CAST_TO_RAW( '{"colour":"grey","gender":"Girl''s","brand":"KINETICUT","description":"Ut aliqua nostrud exercitation cupidatat cupidatat in. Sit tempor eu cillum quis incididunt consectetur quis amet.","sizes":["1 Yr","2 Yr","3-4 Yr","5-6 Yr","7-8 Yr","9-10 Yr"],"reviews":[{"rating":2,"review":"Id consectetur minim anim nisi occaecat elit labore duis."},{"rating":5,"review":"Ut fugiat qui velit fugiat nostrud ea dolor amet magna id pariatur."},{"rating":3,"review":"Labore laborum eiusmod qui minim exercitation."},{"rating":4,"review":"Excepteur ea mollit ad pariatur mollit veniam."},{"rating":9,"review":"Consectetur aliquip deserunt fugiat excepteur elit occaecat culpa fugiat dolor in."},{"rating":1,"review":"Adipisicing adipisicing mollit reprehenderit ex nulla in ea ad exercitation irure ullamco."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (26,'Girl''s Hoodie (White)',39.91,UTL_RAW.CAST_TO_RAW( '{"colour":"white","gender":"Girl''s","brand":"PROXSOFT","description":"Aliquip culpa eu deserunt ex culpa in laborum adipisicing. Amet et id minim esse ea non qui veniam.","sizes":["1 Yr","2 Yr","3-4 Yr","5-6 Yr","7-8 Yr","9-10 Yr"],"reviews":[{"rating":6,"review":"Commodo ut fugiat voluptate adipisicing deserunt."},{"rating":4,"review":"Fugiat cupidatat amet fugiat cupidatat ea ea."},{"rating":7,"review":"Incididunt ex enim commodo sit consequat enim."},{"rating":3,"review":"Ullamco in et aute laboris cillum."},{"rating":3,"review":"Reprehenderit Lorem proident sit deserunt do tempor commodo velit velit nulla ipsum."},{"rating":10,"review":"Dolore pariatur velit enim est culpa eiusmod cupidatat deserunt esse elit exercitation sunt proident exercitation."},{"rating":2,"review":"Minim fugiat elit aliquip nostrud velit reprehenderit cillum."},{"rating":4,"review":"Sint Lorem est laborum consectetur pariatur minim tempor ullamco Lorem est."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (27,'Boy''s Coat (Blue)',10.24,UTL_RAW.CAST_TO_RAW( '{"colour":"brown","gender":"Boy''s","brand":"GRONK","description":"Quis aliquip fugiat sunt qui eu velit aliqua sint eiusmod mollit id ad. Anim anim ipsum in reprehenderit amet amet consectetur incididunt qui cillum Lorem.","sizes":["1 Yr","2 Yr","3-4 Yr","5-6 Yr","7-8 Yr","9-10 Yr"],"reviews":[{"rating":8,"review":"Sit id elit cupidatat aute consectetur esse proident aliqua ad voluptate cillum Lorem."},{"rating":6,"review":"Enim enim fugiat consectetur ut sunt veniam ad sit minim amet Lorem veniam mollit."},{"rating":5,"review":"Dolor ipsum consectetur nostrud ex Lorem pariatur voluptate."},{"rating":8,"review":"Commodo magna sint sint dolore aute anim laborum."},{"rating":4,"review":"Laboris amet proident occaecat dolore labore exercitation dolore sunt Lorem sunt anim."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (28,'Men''s Hoodie (Red)',24.71,UTL_RAW.CAST_TO_RAW( '{"colour":"red","gender":"Men''s","brand":"FANGOLD","description":"Dolor irure dolore est ipsum nisi incididunt laboris culpa. Ullamco ad cupidatat sint culpa adipisicing pariatur.","sizes":["XS","S","M","L","XL","XXL"],"reviews":[{"rating":3,"review":"Proident aliqua aliquip aute quis cillum."},{"rating":5,"review":"Pariatur enim ipsum aliqua Lorem eiusmod consequat cupidatat irure nulla sint fugiat veniam amet ipsum."},{"rating":10,"review":"Sint duis ipsum reprehenderit Lorem aute pariatur elit."},{"rating":4,"review":"Enim qui qui consequat culpa ex velit sint excepteur ipsum in amet mollit mollit."},{"rating":10,"review":"Qui velit reprehenderit fugiat adipisicing anim incididunt anim commodo occaecat consectetur in aute."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (29,'Boy''s Shirt (Black)',37.34,UTL_RAW.CAST_TO_RAW( '{"colour":"black","gender":"Boy''s","brand":"SQUISH","description":"Pariatur nulla elit pariatur excepteur ullamco officia incididunt. Aliquip quis aliquip cupidatat magna fugiat eiusmod pariatur excepteur tempor officia voluptate fugiat.","sizes":["1 Yr","2 Yr","3-4 Yr","5-6 Yr","7-8 Yr","9-10 Yr"],"reviews":[{"rating":5,"review":"Non esse labore ullamco laboris irure cupidatat ex proident eiusmod."},{"rating":10,"review":"Ea velit et mollit labore consequat."},{"rating":6,"review":"Labore sit pariatur Lorem ad sint consectetur incididunt deserunt eiusmod sit nostrud dolore eiusmod sint."},{"rating":1,"review":"Id voluptate sunt amet laboris laborum ad dolor aliqua ipsum sint qui aute eu esse."},{"rating":5,"review":"Sint Lorem dolore do ea."},{"rating":9,"review":"Quis pariatur consequat nisi labore Lorem elit in qui Lorem."},{"rating":2,"review":"Consectetur voluptate tempor ullamco voluptate labore sint."},{"rating":9,"review":"Qui laboris tempor ullamco ullamco commodo sint occaecat Lorem."},{"rating":1,"review":"Laborum eu sit duis et culpa eu duis irure incididunt amet."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (30,'Women''s Pyjamas (Grey)',28.59,UTL_RAW.CAST_TO_RAW( '{"colour":"grey","gender":"Women''s","brand":"THREDZ","description":"Quis aliqua eiusmod incididunt quis ut ea aliqua sunt veniam ut et cupidatat eiusmod. Sunt sunt duis excepteur excepteur do exercitation.","sizes":[0,2,4,6,8,10,12,14,16,18,20],"reviews":[{"rating":1,"review":"Et anim culpa voluptate pariatur ullamco dolore ad aliquip."},{"rating":4,"review":"Nulla non ea nisi nulla elit veniam duis."},{"rating":4,"review":"Lorem adipisicing deserunt duis id sint aliquip minim deserunt magna sunt magna laborum dolore."},{"rating":3,"review":"Officia amet magna eu nulla dolore magna pariatur deserunt amet reprehenderit."},{"rating":3,"review":"Ad aliqua ex eu cillum labore elit mollit reprehenderit anim."},{"rating":1,"review":"Duis excepteur magna aliqua qui officia ipsum sunt."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (31,'Women''s Skirt (Green)',5.65,UTL_RAW.CAST_TO_RAW( '{"colour":"green","gender":"Women''s","brand":"ZIDANT","description":"Et est officia est amet est nisi sit veniam proident. Ullamco proident culpa velit proident quis dolore occaecat proident Lorem tempor.","sizes":[0,2,4,6,8,10,12,14,16,18,20],"reviews":[]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (32,'Women''s Jacket (Blue)',37,UTL_RAW.CAST_TO_RAW( '{"colour":"blue","gender":"Women''s","brand":"ZOGAK","description":"Tempor ipsum duis aliqua veniam qui laboris et ut officia. Fugiat fugiat nisi labore excepteur ullamco excepteur veniam in in et adipisicing sint.","sizes":[0,2,4,6,8,10,12,14,16,18,20],"reviews":[{"rating":9,"review":"Sit amet id ut laborum in exercitation laborum Lorem fugiat ex."},{"rating":7,"review":"Nisi non mollit dolore id aute velit laboris consequat voluptate id."},{"rating":1,"review":"Nisi nisi fugiat non nisi amet esse."},{"rating":1,"review":"Laborum eiusmod id ipsum aliqua adipisicing cillum enim."},{"rating":8,"review":"Duis aliqua ut nulla proident voluptate incididunt elit est exercitation id aute."},{"rating":4,"review":"Veniam labore exercitation eiusmod nisi mollit anim eu."},{"rating":6,"review":"Exercitation eu est irure velit pariatur."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (33,'Boy''s Pyjamas (Grey)',23.32,UTL_RAW.CAST_TO_RAW( '{"colour":"grey","gender":"Boy''s","brand":"RETRACK","description":"Sit consectetur Lorem culpa ipsum ad ullamco ea aute qui ea. Laboris ipsum enim enim veniam.","sizes":["1 Yr","2 Yr","3-4 Yr","5-6 Yr","7-8 Yr","9-10 Yr"],"reviews":[{"rating":7,"review":"Ut incididunt veniam ullamco voluptate occaecat velit."},{"rating":5,"review":"Consectetur cupidatat voluptate dolore velit culpa est id enim aute."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (34,'Women''s Jeans (Red)',7.18,UTL_RAW.CAST_TO_RAW( '{"colour":"red","gender":"Women''s","brand":"PANZENT","description":"Eiusmod culpa dolore occaecat excepteur esse magna fugiat dolore cupidatat laboris mollit culpa. Consequat dolor qui tempor sit minim sit excepteur enim excepteur aute minim.","sizes":[0,2,4,6,8,10,12,14,16,18,20],"reviews":[{"rating":10,"review":"Nulla enim cillum pariatur do consectetur et Lorem."},{"rating":1,"review":"Cupidatat fugiat incididunt fugiat eu."},{"rating":1,"review":"Ullamco eiusmod adipisicing fugiat reprehenderit mollit aliquip."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (35,'Girl''s Dress (Red)',49.12,UTL_RAW.CAST_TO_RAW( '{"colour":"red","gender":"Girl''s","brand":"NIXELT","description":"Ipsum pariatur laborum nulla pariatur consequat consequat amet nisi. Ut in quis officia excepteur.","sizes":["1 Yr","2 Yr","3-4 Yr","5-6 Yr","7-8 Yr","9-10 Yr"],"reviews":[{"rating":10,"review":"Ut est anim sit nulla commodo velit occaecat amet mollit fugiat id."},{"rating":2,"review":"Eu quis ea anim incididunt nisi nisi velit velit labore do."},{"rating":9,"review":"Eu laborum laborum reprehenderit minim officia anim."},{"rating":8,"review":"Et consectetur labore ullamco occaecat cupidatat magna pariatur esse qui ut mollit ea cillum."},{"rating":4,"review":"Dolore culpa magna commodo aute do culpa non commodo qui id commodo consectetur exercitation."},{"rating":6,"review":"Adipisicing laborum tempor sunt laboris et sint aute pariatur."},{"rating":9,"review":"Excepteur voluptate qui magna in cillum aliqua."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (36,'Women''s Trousers (Blue)',29.51,UTL_RAW.CAST_TO_RAW( '{"colour":"blue","gender":"Women''s","brand":"TROLLERY","description":"Proident sunt ipsum pariatur duis dolor eu dolore culpa ad aliquip elit. Mollit Lorem et aliquip commodo est anim amet eiusmod amet dolore laborum tempor officia.","sizes":[0,2,4,6,8,10,12,14,16,18,20],"reviews":[{"rating":10,"review":"Consequat ut commodo irure sit elit anim amet eu est sunt tempor non."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (37,'Boy''s Jeans (Blue)',22.98,UTL_RAW.CAST_TO_RAW( '{"colour":"blue","gender":"Boy''s","brand":"AVIT","description":"Velit velit esse nulla minim minim laborum esse. Sint minim id aliquip amet fugiat dolor aliqua.","sizes":["1 Yr","2 Yr","3-4 Yr","5-6 Yr","7-8 Yr","9-10 Yr"],"reviews":[]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (38,'Girl''s Pyjamas (Red)',11,UTL_RAW.CAST_TO_RAW( '{"colour":"red","gender":"Girl''s","brand":"EMTRAK","description":"Magna est occaecat consectetur ullamco mollit dolore aute irure consectetur nulla ipsum id elit occaecat. Amet Lorem sint nulla eiusmod commodo aliqua cillum anim tempor tempor pariatur do nostrud minim.","sizes":["1 Yr","2 Yr","3-4 Yr","5-6 Yr","7-8 Yr","9-10 Yr"],"reviews":[{"rating":4,"review":"Consectetur velit adipisicing excepteur in excepteur sit excepteur irure veniam velit."},{"rating":4,"review":"Consectetur exercitation exercitation irure commodo officia do adipisicing ullamco sit anim consequat."},{"rating":9,"review":"Minim occaecat sunt laborum voluptate culpa enim elit."},{"rating":2,"review":"Reprehenderit labore incididunt ex ullamco nostrud cillum irure mollit dolore aliqua enim tempor aliquip laborum."},{"rating":2,"review":"Enim commodo adipisicing consequat commodo."},{"rating":8,"review":"Sint ut cillum Lorem ut ad aliquip elit sunt labore laboris consequat Lorem aliqua occaecat."},{"rating":2,"review":"Et consectetur in officia ullamco labore ea duis amet."},{"rating":8,"review":"Reprehenderit enim tempor proident commodo ex eu fugiat cupidatat exercitation culpa id adipisicing deserunt officia."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (39,'Boy''s Trousers (Blue)',34.06,UTL_RAW.CAST_TO_RAW( '{"colour":"blue","gender":"Boy''s","brand":"DIGINETIC","description":"Dolor aliqua minim nostrud non labore in ullamco mollit mollit sit non. Duis nulla exercitation et adipisicing nostrud voluptate cupidatat eu reprehenderit.","sizes":["1 Yr","2 Yr","3-4 Yr","5-6 Yr","7-8 Yr","9-10 Yr"],"reviews":[{"rating":6,"review":"Culpa id consequat cillum dolor."},{"rating":8,"review":"Qui do quis magna nostrud exercitation enim aute dolore proident ipsum sint nostrud deserunt."},{"rating":9,"review":"Excepteur fugiat adipisicing laboris ea culpa cupidatat laborum occaecat nostrud."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (40,'Girl''s Pyjamas (Black)',8.66,UTL_RAW.CAST_TO_RAW( '{"colour":"black","gender":"Girl''s","brand":"ISOLOGICS","description":"Ex exercitation aliquip cillum adipisicing cupidatat. Culpa labore eiusmod do ut ipsum incididunt ipsum labore.","sizes":["1 Yr","2 Yr","3-4 Yr","5-6 Yr","7-8 Yr","9-10 Yr"],"reviews":[{"rating":6,"review":"Duis minim duis dolor laboris eiusmod consequat fugiat adipisicing ex non culpa Lorem proident qui."},{"rating":4,"review":"Veniam tempor commodo aliqua sit ex mollit cillum aute officia fugiat tempor sunt nulla elit."},{"rating":10,"review":"Dolore officia aute magna eiusmod exercitation esse amet tempor."},{"rating":7,"review":"Proident nisi voluptate ea esse exercitation ullamco consequat consectetur in enim amet adipisicing commodo nulla."},{"rating":4,"review":"Irure ullamco id adipisicing fugiat Lorem do non officia nisi sunt esse mollit consectetur."},{"rating":9,"review":"Laboris do elit dolor officia irure esse incididunt pariatur elit."},{"rating":1,"review":"Aliqua Lorem nostrud et reprehenderit exercitation exercitation nostrud consectetur dolor."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (41,'Women''s Dress (Black)',10.11,UTL_RAW.CAST_TO_RAW( '{"colour":"black","gender":"Women''s","brand":"NEOCENT","description":"Eu enim aliquip deserunt est duis do sunt consequat sit sit labore nisi. Culpa mollit cupidatat Lorem et minim sit.","sizes":[0,2,4,6,8,10,12,14,16,18,20],"reviews":[{"rating":4,"review":"Ex culpa sint ad eu quis."},{"rating":4,"review":"Irure labore adipisicing velit sint sint."},{"rating":4,"review":"Ullamco dolore ad qui consequat labore do cillum velit."},{"rating":5,"review":"Velit officia eiusmod proident dolore occaecat eu eiusmod."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (42,'Boy''s Jeans (Black)',16.64,UTL_RAW.CAST_TO_RAW( '{"colour":"black","gender":"Boy''s","brand":"EARTHMARK","description":"Duis dolor est eu elit anim proident aliqua eu tempor. Est fugiat non ullamco et pariatur nulla exercitation eiusmod id officia minim.","sizes":["1 Yr","2 Yr","3-4 Yr","5-6 Yr","7-8 Yr","9-10 Yr"],"reviews":[{"rating":10,"review":"Anim aliquip id reprehenderit laboris."},{"rating":7,"review":"Nostrud non cupidatat id eiusmod aliquip anim ullamco aliquip cupidatat excepteur dolor reprehenderit."},{"rating":6,"review":"Veniam consequat deserunt nostrud sunt est commodo sint eu fugiat ipsum deserunt aute elit est."},{"rating":9,"review":"Eiusmod excepteur ut ullamco eiusmod labore deserunt."},{"rating":5,"review":"Aute deserunt eu voluptate id irure aliquip duis sint proident dolore dolor."},{"rating":5,"review":"Dolore mollit quis elit qui voluptate ad culpa voluptate elit consectetur."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (43,'Boy''s Trousers (Black)',39.32,UTL_RAW.CAST_TO_RAW( '{"colour":"blue","gender":"Boy''s","brand":"PHOLIO","description":"Voluptate ex mollit enim minim nulla proident dolor eu nostrud velit. Ex ullamco aute dolor duis elit elit.","sizes":["1 Yr","2 Yr","3-4 Yr","5-6 Yr","7-8 Yr","9-10 Yr"],"reviews":[{"rating":3,"review":"Labore non exercitation anim id deserunt excepteur dolore sunt deserunt dolor."},{"rating":5,"review":"Laborum eiusmod mollit amet nulla ex esse culpa ut elit reprehenderit labore ex Lorem cupidatat."},{"rating":7,"review":"Reprehenderit dolore aute consectetur voluptate excepteur veniam nulla ad."},{"rating":5,"review":"Reprehenderit proident in elit pariatur."},{"rating":8,"review":"Magna laborum ad deserunt voluptate enim excepteur enim dolore veniam consequat officia anim dolore mollit."},{"rating":3,"review":"Elit et reprehenderit amet aute amet laboris minim irure sint."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (44,'Women''s Coat (Black)',31.68,UTL_RAW.CAST_TO_RAW( '{"colour":"black","gender":"Women''s","brand":"COMVEYOR","description":"Exercitation ut ad reprehenderit sunt eiusmod sit. Qui nisi ut esse mollit nisi.","sizes":[0,2,4,6,8,10,12,14,16,18,20],"reviews":[{"rating":7,"review":"Ad consequat nisi est tempor nisi nulla veniam consectetur ad ut laborum magna."},{"rating":8,"review":"Incididunt magna ipsum cupidatat elit eiusmod enim mollit eiusmod id esse sit elit irure Lorem."},{"rating":7,"review":"Aute aliquip et esse consequat reprehenderit ipsum ut."},{"rating":8,"review":"Consectetur commodo cupidatat nostrud qui labore magna duis sit."},{"rating":8,"review":"Qui occaecat elit exercitation do est officia fugiat adipisicing velit occaecat deserunt Lorem ex adipisicing."},{"rating":6,"review":"Velit est commodo esse sint id ullamco aute ut ut officia laboris irure in."},{"rating":10,"review":"Ad nulla labore cupidatat do laboris do elit cupidatat excepteur occaecat cupidatat."},{"rating":5,"review":"Do esse magna occaecat non."},{"rating":10,"review":"Et sint qui tempor nostrud sunt sit duis dolor excepteur voluptate."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (45,'Men''s Jeans (Grey)',27.64,UTL_RAW.CAST_TO_RAW( '{"colour":"grey","gender":"Men''s","brand":"QNEKT","description":"Dolore duis minim dolor est fugiat sit dolor nisi anim Lorem culpa id. Consequat labore et reprehenderit pariatur culpa minim laboris pariatur esse aliquip.","sizes":["XS","S","M","L","XL","XXL"],"reviews":[{"rating":7,"review":"Veniam qui ipsum consequat laboris ad aliquip est reprehenderit esse sint cupidatat tempor."},{"rating":8,"review":"Ut anim anim ipsum ipsum irure."},{"rating":9,"review":"Non qui sunt ullamco deserunt sint."},{"rating":10,"review":"Nostrud fugiat velit aliqua eu culpa do excepteur do."}]}') );
  insert into products (PRODUCT_ID,PRODUCT_NAME,UNIT_PRICE,PRODUCT_DETAILS) values (46,'Girl''s Trousers (Red)',39.16,UTL_RAW.CAST_TO_RAW( '{"colour":"red","gender":"Girl''s","brand":"OTHERSIDE","description":"Lorem officia laborum deserunt veniam cillum anim adipisicing minim aute ad esse sint sit tempor. Magna enim proident eiusmod incididunt adipisicing duis deserunt pariatur sint officia occaecat est minim ipsum.","sizes":["1 Yr","2 Yr","3-4 Yr","5-6 Yr","7-8 Yr","9-10 Yr"],"reviews":[{"rating":9,"review":"Magna magna ullamco ipsum pariatur occaecat eiusmod amet ea sunt reprehenderit dolore aute voluptate."},{"rating":7,"review":"Eiusmod cupidatat cillum qui dolor consequat."},{"rating":4,"review":"Do proident cillum cupidatat laboris in cillum."},{"rating":5,"review":"Sunt eiusmod ea labore est sint adipisicing velit duis."},{"rating":6,"review":"Ut consectetur ad magna officia ut aliqua deserunt magna."}]}') );
END;
/
