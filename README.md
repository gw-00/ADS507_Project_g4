# ADS507_Project_g4
 This Github repository is for group 4 during Spring '25. 
 Members: Austin Mallie, Cynthia Portales-Loebell, and Graham Ward


## Overview
The goal of this project is to create a production ready Extraction, Transform, and Load (ETL) pipeline for USD's MS ADS Practical Data Engineering course. ADS507.

This pipeline extracts event and venue data from the Ticketmaster API for all events in San Diego in the next five (5) days. Additionally, this pipeline extracts hourly weather forecast information for San Diego, CA from Tomorrow.io for the next five (5) days.
As the data is extracted from the API's it is immediately loaded into the established Microsoft Azure MySQL database, with only minimal transformations to ensure a standardized time format, which will allow us to perform join operations on the weather and event tables. Once the data is loaded into the normalized tables, a SQL query is then performed where transformations, such as unit conversions are applied as the data leaves the databse. The final output is a automatic notification email that contains a formatted table with all of the events and associated weather forecasts for each event that is occurring within the next five (5) days. A batch file exists to aid in the automation of selecting the correct environment and executing the python notebook in its entirety. Microsoft Task Scheduler executes the batch file, which in turn processes the Jupyter Notebook, automating the entire pipeline at 12:01AM every Weekday.

## Features
- **Data Extraction:**
    -
    -

- **Data Loading:**
    -
    -
    -

- **Data Transformation:**
    -
    -
    -

- **Automation:**
    -
    - 

- **Output:**
    -
    -

## System Architecture

- **Data Sources:**
    - Discovery API (Ticketmaster): 
    - Tomorrow.io API (Weather):

- **Pipeline:**
    - Extraction:
    - Loading:
    - Transform: 

- **Output:**
    -
    -

- **Automation:**
    -


## Installation and Setup


## Program Execution


## MySQL Database Schema


## System Diagram


## License

## 