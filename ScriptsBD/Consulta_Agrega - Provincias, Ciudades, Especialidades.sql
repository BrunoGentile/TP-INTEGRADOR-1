USE ClinicaGrupo15
GO

INSERT INTO Provincias (CodProvincia, Desc_Provincia) VALUES
('BSAS', 'Buenos Aires'),
('CATA', 'Catamarca'),
('CHAC', 'Chaco'),
('CHUB', 'Chubut'),
('CORD', 'Córdoba'),
('CORR', 'Corrientes'),
('ENTR', 'Entre Ríos'),
('FORM', 'Formosa'),
('JUJU', 'Jujuy'),
('LAPA', 'La Pampa'),
('LARI', 'La Rioja'),
('MEND', 'Mendoza'),
('MISI', 'Misiones'),
('NEUQ', 'Neuquén'),
('RNGR', 'Río Negro'),
('SALT', 'Salta'),
('SJUA', 'San Juan'),
('SLUI', 'San Luis'),
('SANT', 'Santa Cruz'),
('SFE',  'Santa Fe'),
('SDEL', 'Santiago del Estero'),
('TDFU', 'Tierra del Fuego'),
('TUCU', 'Tucumán');
GO

INSERT INTO Ciudades(CodPostal_Ciudad, CodProvincia, Desc_Ciudad) VALUES
-- 1. Buenos Aires
('1625','BSAS','Escobar'),
('1900','BSAS','La Plata'),
('7600','BSAS','Mar del Plata'),
('8000','BSAS','Bahía Blanca'),
-- 2. Catamarca
('4700','CATA','San Fernando del Valle de Catamarca'),
('4711','CATA','Andalgalá'),
('4720','CATA','Tinogasta'),
-- 3. Chaco
('3500','CHAC','Resistencia'),
('3540','CHAC','Sáenz Peña'),
('3530','CHAC','Villa Ángela'),
-- 4. Chubut
('9000','CHUB','Comodoro Rivadavia'),
('9200','CHUB','Esquel'),
('9100','CHUB','Puerto Madryn'),
-- 5. Córdoba
('5000','CORD','Córdoba Capital'),
('5186','CORD','Río Cuarto'),
('5714','CORD','Villa María'),
-- 6. Corrientes
('3400','CORR','Corrientes'),
('3450','CORR','Goya'),
('3418','CORR','Paso de los Libres'),
-- 7. Entre Ríos
('3100','ENTR','Paraná'),
('3200','ENTR','Concordia'),
('3280','ENTR','Gualeguaychú'),
-- 8. Formosa
('3600','FORM','Formosa'),
('3620','FORM','Clorinda'),
('3612','FORM','Herradura'),
-- 9. Jujuy
('4600','JUJU','San Salvador de Jujuy'),
('4630','JUJU','Palpalá'),
('4624','JUJU','Perico'),
-- 10. La Pampa
('6300','LAPA','Santa Rosa'),
('6200','LAPA','General Pico'),
('6240','LAPA','Vicuña Mackenna'),
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
('3370','MISI','Oberá'),
('3360','MISI','Eldorado'),
-- 14. Neuquén
('8300','NEUQ','Neuquén Capital'),
('8342','NEUQ','Aluminé'),
('8320','NEUQ','Centenario'),
-- 15. Río Negro
('8400','RNGR','Viedma'),
('8500','RNGR','Bariloche'),
('8302','RNGR','Allen'),
-- 16. Salta
('4400','SALT','Salta'),
('4405','SALT','Cafayate'),
('4417','SALT','Orán'),
-- 17. San Juan
('5400','SJUA','San Juan'),
('5460','SJUA','Pocito'),
('5417','SJUA','Rawson'),
-- 18. San Luis
('5700','SLUI','San Luis'),
('5780','SLUI','Villa Mercedes'),
('5760','SLUI','Merlo'),
-- 19. Santa Cruz
('9400','SANT','Río Gallegos'),
('9410','SANT','Ushuaia'),
('9405','SANT','Caleta Olivia'),
-- 20. Santa Fe
('3000','SFE','Santa Fe'),
('2000','SFE','Rosario'),
('2300','SFE','Rafaela'),
-- 21. Santiago del Estero
('4200','SDEL','Santiago del Estero'),
('4300','SDEL','La Banda'),
('4230','SDEL','Termas de Río Hondo'),
-- 22. Tierra del Fuego
('9410','TDFU','Ushuaia'),
('9417','TDFU','Río Grande'),
('9418','TDFU','Tolhuin'),
-- 23. Tucuman
('4000','TUCU','San Miguel de Tucumán'),
('4107','TUCU','Tafí Viejo'),
('4162','TUCU','Concepción');
GO

INSERT INTO Especialidades (Cod_Especialidad, Especialidad, Desc_Espec) VALUES
('TRAUMA', 'Traumatología', 'Diagnóstico y tratamiento de lesiones óseas, musculares y articulares'),
('CLINIC', 'Clínica Médica', 'Atención integral de adultos, diagnóstico y tratamiento de enfermedades comunes'),
('PEDIAT', 'Pediatría', 'Atiende la salud y enfermedades de bebés, niños y adolescentes'),
('CARDIO', 'Cardiología', 'Estudia y trata las enfermedades del corazón y del sistema circulatorio'),
('DERMAT', 'Dermatología', 'Diagnóstico y tratamiento de afecciones de la piel, pelo y uñas'),
('NEUROL', 'Neurología', 'Trata enfermedades del sistema nervioso central y periférico'),
('PSIQUI', 'Psiquiatría', 'Diagnóstico y tratamiento de trastornos mentales y emocionales'),
('GINECO', 'Ginecología', 'Atención de la salud del aparato reproductor femenino'),
('OBSTET', 'Obstetricia', 'Control del embarazo, parto y postparto'),
('OFTALM', 'Oftalmología', 'Estudia y trata las enfermedades de los ojos y la visión'),
('OTORRI', 'Otorrinolaringología', 'Trata enfermedades de oído, nariz y garganta'),
('UROLOG', 'Urología', 'Enfermedades del sistema urinario y aparato reproductor masculino'),
('ENDOCR', 'Endocrinología', 'Trastornos hormonales y del sistema endocrino'),
('NEFROL', 'Nefrología', 'Estudia y trata enfermedades renales'),
('REUMA', 'Reumatología', 'Trata enfermedades articulares y autoinmunes como la artritis');
GO
