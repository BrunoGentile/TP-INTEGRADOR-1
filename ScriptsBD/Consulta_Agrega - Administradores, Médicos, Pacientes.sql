USE ClinicaGrupo15
GO

-- [+] ADMINISTRADORES

INSERT INTO Administradores (
    Legajo_Admin,
    Contraseña_Admin,
    Nombre_Admin,
    Apellido_Admin,
    Correo_Admin,
    Telefono_Admin
) VALUES
('ADM00001', 'admin1234', 'Lucía', 'Pérez', 'lucia.perez@clinica.com', '1134567890'),
('ADM00002', 'securepass', 'Javier', 'Gómez', 'javier.gomez@clinica.com', '1145678901'),
('ADM00003', 'clave2025', 'María', 'Fernández', 'maria.fernandez@clinica.com', '1156789012')

-- [+] PACIENTES PARTE 1

 INSERT INTO Pacientes (
    DNI_Paciente, Nombre_Paciente, Apellido_Paciente, Sexo_Paciente,
    FechaNacimiento_Paciente, Correo_Paciente, Telefono_Paciente,
    Direccion_Paciente, CodCiudad_Paciente, CodProvincia_Paciente, Estado_Paciente
) VALUES
('22339163', 'Xiomara', 'Leon', 'Masculino', '1965-04-21',
 'xiomara.leon@gmail.com', '+34 938 67 73 06', 'Pasaje Nydia Estevez 59 Piso 8 ',
 '3600', 'FORM', 1),

('41304915', 'Agustina', 'Casal', 'Femenino', '1982-10-19',
 'agustina.casal@gmail.com', '+34 912 649 190', 'Avenida de Flavia Romeu 7',
 '4711', 'CATA', 1),

('22376102', 'Iván', 'Valenzuela', 'Femenino', '2021-02-02',
 'iván.valenzuela@gmail.com', '+34923 789 276', 'Cuesta Buenaventura Hervia 10 Apt. 26 ',
 '3620', 'FORM', 1);

-- [+] PACIENTES PARTE 2

 INSERT INTO Pacientes (
    DNI_Paciente, Nombre_Paciente, Apellido_Paciente, Sexo_Paciente,
    FechaNacimiento_Paciente, Correo_Paciente, Telefono_Paciente,
    Direccion_Paciente, CodCiudad_Paciente, CodProvincia_Paciente, Estado_Paciente
) VALUES
('41607280', 'Martina', 'Ramírez', 'Femenino', '1977-12-30', 'martina.ramírez@gmail.com', '+34 911 446 238', 'Avenida Gregoria Claramunt 54', '9200', 'CHUB', 1),
('20228704', 'Sebastián', 'Reyes', 'Masculino', '1989-05-10', 'sebastián.reyes@gmail.com', '+34 938 123 456', 'Calle Agustín Rodenas 90', '1625', 'BSAS', 1),
('41129857', 'Luisina', 'Gaitán', 'Femenino', '2010-03-27', 'luisina.gaitán@gmail.com', '+34 912 987 123', 'Av. del Prado 120', '4700', 'CATA', 1),
('39870591', 'Benjamín', 'Acosta', 'Masculino', '1979-08-14', 'benjamín.acosta@gmail.com', '+34 954 789 000', 'Calle del Sol 33', '5186', 'CORD', 1),
('40812934', 'Micaela', 'Vega', 'Femenino', '1995-01-18', 'micaela.vega@gmail.com', '+34 983 888 111', 'Camino del Río 77', '3100', 'ENTR', 1),
('34590001', 'Franco', 'Moreno', 'Masculino', '1962-04-06', 'franco.moreno@gmail.com', '+34 965 112 334', 'Calle la Esperanza 5', '9100', 'CHUB', 1),
('21234780', 'Valentina', 'Silva', 'Femenino', '2004-07-20', 'valentina.silva@gmail.com', '+34 934 567 890', 'Pasaje Dorado 89', '3540', 'CHAC', 1),
('40287643', 'Santiago', 'Torres', 'Masculino', '1992-06-01', 'santiago.torres@gmail.com', '+34 964 234 987', 'Av. del Estudiante 13', '1900', 'BSAS', 1),
('42900398', 'Renata', 'Cruz', 'Femenino', '1998-09-30', 'renata.cruz@gmail.com', '+34 931 345 222', 'Bulevar Argentino 80', '5000', 'CORD', 1),
('38455678', 'Tomás', 'Ibarra', 'Masculino', '1973-02-15', 'tomás.ibarra@gmail.com', '+34 952 999 888', 'Pje. Libertad 3', '8000', 'BSAS', 1);

