CREATE TABLE academics
(
  authorID INT NOT NULL,
  firstName VARCHAR2(50) NOT NULL,
  lastName VARCHAR2(50) NOT NULL,
  email VARCHAR2(50) NOT NULL,
  phoneNumber VARCHAR2(50) NOT NULL,
  researchField VARCHAR2(50) NOT NULL,
  address VARCHAR2(100) NOT NULL,
  CONSTRAINT pk_academics PRIMARY KEY (authorID)
);

CREATE TABLE organisation
(
  orgID INT NOT NULL,
  orgName VARCHAR2(50) NOT NULL,
  orgAddress VARCHAR2(100) NOT NULL,
  country VARCHAR2(50) NOT NULL,
  CONSTRAINT pk_organisation PRIMARY KEY (orgID)
);

CREATE TABLE publisher
(
  publisherID INT NOT NULL,
  publisherName VARCHAR2(50) NOT NULL,
  phoneNumber VARCHAR2(50) NOT NULL,
  email VARCHAR2(50) NOT NULL,
  address VARCHAR2(100) NOT NULL,
  country VARCHAR2(50) NOT NULL,
  CONSTRAINT pk_publisher PRIMARY KEY (publisherID)
);

CREATE TABLE editor
(
  editorID INT NOT NULL,
  editorName VARCHAR2(50) NOT NULL,
  email VARCHAR2(50) NOT NULL,
  phoneNumber VARCHAR2(50) NOT NULL,
  CONSTRAINT pk_editor PRIMARY KEY (editorID)
);

CREATE TABLE affiliation
(
  authorID INT NOT NULL,
  orgID INT NOT NULL,
  CONSTRAINT pk_affiliation PRIMARY KEY (authorID, orgID),
  CONSTRAINT fk_aff_author FOREIGN KEY (authorID) REFERENCES academics(authorID),
  CONSTRAINT fk_aff_organisation FOREIGN KEY (orgID) REFERENCES organisation(orgID)
);

CREATE TABLE journal
(
  journalID INT NOT NULL,
  journalName VARCHAR2(60) NOT NULL,
  publisherID INT NOT NULL,
  CONSTRAINT pk_journal PRIMARY KEY (journalID),
  CONSTRAINT fk_journal_publisher FOREIGN KEY (publisherID) REFERENCES publisher(publisherID)
);

CREATE TABLE issue
(
  issueID INT NOT NULL,
  issueDate DATE NOT NULL,
  journalID INT NOT NULL,
  CONSTRAINT pk_issue PRIMARY KEY (issueID),
  CONSTRAINT fk_issue_journal FOREIGN KEY (journalID) REFERENCES journal(journalID)
);

CREATE TABLE subscription
(
  journalID INT NOT NULL,
  orgID INT NOT NULL,
  CONSTRAINT pk_subscription PRIMARY KEY (journalID, orgID),
  CONSTRAINT fk_sub_journal FOREIGN KEY (journalID) REFERENCES journal(journalID),
  CONSTRAINT fk_sub_organisation FOREIGN KEY (orgID) REFERENCES organisation(orgID)
);

CREATE TABLE edits
(
  editorID INT NOT NULL,
  journalID INT NOT NULL,
  CONSTRAINT pk_edits PRIMARY KEY (editorID, journalID),
  CONSTRAINT fk_edits_editor FOREIGN KEY (editorID) REFERENCES editor(editorID),
  CONSTRAINT fk_edits_journal FOREIGN KEY (journalID) REFERENCES journal(journalID)
);

CREATE TABLE publication
(
  publicationID INT NOT NULL,
  pubTitle VARCHAR2(100) NOT NULL,
  researchArea VARCHAR2(100) NOT NULL,
  journalID INT,
  authorID INT NOT NULL,
  submissionDate DATE NOT NULL,
  acceptanceDate DATE NOT NULL,
  CONSTRAINT pk_publication PRIMARY KEY (publicationID),
  CONSTRAINT fk_publication_journal FOREIGN KEY (journalID) REFERENCES journal(journalID),
  CONSTRAINT fk_publication_academic FOREIGN KEY (authorID) REFERENCES academics(authorID)
);

