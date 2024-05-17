CREATE DATABASE "sunny_day"

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS lists;
DROP TABLE IF EXISTS list_items;
DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS priority;
DROP TABLE IF EXISTS prefered_weather_type;
DROP TABLE IF EXISTS time_of_day;
DROP TABLE IF EXISTS daily_forecast;
DROP TABLE IF EXISTS hourly_forecast;
DROP TABLE IF EXISTS weather_icons;
DROP TABLE IF EXISTS forecast_precipitation_types;

CREATE TABLE users (
  id  SERIAL PRIMARY KEY,
  username  VARCHAR(100) NOT NULL,
  password  VARCHAR(100) NOT NULL
);

CREATE TABLE lists (
  id  SERIAL PRIMARY KEY,
  description VARCHAR(200) NOT NULL,
  show_on_open  BOOLEAN DEFAULT FALSE,
  sort_order  INT NOT NULL,
  user_id INT REFERENCES user
);

CREATE TABLE list_items (
  id SERIAL PRIMARY KEY,
  priority INT DEFAULT NULL,
  prefered_weather_type INT DEFAULT NULL,
  due_date DATE DEFAULT NULL,
  year_to_complete INT DEFAULT NULL,
  month_to_complete INT DEFAULT NULL,
  day_to_complete INT DEFAULT NULL,
  time_of_day_to_complete INT DEFAULT NULL,
  location INT NOT NULL,
  sort_order INT NOT NULL,
  list_id REFERENCES lists,
);

CREATE TABLE locations (
  id SERIAL PRIMARY KEY,
  name VARCHAR(200),
  country VARCHAR(100),
  zip INT,
  region VARCHAR(200),
  latitude FLOAT,
  longitude FLOAT,
  timezone_id INT,
  utc_offset  FLOAT,
  is_master_default_location BOOLEAN
);
  
CREATE TABLE priority (
  id SERIAL PRIMARY KEY,
  description VARCHAR(100) NOT NULL
);

CREATE TABLE prefered_weather_type (
  id SERIAL PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  description VARCHAR(100) NOT NULL,
  icon_url  VARCHAR(200) NOT NULL
);
 
CREATE TABLE time_of_day (
  id SERIAL PRIMARY KEY,
  morning TIME NOT NULL,
  afternoon TIME NOT NULL,
  evening TIME NOT NULL,
  night TIME NOT NULL
);

CREATE TABLE daily_forecast (
  id SERIAL PRIMARY KEY,
  location_id REFERENCES locations,
  date  DATE,
  temp_max DEC,
  temp_min  DEC,
  temp  DEC,
  feelslikemax  DEC,
  feelslikemin  DEC,
  feelslike DEC,
  dew DEC,
  humidity  DEC,
  precip  DEC,
  precipprob  DEC,
  snow DEC,
  snow_depth  DEC,
  windgust  DEC,
  windspeed DEC,
  cloudcover  DEC,
  visibility  DEC,
  uvindex DEC,
  severerisk  DEC,
  sunrise TIME,
  sunset  TIME,
  conditions  VARCHAR(300),
  description VARCHAR(500),
  icon  REFERENCES weather_icons,
);

CREATE TABLE hourly_forecast (
  id SERIAL PRIMARY KEY,
  location_id REFERENCES locatations,
  time  TIME,
  datetimeEpoch DATETIME,
  date DATE,
  temp DEC,
  feelslike  DEC,
  humidity  DEC,
  precip  DEC,
  precipprob  DEC,
  snow DEC,
  snow_depth  DEC,
  windgust  DEC,
  windspeed DEC,
  cloudcover  DEC,
  visibility  DEC,
  uvindex DEC,
  severerisk  DEC,
  conditions  VARCHAR(300),
  icon  REFERENCES weather_icons,
)

CREATE TABLE weather_icons (
  icon  VARCHAR(100) PRIMARY KEY,
  icon_url  VARCHAR(300),
  description VARCHAR(100)
);

CREATE TABLE forecast_precipitation_types ()
  id  SERIAL PRIMARY KEY,
  preciptype  VARCHAR(200),
  forecast_id REFERENCES daily_forecast
);