PRO INSERTING into STORES
set define off
begin
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO,LOGO_MIME_TYPE) values (1,'Online','https://www.example.com',null,null,null, EMPTY_BLOB(),null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO,LOGO_MIME_TYPE) values (2,'San Francisco',null,'Redwood Shores
    500 Oracle Parkway
    Redwood Shores, CA 94065',37.529395,-122.267237, EMPTY_BLOB(),null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO,LOGO_MIME_TYPE) values (3,'Seattle',null,'1501 Fourth Avenue
    Suite 1800
    Seattle, WA 98101',47.6053,-122.33221, EMPTY_BLOB(),null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO,LOGO_MIME_TYPE) values (4,'New York City',null,'205 Lexington Ave
    7th Floor
    New York, NY 10016',40.745216,-73.980518, EMPTY_BLOB(),null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO,LOGO_MIME_TYPE) values (5,'Chicago',null,'233 South Wacker Dr.
    45th Floor
    Chicago, IL 60606',41.878751,-87.636675, EMPTY_BLOB(),null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO,LOGO_MIME_TYPE) values (6,'London',null,'One South Place
    London
    EC2M 2RB',51.519281,-0.087296, EMPTY_BLOB(),null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO,LOGO_MIME_TYPE) values (7,'Bucharest',null,'Floreasca Park
    43 Soseaua Pipera, corp B.
    Sector 2
    Bucharest , 014254
    RO',44.43225,26.10626, EMPTY_BLOB(),null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO,LOGO_MIME_TYPE) values (8,'Berlin',null,'Behrenstraße 42 (Humboldt Carré)
    10117 Berlin',52.5161,13.3873, EMPTY_BLOB(),null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO,LOGO_MIME_TYPE) values (9,'Utrecht',null,'Hertogswetering 163-167, 3543 AS Utrecht, Netherlands',52.103263,5.061644, EMPTY_BLOB(),null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO,LOGO_MIME_TYPE) values (10,'Madrid',null,'C/ José Echegaray 6B
    Las Rozas
    28230 Madrid',40.4929,-3.8737, EMPTY_BLOB(),null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO,LOGO_MIME_TYPE) values (11,'Johannesburg',null,'Woodmead North Office Park
    54 Maxwell Drive
    Jukskeiview, Sandton, 2196',-26.044222,28.094662, EMPTY_BLOB(),null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO,LOGO_MIME_TYPE) values (12,'Lagos',null,'1391 Tiamiyu Savage St, Victoria Island, Lagos, Nigeria',6.42806,3.42199, EMPTY_BLOB(),null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO,LOGO_MIME_TYPE) values (13,'Bengaluru',null,'193, Bannerghatta Main Rd, Industrial Area, Stage 2, BTM Layout, Bengaluru, Karnataka 560076, India',12.8939,77.5978, EMPTY_BLOB(),null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO,LOGO_MIME_TYPE) values (14,'Mumbai',null,'First International Financial Center
    Unit No. 501, Level 5
    No. C54 & 55, G Block
    Bandra Kurla Complex
    CTS No. 4207, Kolekalyan Village
    Mumbai - 400 051
    India',19.069405,72.870143, EMPTY_BLOB(),null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO,LOGO_MIME_TYPE) values (15,'New Dehli',null,'F-01/02, First Floor
    Salcon Rasvillas
    D-1, District Centre,
    Saket, New Delhi - 110017
    India',28.527693,77.220135, EMPTY_BLOB(),null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO,LOGO_MIME_TYPE) values (16,'Sydney',null,'Riverside Corporate Park
    4 Julius Avenue
    North Ryde
    NSW 2113',-33.797279,151.143826, EMPTY_BLOB(),null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO,LOGO_MIME_TYPE) values (17,'Perth',null,'Level 9
    225 St Georges Terrace
    Perth WA 6000',-31.953715,115.851645, EMPTY_BLOB(),null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO,LOGO_MIME_TYPE) values (18,'São Paulo',null,'Rua Dr. Jose Aureo Bustamante,
    455 - Vila Cordeiro,
    CEP 04710-090 São Paulo',-23.5475,-46.63611, EMPTY_BLOB(),null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO,LOGO_MIME_TYPE) values (19,'Buenos Aires',null,'Juana Manso 1069, Buenos Aires, Argentina',-34.61016,-58.362867, EMPTY_BLOB(),null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO,LOGO_MIME_TYPE) values (20,'Mexico City',null,'Montes Urales # 470 P3
    Col. Lomas de Chapultepec
    Delegación Miguel Hidalgo - C.P. 11000',19.428489,-99.205745, EMPTY_BLOB(),null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO,LOGO_MIME_TYPE) values (21,'Bejing',null,'China, Beijing Shi, Haidian Qu, Dongbeiwang W Rd, 8, 100085',40.0572,116.290061, EMPTY_BLOB(),null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO,LOGO_MIME_TYPE) values (22,'Tokyo',null,'2 Chome-5-? Kitaaoyama, Minato City, Tokyo 107-0061, Japan',35.671534,139.718584, EMPTY_BLOB(),null);
  insert into stores (STORE_ID,STORE_NAME,WEB_ADDRESS,PHYSICAL_ADDRESS,LATITUDE,LONGITUDE,LOGO,LOGO_MIME_TYPE) values (23,'Tel Aviv',null,'B, Aharon Bart St 18, Petah Tikva, 4951400, Israel',32.100664,34.862138, EMPTY_BLOB(),null);
end;
/