CREATE TABLE submit
(
  publicationID INT NOT NULL,
  authorID INT NOT NULL,
  submissionDate DATE NOT NULL,
  acceptanceDate DATE NOT NULL,
  CONSTRAINT pk_submit PRIMARY KEY (publicationID, authorID),
  CONSTRAINT fk_sub_publication FOREIGN KEY (publicationID) REFERENCES publication(publicationID),
  CONSTRAINT fk_sub_academics FOREIGN KEY (authorID) REFERENCES academics(authorID)
);

CREATE TABLE review
(
  publicationID INT NOT NULL,
  authorID INT NOT NULL,
  reviewDate DATE NOT NULL,
  reviewResult VARCHAR(50) NOT NULL,
  CONSTRAINT pk_review PRIMARY KEY (publicationID, authorID),
  CONSTRAINT fk_rev_publication FOREIGN KEY (publicationID) REFERENCES publication(publicationID),
  CONSTRAINT fk_rev_academics FOREIGN KEY (authorID) REFERENCES academics(authorID)
);

--academics
INSERT INTO academics (authorID, firstName, lastName, email, phoneNumber, address, researchField) VALUES    (1,'Ingar','Dencs','idencs0@chronoengine.com','2439740945','4980 Westerfield Plaza','Physics');
INSERT INTO academics (authorID, firstName, lastName, email, phoneNumber, address, researchField) VALUES    (2,'Fabe','Tampion','ftampion1@cdbaby.com','3322339097','85716 Graceland Alley','Data Science');
INSERT INTO academics (authorID, firstName, lastName, email, phoneNumber, address, researchField) VALUES    (3,'Ermin','Santora','esantora2@hostgator.com','1394010657','43 Gateway Court','Micro Biology');
INSERT INTO academics (authorID, firstName, lastName, email, phoneNumber, address, researchField) VALUES    (4,'Katine','Kenrat','kkenrat3@who.int','5192007102','4091 Sutherland Circle','Data Science');
INSERT INTO academics (authorID, firstName, lastName, email, phoneNumber, address, researchField) VALUES    (5,'Sibyl','Saiens','ssaiens4@bloglovin.com','2101026764','79 Delaware Avenue','Physics');
INSERT INTO academics (authorID, firstName, lastName, email, phoneNumber, address, researchField) VALUES    (6,'Briggs','McQuin','bmcquin5@engadget.com','6566184836','87 Di Loreto Road','Physics');
INSERT INTO academics (authorID, firstName, lastName, email, phoneNumber, address, researchField) VALUES    (7,'Jacqui','Drane','jdrane6@cornell.edu','9309935954','80450 Tomscot Place','Data Science');
INSERT INTO academics (authorID, firstName, lastName, email, phoneNumber, address, researchField) VALUES    (8,'Tessy','Sambidge','tsambidge7@ocn.ne.jp','6812385698','48847 Amoth Crossing','Mathematics');
INSERT INTO academics (authorID, firstName, lastName, email, phoneNumber, address, researchField) VALUES    (9,'Karly','Tremoille','ktremoille8@goodreads.com','2298095147','2352 Truax Way','Mathematics');
INSERT INTO academics (authorID, firstName, lastName, email, phoneNumber, address, researchField) VALUES    (10,'Glen','Brislawn','gbrislawn9@delicious.com','2459707894','44736 Crowley Junction','Mathematics');
INSERT INTO academics (authorID, firstName, lastName, email, phoneNumber, address, researchField) VALUES    (11,'Ricky','Brocking','rbrockinga@earthlink.net','3826234198','2 Valley Edge Street','Physics');
INSERT INTO academics (authorID, firstName, lastName, email, phoneNumber, address, researchField) VALUES    (12,'Fanchette','Purves','fpurvesb@drupal.org','4872119947','81 Norway Maple Court','Micro Biology');
INSERT INTO academics (authorID, firstName, lastName, email, phoneNumber, address, researchField) VALUES    (13,'Beulah','Mosley','bmosleyc@wisc.edu','2684373798','8984 Kensington Place','Engineering');
INSERT INTO academics (authorID, firstName, lastName, email, phoneNumber, address, researchField) VALUES    (14,'Helaina','Gherardini','hgherardinid@cmu.edu','6627278411','291 Stone Corner Avenue','Engineering');
INSERT INTO academics (authorID, firstName, lastName, email, phoneNumber, address, researchField) VALUES    (15,'Philbert','Swalough','pswaloughe@vk.com','9498448476','9985 5th Drive','Mathematics');
INSERT INTO academics (authorID, firstName, lastName, email, phoneNumber, address, researchField) VALUES    (16,'Doris','Dymocke','ddymockef@oracle.com','6476927183','1 Northview Drive','Physics');
INSERT INTO academics (authorID, firstName, lastName, email, phoneNumber, address, researchField) VALUES    (17,'Allister','Roskelley','aroskelleyg@youku.com','8216075252','0 Carpenter Junction','Micro Biology');
INSERT INTO academics (authorID, firstName, lastName, email, phoneNumber, address, researchField) VALUES    (18,'Tansy','Venner','tvennerh@nifty.com','8132299562','47501 Monica Avenue','Micro Biology');
INSERT INTO academics (authorID, firstName, lastName, email, phoneNumber, address, researchField) VALUES    (19,'Leonard','Jeremaes','ljeremaesi@ehow.com','2654974058','3275 Glacier Hill Drive','Data Science');
INSERT INTO academics (authorID, firstName, lastName, email, phoneNumber, address, researchField) VALUES    (20,'Randolph','Cruce','rcrucej@paginegialle.it','4126564011','4691 Carey Alley','Micro Biology');

