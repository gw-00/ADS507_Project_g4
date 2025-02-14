-- Use the `group4_project` database
USE group4_project;

-- Create the tables for the database
-- create the venues table round 1
CREATE TABLE IF NOT EXISTS venues (
    venue_id VARCHAR(255) NOT NULL,
    venue_name VARCHAR(255) NOT NULL,
    venue_city VARCHAR(255) NOT NULL,
    venue_state VARCHAR(255) NOT NULL,
    venue_zip VARCHAR(255) NOT NULL,
    venue_country VARCHAR(255) NOT NULL,
    venue_lat DECIMAL(10, 8) NOT NULL,
    venue_lon DECIMAL(11, 8) NOT NULL,
    PRIMARY KEY (venue_id)
);

-- create the events table round 1
CREATE TABLE IF NOT EXISTS events (
    event_id VARCHAR(255) NOT NULL,
    event_name VARCHAR(255) NOT NULL,
    event_date DATETIME NOT NULL,
    venue_id VARCHAR(255) NOT NULL,
    ticketmaster_url VARCHAR(512) DEFAULT NULL,
    PRIMARY KEY (event_id),
    CONSTRAINT fk_events_venues
        FOREIGN KEY (venue_id)
        REFERENCES venues(venue_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- create the weather_forecasts table round 1
CREATE TABLE IF NOT EXISTS weather_forecasts (
    forecast_id INT AUTO_INCREMENT,
    event_id VARCHAR(255) NOT NULL,
    forecast_date DATE NOT NULL,
    forecast_time TIME NOT NULL,
    forecast_temp DECIMAL(5, 2) DEFAULT NULL,
    forecast_humidity DECIMAL(5, 2) DEFAULT NULL,
    forecast_wind_speed DECIMAL(5, 2) DEFAULT NULL,
    forecast_precipitation DECIMAL(5, 2) DEFAULT NULL,
    forecast_weather_code INT DEFAULT NULL,
    PRIMARY KEY (forecast_id),
    CONSTRAINT fk_weather_forecasts_events
        FOREIGN KEY (event_id)
        REFERENCES events(event_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

------------------------------------------------------------------------------------------
--- Schema redesign for round 2
-- Venues table redesign
CREATE TABLE IF NOT EXISTS venues (
    venue_id VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    state VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    location VARCHAR(50) DEFAULT NULL,  -- Stores "latitude,longitude"
    PRIMARY KEY (venue_id)
);

-- Events table redesign
CREATE TABLE IF NOT EXISTS events (
    event_id VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    start_date DATETIME NOT NULL,
    venue_id VARCHAR(255) NOT NULL,
    ticketmaster_url VARCHAR(512) DEFAULT NULL,
    PRIMARY KEY (event_id),
    CONSTRAINT fk_events_venues
        FOREIGN KEY (venue_id)
        REFERENCES venues(venue_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Weather forecasts table redesign
CREATE TABLE IF NOT EXISTS weather_forecasts (
    forecast_id INT AUTO_INCREMENT PRIMARY KEY,
    forecast_time DATETIME NOT NULL,
    forecast_temperature DECIMAL(5,2) DEFAULT NULL,
    forecast_temp_apparent DECIMAL(5,2) DEFAULT NULL,
    forecast_humidity DECIMAL(5,2) DEFAULT NULL,
    rain_chance DECIMAL(5,2) DEFAULT NULL,
    forecast_winds DECIMAL(5,2) DEFAULT NULL,
    weather_code INT DEFAULT NULL,
    weather_icon TEXT DEFAULT NULL
);

SHOW TABLES;