USE ClinicaGrupo15
go

ALTER TABLE Pacientes
ADD Nacionalidad_Paciente varchar(50) DEFAULT 'Argentina' NOT NULL;
go

-- 1. Paraguay
UPDATE Pacientes
SET Nacionalidad_Paciente = 'Paraguaya'
WHERE DNI_Paciente = '22376102';

-- 2. Bolivia
UPDATE Pacientes
SET Nacionalidad_Paciente = 'Boliviana'
WHERE DNI_Paciente = '40812934';

-- 3. Uruguay
UPDATE Pacientes
SET Nacionalidad_Paciente = 'Uruguaya'
WHERE DNI_Paciente = '21008764';

-- 4. Chile
UPDATE Pacientes
SET Nacionalidad_Paciente = 'Chilena'
WHERE DNI_Paciente = '38912347';

-- 5. Perú
UPDATE Pacientes
SET Nacionalidad_Paciente = 'Peruana'
WHERE DNI_Paciente = '34590001';

-- 6. Venezuela
UPDATE Pacientes
SET Nacionalidad_Paciente = 'Venezolana'
WHERE DNI_Paciente = '42987110';

-- 7. Colombia
UPDATE Pacientes
SET Nacionalidad_Paciente = 'Colombiana'
WHERE DNI_Paciente = '43209871';

-- 8. Brasil
UPDATE Pacientes
SET Nacionalidad_Paciente = 'Brasileña'
WHERE DNI_Paciente = '40192875';