--organisation
INSERT INTO organisation VALUES (1,'Universidad Americana','7 Carioca Plaza','Paraguay');
INSERT INTO organisation VALUES (2,'Southwest Petroleum University','289 Crowley Plaza','China');
INSERT INTO organisation VALUES (3,'Gansu University of Science','8300 Arapahoe Parkway','China');
INSERT INTO organisation VALUES (4,'Universidade de Vila Velha','4 Toban Drive','Brazil');
INSERT INTO organisation VALUES (5,'Institut Teknologi Sepuluh Nopember','7929 Forster Terrace','Indonesia');
INSERT INTO organisation VALUES (6,'Cleveland Chiropractic College, Kansas City','067 Sachtjen Court','United States');
INSERT INTO organisation VALUES (7,'Stockholm University','85 Anhalt Alley','Sweden');
INSERT INTO organisation VALUES (8,'Universidade dos Acores','67084 Bunker Hill Avenue','Portugal');
INSERT INTO organisation VALUES (9,'Shenyang University','61637 Garrison Crossing','China');
INSERT INTO organisation VALUES (10,'University of Zagreb','36 Grasskamp Circle','Croatia');
INSERT INTO organisation VALUES (11,'Xi Jiaotong University','59800 Schiller Point','China');
INSERT INTO organisation VALUES (12,'Universidad de Piura','16 Canary Point','Peru');
INSERT INTO organisation VALUES (13,'Universitas Gajayana Malang','88 Pawling Trail','Indonesia');
INSERT INTO organisation VALUES (14,'University of Southampton','640 Florence Drive','United Kingdom');
INSERT INTO organisation VALUES (15,'Bournemouth University','109 Fern Barrow','United Kingdom');
INSERT INTO organisation VALUES (16,'Universidad de Los Andes','67 Clyde Gallagher Avenue','Colombia');
INSERT INTO organisation VALUES (17,'Belarussian State University of Transport','7 Carpenter Terrace','Belarus');
INSERT INTO organisation VALUES (18,'Technical University of Wroclaw','69 Kipling Circle','Poland');
INSERT INTO organisation VALUES (19,'Salem Teikyo University','7 Mcbride Center','United States');
INSERT INTO organisation VALUES (20,'Universitas Kristen Satya Wacana','2208 Stone Corner Center','Indonesia');

