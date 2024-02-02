CREATE TABLE IF NOT EXISTS Genre (
	id SERIAL PRIMARY KEY,
	GenreName VARCHAR(60) NOT null unique
);

CREATE TABLE IF NOT EXISTS Artist (
	id SERIAL PRIMARY KEY,
	ArtistName VARCHAR(60) NOT null unique
);

CREATE TABLE IF NOT EXISTS GenreArtist (
	id SERIAL PRIMARY KEY,
	IdGenre INTEGER NOT NULL REFERENCES Genre(id),
	IdArtist INTEGER NOT NULL REFERENCES Artist(id)
);

CREATE TABLE IF NOT EXISTS Album (
	id SERIAL PRIMARY KEY,
	AlbumName VARCHAR(60) NOT null unique,
	AlbumYear date check (AlbumYear<'2024-01-01')
);

CREATE TABLE IF NOT EXISTS ArtistAlbum (
	id SERIAL PRIMARY KEY,
	IdArtist INTEGER NOT NULL REFERENCES Artist(id),
	IdAlbum INTEGER NOT NULL REFERENCES Album(id)
);

CREATE TABLE IF NOT EXISTS Song (
	id SERIAL PRIMARY KEY,
	AlbumId INTEGER NOT NULL REFERENCES Album (id),
	SongName VARCHAR(60) NOT null unique,
	SongDuration INTEGER NOT null
);

CREATE TABLE IF NOT EXISTS Collection (
	id SERIAL PRIMARY KEY,
	CollectionName VARCHAR(60) NOT null unique,
	CollectionYear date check (CollectionYear<'2024-01-01' and CollectionYear>'1987-01-01')
);

CREATE TABLE IF NOT EXISTS CollectionSong (
	id SERIAL PRIMARY KEY,
	IdCollection INTEGER NOT NULL REFERENCES Collection(id),
	IdSong INTEGER NOT NULL REFERENCES Song(id)
);

