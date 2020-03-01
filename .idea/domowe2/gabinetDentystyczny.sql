CREATE DATABASE dentist_office;
USE dentist_office;


CREATE TABLE IF NOT EXISTS patient (
    id INT NOT NULL,
    first_name VARCHAR(128) NOT NULL,
    last_name VARCHAR(128) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS dentist (
    id INT NOT NULL,
    first_name VARCHAR(128) NOT NULL,
    last_name VARCHAR(128) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS visit (
	patient_id INT,
    dentist_id INT,
    FOREIGN KEY (patient_id) REFERENCES patient(id),
    FOREIGN KEY (dentist_id) REFERENCES dentist(id)
);

INSERT INTO patient VALUES (1, 'Damian', 'Skupski');
INSERT INTO patient VALUES (2, 'Jarosław', 'Kaczyński');

INSERT INTO dentist VALUES (1, 'Lekarz', 'Pierwszy');
INSERT INTO dentist VALUES (2, 'Lekarzyk', 'Drugi');

INSERT INTO visit VALUES (1, 1);
INSERT INTO visit VALUES (1, 2);
INSERT INTO visit VALUES (2, 1);


SELECT dentist.*, visit.*, patient.*
FROM patient
JOIN dentist
JOIN visit on visit.patient_id = patient.id
AND visit.dentist_id = dentist.id;