--publisher
INSERT INTO publisher VALUES (1,'Kuhlman-Huel','1372063091','croubay0@goo.ne.jp','4 Melby Junction','China');
INSERT INTO publisher VALUES (2,'Orn-Walter','5248082422','bsomes1@arizona.edu','2063 Sullivan Avenue','Jordan');
INSERT INTO publisher VALUES (3,'Hyatt-Bradtke','6221125683','cmccotter2@squarespace.com','1 Ramsey Circle','Japan');
INSERT INTO publisher VALUES (4,'Ledner, Runte and Parisian','9473630314','tjohnstone3@cloudflare.com','66 Schmedeman Point','China');
INSERT INTO publisher VALUES (5,'Kuvalis and Stokes','4067034203','kkubec4@ocn.ne.jp','4 Monument Lane','Thailand');
INSERT INTO publisher VALUES (6,'Mertz and Sons','7682843227','bbirchner5@columbia.edu','0853 Westend Junction','Portugal');
INSERT INTO publisher VALUES (7,'Jacobs Inc','1811392997','ecawte6@answers.com','27 Oxford Crossing','China');
INSERT INTO publisher VALUES (8,'Ledner-Kessler','5498984471','sshipley7@netvibes.com','8 Talmadge Road','Japan');
INSERT INTO publisher VALUES (9,'Waters Inc','8292471045','gvasilik8@stumbleupon.com','447 Golf Terrace','France');
INSERT INTO publisher VALUES (10,'Waelchi, Jones and Wiegand','2333017623','bdupey9@ovh.net','87 Mariners Cove Place','Japan');
INSERT INTO publisher VALUES (11,'Jerde LLC','9023032849','mbenniona@google.es','3 Steensland Junction','Indonesia');
INSERT INTO publisher VALUES (12,'DuBuque Inc','2234531453','scavaneyb@wordpress.com','73 Dwight Trail','Russia');
INSERT INTO publisher VALUES (13,'Harris Inc','8158814660','cmcpeetersc@indiatimes.com','11818 Anhalt Street','Ivory Coast');
INSERT INTO publisher VALUES (14,'Ziemann-Greenfelder','3459734783','aorfeurd@imageshack.us','63137 Pennsylvania Place','Brazil');
INSERT INTO publisher VALUES (15,'Balistreri LLC','4801276384','ibirtwhistlee@stanford.edu','81 Fordem Court','Indonesia');
INSERT INTO publisher VALUES (16,'Nader and Sons','9617901998','mmccaughanf@yahoo.co.jp','89714 Dakota Lane','Russia');
INSERT INTO publisher VALUES (17,'Stamm and Daughters','3963181488','theggeg@wix.com','85877 Tomscot Avenue','Thailand');
INSERT INTO publisher VALUES (18,'Wilkinson and Effertz','3359159898','fkibbelh@vkontakte.ru','7949 Armistice Crossing','Indonesia');
INSERT INTO publisher VALUES (19,'Treutel-Greenfelder','6984298229','lcrati@hostgator.com','256 Tennessee Avenue','China');
INSERT INTO publisher VALUES (20,'Rice-Gulgowski','1009665716','tscanterburyj@free.fr','557 Sutteridge Road','Portugal');

--editor
INSERT INTO editor VALUES (1,'Hamlin Marple','hmarple0@arstechnica.com','595-787-1027');
INSERT INTO editor VALUES (2,'Bailie Szabo','bszabo1@cbc.ca','956-863-3863');
INSERT INTO editor VALUES (3,'Dasi Gleave','dgleave2@lycos.com','204-728-1581');
INSERT INTO editor VALUES (4,'Alvy Ecclesall','aecclesall3@cbsnews.com','954-117-5046');
INSERT INTO editor VALUES (5,'Lorianne Rannigan','lrannigan4@dot.gov','607-805-8600');
INSERT INTO editor VALUES (6,'Rahel Sailor','rsailor5@foxnews.com','624-426-6253');
INSERT INTO editor VALUES (7,'Eward Birchenough','ebirchenough6@bandcamp.com','634-939-2176');
INSERT INTO editor VALUES (8,'Jacqui Goosnell','jgoosnell7@phpbb.com','108-956-0904');
INSERT INTO editor VALUES (9,'Thekla Gonzales','tgonzales8@cnbc.com','116-930-1563');
INSERT INTO editor VALUES (10,'Donnie Singleton','dsingleton9@bandcamp.com','659-630-2834');
INSERT INTO editor VALUES (11,'Gil Mannakee','gmannakeea@bbc.co.uk','732-879-3564');
INSERT INTO editor VALUES (12,'Ezra Tudball','etudballb@chronoengine.com','999-121-5288');
INSERT INTO editor VALUES (13,'Gordan Grimsell','ggrimsellc@soup.io','336-372-1950');
INSERT INTO editor VALUES (14,'Lucilia Farncomb','lfarncombd@bloglovin.com','116-656-6102');
INSERT INTO editor VALUES (15,'Eydie Ziehms','eziehmse@unblog.fr','882-653-7956');
INSERT INTO editor VALUES (16,'Daryle Harling','dharlingf@nbcnews.com','123-698-9389');
INSERT INTO editor VALUES (17,'Shandie Yerrall','syerrallg@shareasale.com','291-334-5693');
INSERT INTO editor VALUES (18,'Quinta Franks','qfranksh@wix.com','710-412-0558');
INSERT INTO editor VALUES (19,'Lauryn Lutwidge','llutwidgei@flickr.com','831-210-3412');
INSERT INTO editor VALUES (20,'Wendall Eburne','weburnej@rediff.com','831-597-3063');

