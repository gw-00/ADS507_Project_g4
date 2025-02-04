-- Use the `group4_project` database
USE group4_project;

-- Create the tables for the database
-- create the venues table
CREATE TABLE IF NOT EXISTS venues (
    venue_id VARCHAR(255) NOT NULL,
    venue_name VARCHAR(255) NOT NULL,
    venue_address VARCHAR(255) NOT NULL,
    venue_city VARCHAR(255) NOT NULL,
    venue_state VARCHAR(255) NOT NULL,
    venue_zip VARCHAR(255) NOT NULL,
    venue_country VARCHAR(255) NOT NULL,
    venue_lat DECIMAL(10, 8) NOT NULL,
    venue_lon DECIMAL(11, 8) NOT NULL,
    PRIMARY KEY (venue_id)
);

-- create the events table
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

-- create the weather_forecasts table
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