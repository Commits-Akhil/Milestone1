BEGIN TRANSACTION;
CREATE TABLE org_service(
org_service_id INTEGER PRIMARY KEY AUTOINCREMENT,
organisation_id INTEGER,
service_id INTEGER,
FOREIGN KEY (organisation_id) REFERENCES organisation(organisation_id),
FOREIGN KEY(service_id) REFERENCES service(service_id)
);
CREATE TABLE organisation(
organisation_id INTEGER PRIMARY KEY AUTOINCREMENT,
organisation_name TEXT UNIQUE,
about TEXT
);
INSERT INTO "organisation" VALUES(1,'Amazon','E-commerce and cloud company');
INSERT INTO "organisation" VALUES(2,'Netflix','Streaming platform');
CREATE TABLE plan(
plan_id INTEGER PRIMARY KEY AUTOINCREMENT,
plan_name TEXT,
users_allowed INTEGER,
plan_cost INTEGER
);
INSERT INTO "plan" VALUES(1,'Basic Plan',100,5000);
INSERT INTO "plan" VALUES(2,'Standard Plan',200,10000);
INSERT INTO "plan" VALUES(3,'Premium Plan',300,13000);
CREATE TABLE plan_features(
feature_id INTEGER PRIMARY KEY AUTOINCREMENT,
plan_id INTEGER,
feature TEXT,
duration TEXT NOT NULL,
FOREIGN KEY (plan_id) REFERENCES plan(plan_id)
);
INSERT INTO "plan_features" VALUES(1,1,'Moderate Bandwidth','6 Months');
INSERT INTO "plan_features" VALUES(2,1,'No Tech Support','6 Months');
INSERT INTO "plan_features" VALUES(3,2,'Moderate Bandwidth Plus Support','6 Months');
INSERT INTO "plan_features" VALUES(4,3,'Good Bandwidth With Support','1 Year');
CREATE TABLE purchase(
purchase_id INTEGER PRIMARY KEY AUTOINCREMENT,
plan_id INTEGER,
organisation_id INTEGER,
bill_date INTEGER,
expire_date INTEGER,
FOREIGN KEY (plan_id) REFERENCES plan(plan_id),
FOREIGN KEY (organisation_id) REFERENCES organisation(organisation_id)
);
CREATE TABLE service(
service_id INTEGER PRIMARY KEY AUTOINCREMENT,
service_name TEXT UNIQUE
);
CREATE TABLE user(
user_id INTEGER PRIMARY KEY AUTOINCREMENT,
username TEXT,
email TEXT UNIQUE,
password TEXT
);
INSERT INTO "user" VALUES(1,'akhil','akhil@amazon.com','akhil123');
INSERT INTO "user" VALUES(2,'nikhil','nikhil@amazon.com','nikhil123');
INSERT INTO "user" VALUES(3,'shikil','shikil@amazon.com','shikil123');
INSERT INTO "user" VALUES(4,'raj','raj@netflix.com','raj123');
INSERT INTO "user" VALUES(5,'vijay','vijay@netflix.com','vijay123');
CREATE TABLE user_Contact(
contact_id INTEGER PRIMARY KEY AUTOINCREMENT,
user_id INTEGER,
ph_no TEXT,
FOREIGN KEY (user_id) REFERENCES user(user_id)
);
INSERT INTO "user_Contact" VALUES(1,1,'111111');
INSERT INTO "user_Contact" VALUES(2,1,'111112');
INSERT INTO "user_Contact" VALUES(3,1,'111113');
INSERT INTO "user_Contact" VALUES(4,2,'222221');
INSERT INTO "user_Contact" VALUES(5,3,'333331');
INSERT INTO "user_Contact" VALUES(6,4,'444441');
INSERT INTO "user_Contact" VALUES(7,5,'555551');
CREATE TABLE user_organisation(
user_org INTEGER PRIMARY KEY AUTOINCREMENT,
user_id INTEGER,
organisation_id INTEGER,
FOREIGN KEY (user_id) REFERENCES user(user_id),
FOREIGN KEY (organisation_id) REFERENCES organisation(organisation_id)
);
INSERT INTO "user_organisation" VALUES(1,1,1);
INSERT INTO "user_organisation" VALUES(2,2,1);
INSERT INTO "user_organisation" VALUES(3,3,1);
INSERT INTO "user_organisation" VALUES(4,4,2);
INSERT INTO "user_organisation" VALUES(5,5,2);
CREATE TABLE user_plan(
user_plan_id INTEGER PRIMARY KEY AUTOINCREMENT,
plan_id INTEGER,
user_id INTEGER,
FOREIGN KEY (user_id) REFERENCES user(user_id),
FOREIGN KEY (plan_id) REFERENCES plan(plan_id)
);
INSERT INTO "user_plan" VALUES(1,1,1);
INSERT INTO "user_plan" VALUES(2,1,2);
INSERT INTO "user_plan" VALUES(3,2,3);
INSERT INTO "user_plan" VALUES(4,3,4);
INSERT INTO "user_plan" VALUES(5,2,5);
CREATE TABLE user_role(
role_id INTEGER PRIMARY KEY AUTOINCREMENT,
user_id INTEGER,
role TEXT,
FOREIGN KEY (user_id) REFERENCES user(user_id)
);
INSERT INTO "user_role" VALUES(1,1,'HR');
INSERT INTO "user_role" VALUES(2,2,'Technical Head');
INSERT INTO "user_role" VALUES(3,3,'HR');
INSERT INTO "user_role" VALUES(4,4,'Manager');
INSERT INTO "user_role" VALUES(5,5,'Developer');
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('user',5);
INSERT INTO "sqlite_sequence" VALUES('organisation',2);
INSERT INTO "sqlite_sequence" VALUES('user_organisation',5);
INSERT INTO "sqlite_sequence" VALUES('user_Contact',7);
INSERT INTO "sqlite_sequence" VALUES('user_role',5);
INSERT INTO "sqlite_sequence" VALUES('plan',3);
INSERT INTO "sqlite_sequence" VALUES('plan_features',4);
INSERT INTO "sqlite_sequence" VALUES('user_plan',5);
COMMIT;