--affiliation
INSERT INTO affiliation VALUES (1,1);
INSERT INTO affiliation VALUES (2,7);
INSERT INTO affiliation VALUES (3,3);
INSERT INTO affiliation VALUES (4,4);
INSERT INTO affiliation VALUES (5,5);
INSERT INTO affiliation VALUES (6,19);
INSERT INTO affiliation VALUES (7,7);
INSERT INTO affiliation VALUES (8,8);
INSERT INTO affiliation VALUES (9,11);
INSERT INTO affiliation VALUES (10,10);
INSERT INTO affiliation VALUES (11,11);
INSERT INTO affiliation VALUES (12,9);
INSERT INTO affiliation VALUES (13,13);
INSERT INTO affiliation VALUES (14,17);
INSERT INTO affiliation VALUES (15,12);
INSERT INTO affiliation VALUES (16,2);
INSERT INTO affiliation VALUES (17,12);
INSERT INTO affiliation VALUES (18,18);
INSERT INTO affiliation VALUES (19,19);
INSERT INTO affiliation VALUES (20,1);

--journal
INSERT INTO journal VALUES (1,'The Scientific World Journal',19);
INSERT INTO journal VALUES (2,'Royal Society Open Science',13);
INSERT INTO journal VALUES (3,'Nature Reviews Physics',3);
INSERT INTO journal VALUES (4,'PLOS Biology',13);
INSERT INTO journal VALUES (5,'Astronomy and Astro Physics',3);
INSERT INTO journal VALUES (6,'Science Direct',6);
INSERT INTO journal VALUES (7,'Science and Research',7);
INSERT INTO journal VALUES (8,'Frontiers',8);
INSERT INTO journal VALUES (9,'Science and Engineering',14);
INSERT INTO journal VALUES (10,'Hindawi Science Journal',7);
INSERT INTO journal VALUES (11,'Springer Mathematical Science',11);
INSERT INTO journal VALUES (12,'International Journal of Mathematics',12);
INSERT INTO journal VALUES (13,'Open Microbiology Journal',13);
INSERT INTO journal VALUES (14,'Data Science Journal',6);
INSERT INTO journal VALUES (15,'EPJ Data Science',5);
INSERT INTO journal VALUES (16,'Havard Data Science Review',5);
INSERT INTO journal VALUES (17,'International Journal of Engineering Science',12);
INSERT INTO journal VALUES (18,'Arabian Journal for Science and Engineering',12);
INSERT INTO journal VALUES (19,'International Journal of Engineering Research in Africa',14);
INSERT INTO journal VALUES (20,'International Journal of Immunology',13);

--issue
INSERT INTO issue VALUES ('1', '6-Jul-2021', '1');
INSERT INTO issue VALUES ('2', '20-Nov-2021', '6');
INSERT INTO issue VALUES ('3', '17-Oct-2021', '1');
INSERT INTO issue VALUES ('4', '19-Jan-2022', '4');
INSERT INTO issue VALUES ('5', '28-Aug-2021', '12');
INSERT INTO issue VALUES ('6', '6-Jul-2021', '6');
INSERT INTO issue VALUES ('7', '28-Mar-2021', '16');
INSERT INTO issue VALUES ('8', '18-Jun-2021', '8');
INSERT INTO issue VALUES ('9', '14-Nov-2021', '9');
INSERT INTO issue VALUES ('10', '18-Dec-2021', '10');
INSERT INTO issue VALUES ('11', '22-Sep-2021', '7');
INSERT INTO issue VALUES ('12', '15-May-2021', '19');
INSERT INTO issue VALUES ('13', '6-Mar-2022', '9');
INSERT INTO issue VALUES ('14', '3-Jan-2022', '11');
INSERT INTO issue VALUES ('15', '9-Aug-2021', '1');
INSERT INTO issue VALUES ('16', '10-Jul-2021', '2');
INSERT INTO issue VALUES ('17', '24-Mar-2022', '10');
INSERT INTO issue VALUES ('18', '26-Jun-2021', '6');
INSERT INTO issue VALUES ('19', '16-Oct-2021', '1');
INSERT INTO issue VALUES ('20', '4-Jan-2022', '5');

