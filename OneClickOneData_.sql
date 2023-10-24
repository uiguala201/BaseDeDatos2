-- Empresa Zero-Security-360
CREATE DATABASE OneClickOneData;

-- Módulo Usuario que denota la separación de la información de las tarjetas de crédito
CREATE TABLE Usuarios (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    NombreUsuario VARCHAR(30) UNIQUE,
    Contrasena VARCHAR(255),
    Ciudad VARCHAR(50),
    Sexo ENUM('M', 'F', 'O'),
    EstadoCivil VARCHAR(20),
    TipoEmpresa ENUM('Publica', 'Privada'),
    TipoUsuario ENUM('Cliente', 'Administrador', 'Vendedor', 'Ejecutivo', 'Otro'),
    Direccion VARCHAR(100)
);

-- Se agrega un módulo adicional para guardar la información de las tarjetas separada de los datos de los clientes
CREATE TABLE TarjetasDeCredito (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NumeroTarjeta VARCHAR(16),
    FechaExpiracion DATE,
    Titular VARCHAR(100),
    CVV VARCHAR(3),
    TipoTarjeta ENUM('Debito', 'Credito'),
    UsuarioID INT,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(ID)
);

-- Módulo de Seguridad que también contempla Tipos de Pruebas
CREATE TABLE PruebasSeguridad (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Referencia VARCHAR(20),
    Nombre VARCHAR(50),
    Descripcion TEXT,
    FechaIngreso DATE,
    Estado ENUM('Activo', 'Desactivado'),
    UsuarioID INT,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(ID)
);

-- Módulo de Autenticación
CREATE TABLE ModuloAutenticacion (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NombreUsuario VARCHAR(30),
    Contrasena VARCHAR(255),
    AgenteUsuario VARCHAR(100),
    FechaLogin DATETIME,
    Token VARCHAR(50),
    FOREIGN KEY (NombreUsuario) REFERENCES Usuarios(NombreUsuario)
);

-- Módulo Pago
CREATE TABLE ModuloPago (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    IDUsuario INT,
    IDTarjeta INT,
    FOREIGN KEY (IDUsuario) REFERENCES Usuarios(ID),
    FOREIGN KEY (IDTarjeta) REFERENCES TarjetasDeCredito(ID)
);
