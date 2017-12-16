create table buyer (
  id serial primary key,
  company varchar(100) not null,
  contactName varchar(100) not null,
  contactEmail varchar(100) not null
);

create table venue (
  id serial primary key,
  venue varchar(100) not null,
  city varchar(50) not null,
  state varchar(2) not null,
  capacity integer not null
);

create table show (
  id serial primary key,
  buyer_id integer not null references buyer(id),
  venue_id integer not null references venue(id),
  artist varchar(100),
  showdate date,
  compensation varchar (200)
);


INSERT INTO buyer (company, contactName, contactEmail) VALUES ('Zero Mile Presents', 'Scott Orvold', 'scott@zeromile.com');
INSERT INTO buyer (company, contactName, contactEmail) VALUES ('Murray Hill Theatre', 'Tom Rossmanith', 'tom@murrayhilltheatre.com');
INSERT INTO buyer (company, contactName, contactEmail) VALUES ('Little Flower Events', 'Jason Wall', 'jason@littleflowerevents.com');

INSERT INTO venue (venue, city, state, capacity) VALUES ('Georgia Theatre', 'Athens', 'GA', 965);
INSERT INTO venue (venue, city, state, capacity) VALUES ('Murray Hill Theatre', 'Jacksonville', 'FL', 600);
INSERT INTO venue (venue, city, state, capacity) VALUES ('Van Meter Hall', 'Bowling Green', 'KY', 1300);
INSERT INTO venue (venue, city, state, capacity) VALUES ('Variety Playhouse', 'Atlanta', 'GA', 1050);

INSERT INTO show (buyer_id, venue_id, artist, showdate, compensation) VALUES (1, 1, 'Crowder', to_date('2017-11-15', 'YYYY-MM-DD'), '$12,500 PLUS 85% AFTER 15% PP AND APPROVED EXPENSES');
INSERT INTO show (buyer_id, venue_id, artist, showdate, compensation) VALUES (2, 2, 'RED', to_date('2017-10-28', 'YYYY-MM-DD'), '$3,000 VERSUS 70% NBOR');
INSERT INTO show (buyer_id, venue_id, artist, showdate, compensation) VALUES (3, 3, 'Crowder', to_date('2017-10-24', 'YYYY-MM-DD'), '$12,500 VERSUS 50% GBOR');
INSERT INTO show (buyer_id, venue_id, artist, showdate, compensation) VALUES (1, 4, 'Travis Greene', to_date('2018-03-01', 'YYYY-MM-DD'), '$5,000 VERSUS 70% NBOR');

SELECT * FROM buyer;
SELECT * FROM venue;
SELECT * FROM show;

SELECT * FROM show WHERE buyer_id = 1;
SELECT * FROM show WHERE venue_id = 1;
SELECT * FROM show a JOIN buyer x ON a.buyer_id = x.id;
SELECT * FROM show a JOIN venue x ON a.venue_id = x.id;
