use ClinicaGrupo15
go

ALTER TABLE Medicos
ADD Estado_Medico bit DEFAULT 1 NOT NULL;
GO