-- [+] PACIENTES PARTE 3

 INSERT INTO Pacientes (
    DNI_Paciente, Nombre_Paciente, Apellido_Paciente, Sexo_Paciente,
    FechaNacimiento_Paciente, Correo_Paciente, Telefono_Paciente,
    Direccion_Paciente, CodCiudad_Paciente, CodProvincia_Paciente, Estado_Paciente
) VALUES
('41987302', 'Candela', 'Figueroa', 'Femenino', '2001-11-12', 'candela.figueroa@gmail.com', '+34 933 111 222', 'Diagonal Sarmiento 101', '3418', 'CORR', 1),
('42987110', 'Bautista', 'Romero', 'Masculino', '1986-08-19', 'bautista.romero@gmail.com', '+34 977 223 112', 'Av. Leandro N. Alem 400', '4200', 'SDEL', 1),
('43123000', 'Julieta', 'Alvarez', 'Femenino', '1993-03-09', 'julieta.alvarez@gmail.com', '+34 932 765 432', 'Calle Mitre 78', '3200', 'ENTR', 1),
('40123077', 'Lucas', 'Ortiz', 'Masculino', '1997-10-28', 'lucas.ortiz@gmail.com', '+34 934 123 888', 'Av. Circunvalación 9', '5500', 'MEND', 1),
('42210988', 'Lola', 'Méndez', 'Femenino', '2002-01-06', 'lola.méndez@gmail.com', '+34 911 223 344', 'Av. Principal 64', '8300', 'NEUQ', 1),
('21456780', 'Juan', 'Paz', 'Masculino', '1981-06-11', 'juan.paz@gmail.com', '+34 934 444 555', 'Pasaje Maipú 45', '3280', 'ENTR', 1),
('40192875', 'Milagros', 'Herrera', 'Femenino', '1984-05-04', 'milagros.herrera@gmail.com', '+34 977 664 332', 'Calle Moreno 109', '9200', 'CHUB', 1),
('21008764', 'Delfina', 'Suárez', 'Femenino', '1999-12-31', 'delfina.suárez@gmail.com', '+34 955 233 111', 'Av. Libertador 1020', '4600', 'JUJU', 1),
('43456879', 'Thiago', 'Sosa', 'Masculino', '2006-08-22', 'thiago.sosa@gmail.com', '+34 911 888 777', 'Av. Caseros 4', '5500', 'MEND', 1),
('43209871', 'Brenda', 'Pereyra', 'Femenino', '1987-03-15', 'brenda.pereyra@gmail.com', '+34 964 123 123', 'Calle Tucumán 90', '3200', 'ENTR', 1);
 
-- [+] PACIENTES PARTE 4

 INSERT INTO Pacientes (
    DNI_Paciente, Nombre_Paciente, Apellido_Paciente, Sexo_Paciente,
    FechaNacimiento_Paciente, Correo_Paciente, Telefono_Paciente,
    Direccion_Paciente, CodCiudad_Paciente, CodProvincia_Paciente, Estado_Paciente
) VALUES
('37981212', 'Jazmín', 'Lucero', 'Femenino', '1996-09-10', 'jazmín.lucero@gmail.com', '+34 911 223 345', 'Bvard. España 27', '4600', 'JUJU', 1),
('41098765', 'Gonzalo', 'Medina', 'Masculino', '1991-04-19', 'gonzalo.medina@gmail.com', '+34 933 888 222', 'Av. Belgrano 567', '5186', 'CORD', 1),
('40897653', 'Camila', 'Bravo', 'Femenino', '1983-07-23', 'camila.bravo@gmail.com', '+34 999 555 444', 'Calle Laprida 88', '3300', 'MISI', 1),
('38912347', 'Axel', 'Rivera', 'Masculino', '1975-02-07', 'axel.rivera@gmail.com', '+34 911 345 777', 'Av. Entre Ríos 1', '3450', 'CORR', 1),
('42786315', 'Mora', 'Cabral', 'Femenino', '2000-12-02', 'mora.cabral@gmail.com', '+34 912 444 111', 'Calle Pellegrini 210', '3450', 'CORR', 1),
('40567890', 'Felipe', 'Aranda', 'Masculino', '1990-10-25', 'felipe.aranda@gmail.com', '+34 934 789 000', 'Ruta 9 KM 22', '3500', 'CHAC', 1),
('43345678', 'Malena', 'López', 'Femenino', '1985-11-17', 'malena.lópez@gmail.com', '+34 911 999 333', 'Camino a la Costa 30', '4711', 'CATA', 1);

