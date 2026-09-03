--
-- freeCodeCamp Celestial Bodies Database
--
CREATE DATABASE universe;
\c universe

CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(40) UNIQUE NOT NULL,
    galaxy_type TEXT NOT NULL,
    age_in_millions_of_years NUMERIC,
    has_life BOOLEAN NOT NULL DEFAULT false,
    is_spherical BOOLEAN NOT NULL DEFAULT true,
    distance_from_earth INT
);

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(40) UNIQUE NOT NULL,
    galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
    spectral_type VARCHAR(20) NOT NULL,
    mass_solar NUMERIC,
    temperature_k INT,
    is_spherical BOOLEAN NOT NULL DEFAULT true,
    has_planets BOOLEAN NOT NULL DEFAULT false
);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(40) UNIQUE NOT NULL,
    star_id INT NOT NULL REFERENCES star(star_id),
    planet_type VARCHAR(40) NOT NULL,
    has_life BOOLEAN NOT NULL DEFAULT false,
    is_spherical BOOLEAN NOT NULL DEFAULT true,
    orbital_period_days INT,
    radius_km NUMERIC
);

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(40) UNIQUE NOT NULL,
    planet_id INT NOT NULL REFERENCES planet(planet_id),
    has_atmosphere BOOLEAN NOT NULL DEFAULT false,
    is_spherical BOOLEAN NOT NULL DEFAULT true,
    diameter_km INT,
    orbital_period_days NUMERIC,
    notes TEXT
);

CREATE TABLE comet (
    comet_id SERIAL PRIMARY KEY,
    name VARCHAR(40) UNIQUE NOT NULL,
    galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
    period_years INT NOT NULL,
    is_periodic BOOLEAN NOT NULL DEFAULT true,
    description TEXT
);

INSERT INTO galaxy (name, galaxy_type, age_in_millions_of_years, has_life, is_spherical, distance_from_earth) VALUES
('Milky Way', 'spiral', 13600, true, true, 0),
('Andromeda', 'spiral', 10010, false, true, 2537000),
('Triangulum', 'spiral', 10000, false, true, 2730000),
('Whirlpool', 'spiral', 400, false, true, 23000000),
('Sombrero', 'lenticular', 13250, false, true, 29350000),
('Pinwheel', 'spiral', 10000, false, true, 20870000);

INSERT INTO star (name, galaxy_id, spectral_type, mass_solar, temperature_k, is_spherical, has_planets) VALUES
('Sun', 1, 'G2V', 1.0, 5778, true, true),
('Proxima Centauri', 1, 'M5.5V', 0.12, 3042, true, true),
('Sirius', 1, 'A1V', 2.02, 9940, true, true),
('Vega', 1, 'A0V', 2.1, 9602, true, true),
('Betelgeuse', 1, 'M1-2Ia', 16.5, 3600, true, false),
('Rigel', 1, 'B8Ia', 21.0, 12100, true, true);

INSERT INTO planet (name, star_id, planet_type, has_life, is_spherical, orbital_period_days, radius_km) VALUES
('Mercury', 1, 'terrestrial', false, true, 88, 2440),
('Venus', 1, 'terrestrial', false, true, 225, 6052),
('Earth', 1, 'terrestrial', true, true, 365, 6371),
('Mars', 1, 'terrestrial', false, true, 687, 3390),
('Jupiter', 1, 'gas giant', false, true, 4333, 69911),
('Saturn', 1, 'gas giant', false, true, 10759, 58232),
('Uranus', 1, 'ice giant', false, true, 30687, 25362),
('Neptune', 1, 'ice giant', false, true, 60190, 24622),
('Proxima b', 2, 'terrestrial', false, true, 11, 7160),
('Sirius b I', 3, 'gas giant', false, true, 420, 50000),
('Vega I', 4, 'terrestrial', false, true, 90, 5100),
('Rigel I', 6, 'ice giant', false, true, 1400, 22000);

INSERT INTO moon (name, planet_id, has_atmosphere, is_spherical, diameter_km, orbital_period_days, notes) VALUES
('Luna', 3, false, true, 3474, 27.3, 'Earth moon'),
('Phobos', 4, false, false, 22, 0.3, 'Mars inner'),
('Deimos', 4, false, false, 12, 1.3, 'Mars outer'),
('Io', 5, true, true, 3643, 1.8, 'volcanic'),
('Europa', 5, true, true, 3122, 3.5, 'ice crust'),
('Ganymede', 5, true, true, 5268, 7.2, 'largest moon'),
('Callisto', 5, false, true, 4821, 16.7, 'cratered'),
('Titan', 6, true, true, 5150, 16.0, 'thick atmosphere'),
('Enceladus', 6, true, true, 504, 1.4, 'geysers'),
('Mimas', 6, false, true, 396, 0.9, 'death star'),
('Rhea', 6, false, true, 1528, 4.5, 'icy'),
('Iapetus', 6, false, true, 1470, 79.3, 'two-tone'),
('Tethys', 6, false, true, 1062, 1.9, 'odysseus crater'),
('Dione', 6, false, true, 1123, 2.7, 'ice cliffs'),
('Miranda', 7, false, true, 472, 1.4, 'cliff'),
('Ariel', 7, false, true, 1158, 2.5, 'uranian'),
('Umbriel', 7, false, true, 1169, 4.1, 'dark'),
('Titania', 7, false, true, 1578, 8.7, 'largest uranian'),
('Oberon', 7, false, true, 1523, 13.5, 'outer uranian'),
('Triton', 8, true, true, 2707, 5.9, 'retrograde');

INSERT INTO comet (name, galaxy_id, period_years, is_periodic, description) VALUES
('Halley', 1, 76, true, 'Famous periodic comet'),
('Hale-Bopp', 1, 2533, true, 'Great comet of 1997'),
('Encke', 1, 3, true, 'Short period comet');
