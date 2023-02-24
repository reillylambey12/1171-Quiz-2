CREATE TABLE "albums" (
  "album_ID" int PRIMARY KEY NOT NULL,
  "title" text NOT NULL,
  "artist" Varchar(100) NOT NULL
);

CREATE TABLE "tracks" (
  "track_ID" int PRIMARY KEY NOT NULL,
  "title" text NOT NULL,
  "artist" Varchar(100) NOT NULL,
  "lenght_time" time NOT NULL
);

CREATE TABLE "albums_tracks" (
  "id" SERIAL PRIMARY KEY,
  "album_ID" integer,
  "track_ID" integer
);

ALTER TABLE "albums_tracks" ADD FOREIGN KEY ("album_ID") REFERENCES "albums" ("album_ID");

ALTER TABLE "albums_tracks" ADD FOREIGN KEY ("track_ID") REFERENCES "tracks" ("track_ID");
