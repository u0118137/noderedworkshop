CREATE DATABASE IF NOT EXISTS sensors;
USE sensors;
CREATE TABLE TemperatureHumidity (
    id int AUTO_INCREMENT,
    time datetime,
    deviceId varchar(20),
    temperature1 float,
    temperature2 float,
    humidity float,
    PRIMARY KEY (id)
);