--subscription
INSERT INTO subscription VALUES ('12', '1');
INSERT INTO subscription VALUES ('2', '5');
INSERT INTO subscription VALUES ('1', '3');
INSERT INTO subscription VALUES ('4', '3');
INSERT INTO subscription VALUES ('4', '12');
INSERT INTO subscription VALUES ('6', '6');
INSERT INTO subscription VALUES ('1', '10');
INSERT INTO subscription VALUES ('8', '2');
INSERT INTO subscription VALUES ('9', '2');
INSERT INTO subscription VALUES ('10', '10');
INSERT INTO subscription VALUES ('2', '12');
INSERT INTO subscription VALUES ('6', '12');
INSERT INTO subscription VALUES ('6', '9');
INSERT INTO subscription VALUES ('14', '8');
INSERT INTO subscription VALUES ('1', '15');
INSERT INTO subscription VALUES ('20', '10');
INSERT INTO subscription VALUES ('2', '17');
INSERT INTO subscription VALUES ('1', '11');
INSERT INTO subscription VALUES ('12', '7');
INSERT INTO subscription VALUES ('16', '20');

--edits
INSERT INTO edits VALUES ('4', '1');
INSERT INTO edits VALUES ('2', '2');
INSERT INTO edits VALUES ('3', '3');
INSERT INTO edits VALUES ('12', '4');
INSERT INTO edits VALUES ('4', '5');
INSERT INTO edits VALUES ('13', '6');
INSERT INTO edits VALUES ('7', '7');
INSERT INTO edits VALUES ('8', '8');
INSERT INTO edits VALUES ('5', '9');
INSERT INTO edits VALUES ('10', '10');
INSERT INTO edits VALUES ('1', '11');
INSERT INTO edits VALUES ('2', '12');
INSERT INTO edits VALUES ('2', '13');
INSERT INTO edits VALUES ('14', '14');
INSERT INTO edits VALUES ('15', '15');
INSERT INTO edits VALUES ('3', '16');
INSERT INTO edits VALUES ('2', '17');
INSERT INTO edits VALUES ('2', '18');
INSERT INTO edits VALUES ('19', '19');
INSERT INTO edits VALUES ('15', '20');

