BEGIN TRANSACTION;
CREATE TABLE feature(
feature_id integer primary key autoincrement,
feature text
);
INSERT INTO "feature" VALUES(1,'Moderate Bandwidth');
INSERT INTO "feature" VALUES(2,'Technical Support');
INSERT INTO "feature" VALUES(3,'Good Bandwidth');
INSERT INTO "feature" VALUES(4,'No Tech Support');
CREATE TABLE organisation(
organisation_id integer primary key autoincrement,
organisation_name text
);
INSERT INTO "organisation" VALUES(1,'Amazon');
INSERT INTO "organisation" VALUES(2,'Netflix');
CREATE TABLE organisation_plan(
organisation_plan_id integer primary key autoincrement,
organisation_id integer,
plan_id integer,
starting_date text,
ending_date text,
foreign key (organisation_id) references organisation(organisation_id),
foreign key (plan_id) references plan(plan_id)
);
INSERT INTO "organisation_plan" VALUES(1,1,1,'2026-01-01','2026-06-30');
INSERT INTO "organisation_plan" VALUES(2,1,2,'2026-07-01','2026-12-31');
INSERT INTO "organisation_plan" VALUES(3,2,3,'2026-01-01','2026-12-31');
CREATE TABLE payment(
payment_id integer primary key autoincrement,
payment_type text,
payment_amount integer,
organisation_id integer,
plan_id integer,
foreign key (plan_id) references plan(plan_id),
foreign key (organisation_id) references organisation(organisation_id)
);
INSERT INTO "payment" VALUES(1,'UPI',5000,1,1);
INSERT INTO "payment" VALUES(2,'Card',10000,1,2);
INSERT INTO "payment" VALUES(3,'Net Banking',13000,2,3);
CREATE TABLE plan(
plan_id integer primary key autoincrement,
plan_name text,
price integer
);
INSERT INTO "plan" VALUES(1,'Basic Plan',5000);
INSERT INTO "plan" VALUES(2,'Standard Plan',10000);
INSERT INTO "plan" VALUES(3,'Premium Plan',13000);
CREATE TABLE plan_duration(
duration_id integer primary key autoincrement,
plan_id integer,
duration text,
foreign key (plan_id) references plan(plan_id)
);
INSERT INTO "plan_duration" VALUES(1,1,'6 Months');
INSERT INTO "plan_duration" VALUES(2,2,'6 Months');
INSERT INTO "plan_duration" VALUES(3,3,'1 Year');
CREATE TABLE plan_feature(
plan_feature_id integer primary key autoincrement,
plan_id integer,
feature_id integer,
foreign key (plan_id) references plan(plan_id),
foreign key (feature_id) references feature(feature_id)
);
INSERT INTO "plan_feature" VALUES(1,1,1);
INSERT INTO "plan_feature" VALUES(2,1,4);
INSERT INTO "plan_feature" VALUES(3,2,1);
INSERT INTO "plan_feature" VALUES(4,2,2);
INSERT INTO "plan_feature" VALUES(5,3,3);
INSERT INTO "plan_feature" VALUES(6,3,2);
CREATE TABLE plan_usage(
usage_id integer primary key autoincrement,
plan_id integer,
usage_limit integer,
remaining_usage integer,
foreign key (plan_id) references plan(plan_id)
);
CREATE TABLE role(
role_id integer primary key autoincrement,
role_name text
);
INSERT INTO "role" VALUES(1,'HR');
INSERT INTO "role" VALUES(2,'Technical Head');
INSERT INTO "role" VALUES(3,'Manager');
INSERT INTO "role" VALUES(4,'Developer');
CREATE TABLE user(
user_id integer primary key autoincrement,
user_name text,
user_email text
);
INSERT INTO "user" VALUES(1,'akhil','akhil@amazon.com');
INSERT INTO "user" VALUES(2,'nikhil','nikhil@amazon.com');
INSERT INTO "user" VALUES(3,'shikil','shikil@amazon.com');
INSERT INTO "user" VALUES(4,'raj','raj@netflix.com');
INSERT INTO "user" VALUES(5,'vijay','vijay@netflix.com');
CREATE TABLE user_contact(
contact_id integer primary key autoincrement,
user_id integer,
contact_no text,
foreign key (user_id) references user(user_id)
);
INSERT INTO "user_contact" VALUES(1,1,'111111');
INSERT INTO "user_contact" VALUES(2,1,'111112');
INSERT INTO "user_contact" VALUES(3,1,'111113');
INSERT INTO "user_contact" VALUES(4,2,'222221');
INSERT INTO "user_contact" VALUES(5,3,'333331');
INSERT INTO "user_contact" VALUES(6,4,'444441');
INSERT INTO "user_contact" VALUES(7,5,'555551');
CREATE TABLE user_org(
user_org_id integer primary key autoincrement,
user_id integer,
organisation_id integer,
foreign key (user_id) references user(user_id),
foreign key(organisation_id) references organisation(organisation_id)
);
INSERT INTO "user_org" VALUES(1,1,1);
INSERT INTO "user_org" VALUES(2,2,1);
INSERT INTO "user_org" VALUES(3,3,1);
INSERT INTO "user_org" VALUES(4,4,2);
INSERT INTO "user_org" VALUES(5,5,2);
CREATE TABLE user_role(
user_role_id integer primary key autoincrement,
user_id integer,
role_id integer,
foreign key (user_id) references user(user_id),
foreign key (role_id) references role(role_id)
);
INSERT INTO "user_role" VALUES(1,1,1);
INSERT INTO "user_role" VALUES(2,2,2);
INSERT INTO "user_role" VALUES(3,3,1);
INSERT INTO "user_role" VALUES(4,4,3);
INSERT INTO "user_role" VALUES(5,5,4);
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('organisation',2);
INSERT INTO "sqlite_sequence" VALUES('user',5);
INSERT INTO "sqlite_sequence" VALUES('user_contact',7);
INSERT INTO "sqlite_sequence" VALUES('user_org',5);
INSERT INTO "sqlite_sequence" VALUES('role',4);
INSERT INTO "sqlite_sequence" VALUES('user_role',5);
INSERT INTO "sqlite_sequence" VALUES('plan',3);
INSERT INTO "sqlite_sequence" VALUES('plan_duration',3);
INSERT INTO "sqlite_sequence" VALUES('feature',4);
INSERT INTO "sqlite_sequence" VALUES('plan_feature',6);
INSERT INTO "sqlite_sequence" VALUES('organisation_plan',3);
INSERT INTO "sqlite_sequence" VALUES('payment',3);
COMMIT;