-- [+] MÉDICOS PARTE 1

INSERT INTO Medicos (
    Legajo_Medico, DNI_Medico, Nombre_Medico, Apellido_Medico, Sexo_Medico,
    CodEspecialidad_Medico, Nacionalidad_Medico, FechaNacimiento_Medico,
    Direccion_Medico, Ciudad_Medico, Provincia_Medico, Telefono_Medico,
    Correo_Medico, DiasAtencion_Medico, HorarioInicio_Medico, HorarioFin_Medico, Contraseña_Medico
) VALUES
('MED00001', '21172390', 'Arcelia', 'Roselló', 'Femenino', 'UROLOG', 'Argentina',
 '1994-11-12', 'Camino Azucena Castillo 24', 'Alicante', 'Río Negro', '+34725858600',
 'arcelia.rosello@clinica.com', 'Miércoles, Viernes, Jueves', '08:00:00', '14:00:00', '_xs3)ZuR2&'),

('MED00002', '44833071', 'Heriberto', 'Ramírez', 'Masculino', 'CLINIC', 'Argentina',
 '1984-01-12', 'Acceso Candelario Segovia 55', 'Córdoba', 'Santiago del Estero', '+34988349673',
 'heriberto.ramirez@clinica.com', 'Martes, Jueves, Miércoles, Lunes, Viernes', '09:00:00', '15:00:00', 'v&H^01Zl2F'),

('MED00003', '23144565', 'Yolanda', 'Echeverría', 'Femenino', 'OFTALM', 'Argentina',
 '1984-09-19', 'Cuesta de África Iniesta 87', 'Jaén', 'Santa Fe', '+34600976574',
 'yolanda.echeverria@clinica.com', 'Lunes, Miércoles, Jueves', '07:00:00', '13:00:00', 'xX&9ZpBgds'),

('MED00004', '37581234', 'Martina', 'Sáez', 'Femenino', 'TRAUMA', 'Argentina',
 '1975-05-30', 'Paseo Pedro Soria 10', 'Buenos Aires', 'Buenos Aires', '1133345566',
 'martina.saez@clinica.com', 'Lunes, Miércoles, Viernes', '08:00:00', '14:00:00', 'med123secure'),

('MED00005', '40871235', 'Luciano', 'Paredes', 'Masculino', 'PEDIAT', 'Argentina',
 '1980-03-18', 'Calle Solís 42', 'Rosario', 'Santa Fe', '1144456677',
 'luciano.paredes@clinica.com', 'Martes, Jueves', '10:00:00', '16:00:00', 'pediatra88'),

('MED00006', '22981245', 'Tamara', 'Vega', 'Femenino', 'CARDIO', 'Argentina',
 '1985-08-22', 'Calle Santa Fe 120', 'Salta', 'Salta', '3874567890',
 'tamara.vega@clinica.com', 'Lunes, Jueves, Viernes', '07:00:00', '13:00:00', 'corazon2025'),

('MED00007', '32145678', 'Gastón', 'Medina', 'Masculino', 'NEUROL', 'Argentina',
 '1978-02-14', 'Av. Belgrano 890', 'San Miguel de Tucumán', 'Tucumán', '3811234567',
 'gaston.medina@clinica.com', 'Lunes, Martes, Jueves', '09:00:00', '15:00:00', 'neuro@safe'),

('MED00008', '33891234', 'Carolina', 'Martínez', 'Femenino', 'DERMAT', 'Argentina',
 '1990-06-11', 'Calle Italia 33', 'Godoy Cruz', 'Mendoza', '2618889999',
 'carolina.martinez@clinica.com', 'Martes, Miércoles', '08:30:00', '14:30:00', 'piel_sana1'),

('MED00009', '30457896', 'Ramiro', 'Quiroga', 'Masculino', 'REUMA', 'Argentina',
 '1976-10-09', 'Calle Mendoza 90', 'Neuquén', 'Neuquén', '2995556789',
 'ramiro.quiroga@clinica.com', 'Miércoles, Viernes', '07:00:00', '13:00:00', 'artritis88'),

('MED00010', '41894512', 'Silvina', 'Ruiz', 'Femenino', 'GINECO', 'Argentina',
 '1982-12-05', 'Av. Mitre 450', 'Posadas', 'Misiones', '3761234567',
 'silvina.ruiz@clinica.com', 'Lunes, Martes, Jueves', '10:00:00', '16:00:00', 'gine2024');