--publication
INSERT INTO publication VALUES (1, 'Hierarchy of Molecules', 'Molecular Physics', 3, '1', '11-Nov-2019', '29-Nov-2020');
INSERT INTO publication VALUES (2, 'Classification of Fundus Images Using a Neural Network', 'Digital Health and Artificial Intelligence', 15, '5', '13-Jun-2020', '25-Aug-2020');
INSERT INTO publication VALUES (3, 'Thermophylic Fungi in the New Age of Fungal Taxonomy', 'Taxonomy', 1, '6', '28-Jun-2020', '25-Aug-2020');
INSERT INTO publication VALUES (4, 'Use of a Two Layer Neural Network to Detect Trachoma from Images', 'Digital Health and Artificial Intelligence', 15, '2', '2-Feb-2020', '28-Dec-2020');
INSERT INTO publication VALUES (5, 'Realising Quantum Transitions', 'Quantum', 5, '7', '21-Feb-2020', '2-May-2020');
INSERT INTO publication VALUES (6, 'Physical Modeling of Earth Climates and Reliably Predicting Global Warming', 'Climate Change', 6, '20', '25-Nov-2020', '24-Dec-2020');
INSERT INTO publication VALUES (7, 'Customer Churn Prediction', 'Business Analytics', 14, '3', '4-Dec-2019', '22-Dec-2020');
INSERT INTO publication VALUES (8, 'Volatility Analysis of Exchange Rate with Correlated Errors', 'Correlation', 17, '19', '19-Jan-2020', '15-Dec-2020');
INSERT INTO publication VALUES (9, 'Theory of Optimal Transport and its Applications in Partial Differential Equations', 'Differential Equations', 9, '4', '9-Jun-2020', '16-Jan-2021');
INSERT INTO publication VALUES (10, 'A New Numerical Method for Solving First order Differential Equations', 'Numerical Methods', 10, '13', '12-Oct-2020', '17-Nov-2020');
INSERT INTO publication VALUES (11, 'Mathematical Study in Non-Linear Wave Propagation', 'Waves', 17, '14', '4-Apr-2020', '24-Jun-2020');
INSERT INTO publication VALUES (12, 'The MACPF/CDC Family of Pore Forming Toxins', 'Toxins', 12, '8', '24-Jul-2020', '9-Nov-2020');
INSERT INTO publication VALUES (13, 'Using Fractals to Characterise an Oil Reservoir', 'Petroleum Engineering', 1, '18', '11-May-2020', '27-Dec-2020');
INSERT INTO publication VALUES (14, 'Malware Threat Detection using Deep Neural Networks', 'Threat Detection', 14, '15', '20-Jan-2020', '4-Dec-2020');
INSERT INTO publication VALUES (15, 'Distribution of Multivariate White Noise Auto Correlations', 'Advanced Statistics', 15, '11', '20-Nov-2019', '21-Jul-2020');
INSERT INTO publication VALUES (16, 'Design of Inertia Fusion Implotions', 'Energy', 9, '16', '23-Feb-2020', '7-Apr-2020');
INSERT INTO publication VALUES (17, 'Electrophysiology of Turgor Regulation in Marine Siphonous Green Algae', 'Micro organisms', 4, '10', '16-Feb-2020', '21-Dec-2020');
INSERT INTO publication VALUES (18, 'An Ontology of Bacteria to help Physicians Compare Antbacterial Spectra', 'Micro organisms', 4, '17', '12-Mar-2020', '31-Oct-2020');
INSERT INTO publication VALUES (19, 'Retail Market Basket Analysis', 'Business Analytics', 15, '12', '30-Dec-2019', '8-Mar-2020');
INSERT INTO publication VALUES (20, 'Periodic Synchronisation of Dengue Epidemics', 'Virology', 20, '9', '30-Apr-2020', '8-Nov-2020');


--review
INSERT INTO review VALUES (10, 1, '29-Jan-22', 'Accept');
INSERT INTO review VALUES (5, 1, '09-Jun-21', 'Accept');
INSERT INTO review VALUES (19, 2, '25-Dec-21', 'Accept');
INSERT INTO review VALUES (7, 4, '13-Mar-22', 'Reject');
INSERT INTO review VALUES (4, 7, '05-Jul-21', 'Reject');
INSERT INTO review VALUES (15, 7, '29-Jul-21', 'Accept');
INSERT INTO review VALUES (2, 19, '03-Jan-22', 'Accept');
INSERT INTO review VALUES (20, 3, '07-May-21', 'Reject');
INSERT INTO review VALUES (17, 3, '30-Oct-21', 'Accept');
INSERT INTO review VALUES (3, 3, '20-Feb-22', 'Reject');
INSERT INTO review VALUES (3, 12, '08-Jan-22', 'Accept');
INSERT INTO review VALUES (18, 12, '18-Dec-21', 'Accept');
INSERT INTO review VALUES (15, 8, '12-Mar-22', 'Accept');
INSERT INTO review VALUES (9, 8, '15-May-21', 'Reject');
INSERT INTO review VALUES (10, 15, '06-Aug-21', 'Accept');
INSERT INTO review VALUES (16, 14, '10-Dec-21', 'Accept');
INSERT INTO review VALUES (5, 14, '28-Jan-22', 'Reject');
INSERT INTO review VALUES (5, 13, '08-Apr-21', 'Reject');
INSERT INTO review VALUES (10, 16, '08-Dec-21', 'Accept');
INSERT INTO review VALUES (19, 19, '01-Jun-21', 'Accept');