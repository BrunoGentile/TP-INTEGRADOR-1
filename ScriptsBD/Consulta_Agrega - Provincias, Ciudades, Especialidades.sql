USE ClinicaGrupo15
GO

INSERT INTO Provincias (CodProvincia, Desc_Provincia) VALUES
('BSAS', 'Buenos Aires'),
('CATA', 'Catamarca'),
('CHAC', 'Chaco'),
('CHUB', 'Chubut'),
('CORD', 'C�rdoba'),
('CORR', 'Corrientes'),
('ENTR', 'Entre R�os'),
('FORM', 'Formosa'),
('JUJU', 'Jujuy'),
('LAPA', 'La Pampa'),
('LARI', 'La Rioja'),
('MEND', 'Mendoza'),
('MISI', 'Misiones'),
('NEUQ', 'Neuqu�n'),
('RNGR', 'R�o Negro'),
('SALT', 'Salta'),
('SJUA', 'San Juan'),
('SLUI', 'San Luis'),
('SANT', 'Santa Cruz'),
('SFE',  'Santa Fe'),
('SDEL', 'Santiago del Estero'),
('TDFU', 'Tierra del Fuego'),
('TUCU', 'Tucum�n');
GO

INSERT INTO Ciudades(CodPostal_Ciudad, CodProvincia, Desc_Ciudad) VALUES
-- 1. Buenos Aires
('1625','BSAS','Escobar'),
('1900','BSAS','La Plata'),
('7600','BSAS','Mar del Plata'),
('8000','BSAS','Bah�a Blanca'),
-- 2. Catamarca
('4700','CATA','San Fernando del Valle de Catamarca'),
('4711','CATA','Andalgal�'),
('4720','CATA','Tinogasta'),
-- 3. Chaco
('3500','CHAC','Resistencia'),
('3540','CHAC','S�enz Pe�a'),
('3530','CHAC','Villa �ngela'),
-- 4. Chubut
('9000','CHUB','Comodoro Rivadavia'),
('9200','CHUB','Esquel'),
('9100','CHUB','Puerto Madryn'),
-- 5. C�rdoba
('5000','CORD','C�rdoba Capital'),
('5186','CORD','R�o Cuarto'),
('5714','CORD','Villa Mar�a'),
-- 6. Corrientes
('3400','CORR','Corrientes'),
('3450','CORR','Goya'),
('3418','CORR','Paso de los Libres'),
-- 7. Entre R�os
('3100','ENTR','Paran�'),
('3200','ENTR','Concordia'),
('3280','ENTR','Gualeguaych�'),
-- 8. Formosa
('3600','FORM','Formosa'),
('3620','FORM','Clorinda'),
('3612','FORM','Herradura'),
-- 9. Jujuy
('4600','JUJU','San Salvador de Jujuy'),
('4630','JUJU','Palpal�'),
('4624','JUJU','Perico'),
-- 10. La Pampa
('6300','LAPA','Santa Rosa'),
('6200','LAPA','General Pico'),
('6240','LAPA','Vicu�a Mackenna'),
-- 11. La Rioja
('5300','LARI','La Rioja'),
('5320','LARI','Chilecito'),
('5430','LARI','Aimogasta'),
-- 12. Mendoza
('5500','MEND','Mendoza Capital'),
('5600','MEND','San Rafael'),
('5580','MEND','Godoy Cruz'),
-- 13. Misiones
('3300','MISI','Posadas'),
('3370','MISI','Ober�'),
('3360','MISI','Eldorado'),
-- 14. Neuqu�n
('8300','NEUQ','Neuqu�n Capital'),
('8342','NEUQ','Alumin�'),
('8320','NEUQ','Centenario'),
-- 15. R�o Negro
('8400','RNGR','Viedma'),
('8500','RNGR','Bariloche'),
('8302','RNGR','Allen'),
-- 16. Salta
('4400','SALT','Salta'),
('4405','SALT','Cafayate'),
('4417','SALT','Or�n'),
-- 17. San Juan
('5400','SJUA','San Juan'),
('5460','SJUA','Pocito'),
('5417','SJUA','Rawson'),
-- 18. San Luis
('5700','SLUI','San Luis'),
('5780','SLUI','Villa Mercedes'),
('5760','SLUI','Merlo'),
-- 19. Santa Cruz
('9400','SANT','R�o Gallegos'),
('9410','SANT','Ushuaia'),
('9405','SANT','Caleta Olivia'),
-- 20. Santa Fe
('3000','SFE','Santa Fe'),
('2000','SFE','Rosario'),
('2300','SFE','Rafaela'),
-- 21. Santiago del Estero
('4200','SDEL','Santiago del Estero'),
('4300','SDEL','La Banda'),
('4230','SDEL','Termas de R�o Hondo'),
-- 22. Tierra del Fuego
('9410','TDFU','Ushuaia'),
('9417','TDFU','R�o Grande'),
('9418','TDFU','Tolhuin'),
-- 23. Tucuman
('4000','TUCU','San Miguel de Tucum�n'),
('4107','TUCU','Taf� Viejo'),
('4162','TUCU','Concepci�n');
GO

INSERT INTO Especialidades (Cod_Especialidad, Especialidad, Desc_Espec) VALUES
('TRAUMA', 'Traumatolog�a', 'Diagn�stico y tratamiento de lesiones �seas, musculares y articulares'),
('CLINIC', 'Cl�nica M�dica', 'Atenci�n integral de adultos, diagn�stico y tratamiento de enfermedades comunes'),
('PEDIAT', 'Pediatr�a', 'Atiende la salud y enfermedades de beb�s, ni�os y adolescentes'),
('CARDIO', 'Cardiolog�a', 'Estudia y trata las enfermedades del coraz�n y del sistema circulatorio'),
('DERMAT', 'Dermatolog�a', 'Diagn�stico y tratamiento de afecciones de la piel, pelo y u�as'),
('NEUROL', 'Neurolog�a', 'Trata enfermedades del sistema nervioso central y perif�rico'),
('PSIQUI', 'Psiquiatr�a', 'Diagn�stico y tratamiento de trastornos mentales y emocionales'),
('GINECO', 'Ginecolog�a', 'Atenci�n de la salud del aparato reproductor femenino'),
('OBSTET', 'Obstetricia', 'Control del embarazo, parto y postparto'),
('OFTALM', 'Oftalmolog�a', 'Estudia y trata las enfermedades de los ojos y la visi�n'),
('OTORRI', 'Otorrinolaringolog�a', 'Trata enfermedades de o�do, nariz y garganta'),
('UROLOG', 'Urolog�a', 'Enfermedades del sistema urinario y aparato reproductor masculino'),
('ENDOCR', 'Endocrinolog�a', 'Trastornos hormonales y del sistema endocrino'),
('NEFROL', 'Nefrolog�a', 'Estudia y trata enfermedades renales'),
('REUMA', 'Reumatolog�a', 'Trata enfermedades articulares y autoinmunes como la artritis');
GO