-- [+] MÉDICOS PARTE 2

INSERT INTO Medicos (
    Legajo_Medico, DNI_Medico, Nombre_Medico, Apellido_Medico, Sexo_Medico,
    CodEspecialidad_Medico, Nacionalidad_Medico, FechaNacimiento_Medico,
    Direccion_Medico, Ciudad_Medico, Provincia_Medico, Telefono_Medico,
    Correo_Medico, DiasAtencion_Medico, HorarioInicio_Medico, HorarioFin_Medico, Contraseña_Medico
) VALUES
('MED00011', '36789012', 'Federico', 'Benítez', 'Masculino', 'PSIQUI', 'Argentina',
 '1983-11-20', 'Calle Rivadavia 210', 'San Fernando del Valle de Catamarca', 'Catamarca', '3834123456',
 'federico.benitez@clinica.com', 'Martes, Miércoles, Jueves', '08:00:00', '14:00:00', 'menteSegura1'),

('MED00012', '42987654', 'Ailén', 'Toledo', 'Femenino', 'OBSTET', 'Argentina',
 '1979-07-08', 'Pje. Dorrego 17', 'La Rioja', 'La Rioja', '3804456677',
 'ailen.toledo@clinica.com', 'Lunes, Miércoles, Viernes', '09:00:00', '15:00:00', 'partoOk2024'),

('MED00013', '33441234', 'Santiago', 'Molina', 'Masculino', 'OTORRI', 'Argentina',
 '1986-01-19', 'Av. Libertador 900', 'Santa Rosa', 'La Pampa', '2954557890',
 'santiago.molina@clinica.com', 'Martes, Jueves', '08:30:00', '14:30:00', 'auditivo!77'),

('MED00014', '41237890', 'Valeria', 'Domínguez', 'Femenino', 'NEFROL', 'Argentina',
 '1977-04-23', 'Calle 25 de Mayo 400', 'Rawson', 'San Juan', '2644567890',
 'valeria.dominguez@clinica.com', 'Lunes, Martes, Jueves', '07:00:00', '13:00:00', 'riñon2024'),

('MED00015', '29876543', 'Bruno', 'Navarro', 'Masculino', 'ENDOCR', 'Argentina',
 '1988-03-01', 'Av. Perón 123', 'Villa Mercedes', 'San Luis', '2657423698',
 'bruno.navarro@clinica.com', 'Miércoles, Jueves, Viernes', '09:00:00', '15:00:00', 'hormonas9'),

('MED00016', '34567891', 'Lorena', 'Aragón', 'Femenino', 'TRAUMA', 'Argentina',
 '1985-06-16', 'Ruta 3 KM 8', 'Río Grande', 'Tierra del Fuego', '2964423344',
 'lorena.aragon@clinica.com', 'Lunes, Miércoles, Viernes', '08:00:00', '14:00:00', 'huesosOK12'),

('MED00017', '42908123', 'Nicolás', 'Gutiérrez', 'Masculino', 'CARDIO', 'Argentina',
 '1976-09-29', 'Av. Colón 60', 'San Salvador de Jujuy', 'Jujuy', '3884556677',
 'nicolas.gutierrez@clinica.com', 'Martes, Jueves', '07:00:00', '13:00:00', 'cardioFuerte'),

('MED00018', '31887654', 'Emilia', 'Sánchez', 'Femenino', 'CLINIC', 'Argentina',
 '1981-10-14', 'Calle Moreno 77', 'Corrientes', 'Corrientes', '3794567890',
 'emilia.sanchez@clinica.com', 'Lunes, Miércoles', '09:00:00', '15:00:00', 'clinica22'),

('MED00019', '40127856', 'Mateo', 'Caballero', 'Masculino', 'DERMAT', 'Argentina',
 '1990-02-03', 'Calle Sarmiento 12', 'Formosa', 'Formosa', '3704123456',
 'mateo.caballero@clinica.com', 'Martes, Jueves, Viernes', '08:30:00', '14:30:00', 'pielOk123'),

('MED00020', '38906781', 'Florencia', 'Aguilar', 'Femenino', 'PEDIAT', 'Argentina',
 '1987-08-27', 'Calle Belgrano 101', 'Resistencia', 'Chaco', '3624123456',
 'florencia.aguilar@clinica.com', 'Lunes, Miércoles, Jueves', '10:00:00', '16:00:00', 'peques2024');
