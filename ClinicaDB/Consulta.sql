CREATE TABLE TipoPerfil(
idTipoPerfil INT AUTO_INCREMENT PRIMARY KEY,
nomeTipoPerfil VARCHAR(50) NOT NULL
)




CREATE TABLE Cliente (
idCliente INT Auto_Increment Primary KEY,
idTipoPerfil INT,
NomeCliente VARCHAR(50) NOT NULL,
cpfCliente CHAR(11) NOT NULL,
DataNascCliente DATETIME NOT NULL,
SexoCliente VARCHAR(25) NOT NULL,
EstadoCivilCliente VARCHAR(20) NULL,
celularCliente char(11) NOT NULL,
cepCliente char(8) NOT NULL,
logradouroCliente VARCHAR(60) NOT NULL,
numeroLogradouro VARCHAR(7) NOT NULL,
complementoLoCliente VARCHAR(20) NULL,
CidadeCliente VARCHAR(25) NOT NULL,
ufCliente char(2) NOT NULL,
emailCliente VARCHAR(50) NOT NULL,
senhaCliente VARCHAR(40) NOT NULL,

CONSTRAINT UQ_CPFCliente UNIQUE (cpfCliente),
CONSTRAINT UQ_TelefoneCliente UNIQUE (celularCliente),
CONSTRAINT UQ_EmailCliente UNIQUE (emailCliente),
FOREIGN KEY (idTipoPerfil) REFERENCES TipoPerfil (idTipoPerfil) 
)


CREATE TABLE Ficha(
IdCliente INT PRIMARY KEY,
TratamentoEstetico VARCHAR(45) NOT NULL,
AntecedentesAlergicos VARCHAR(45) NOT NULL,
AlteracaoHormonal VARCHAR(45) NOT NULL,
AlimentacaoBalanceada VARCHAR(45) NOT NULL,
BebidaAlcoolica VARChAR(45) NOT NULL,
Fumante VARCHAR(45) NOT NULL,
MedicamentoContinuo VARCHAR(45) NOT NULL,
Gestante VARCHAR(45) NOT NULL,
ProblemaCardiaco VARCHAR(45) NOT NULL,
DoencaSignificativa VARCHAR(45) NOT NULL,
Observacao VARCHAR(255) NULL,
FOREIGN KEY (idCliente) REFERENCES cliente (idCliente)

)

CREATE TABLE Esteticista (
idEsteticista INT AUTO_INCREMENT PRIMARY KEY,
idTipoPerfil INT,
NomeEsteticista VARCHAR(50) NOT NULL,
cpfEsteticista CHAR(11) NOT NULL UNIQUE,
dataNascimento DATETIME NOT NULL,
SexoEsteticista VARCHAR(25) NOT NULL,
EstadoCivilEsteticista VARCHAR(25) NOT NULL,
CelularEsteticista CHAR(11) NOT NULL UNIQUE,
cepEsteticista CHAR(8) NOT NULL,
LogradouroEsteticista VARCHAR(60) NOT NULL,
NumeroLogradouro VARCHAR(7) NOT NULL,
ComplementoLogradouroEsteticista VARCHAR(60) NULL,
cidadeEsteticista VARCHAR(45) NOT NULL,
ufEsteticista CHAR(2) NOT NULL,
emailEsteticista VARCHAR(60) NOT NULL UNIQUE,
SenhaEsteticista Varchar(40) NOT NULL,

FOREIGN KEY (idTipoPerfil) REFERENCES TipoPerfil(idTipoPerfil) 
)


CREATE TABLE Historico (
idHistorico INT AUTO_INCREMENT PRIMARY KEY,
idCliente INT,
idEsteticista INT,
PesoHistórico DECIMAL NOT NULL,
AlturaHistórico DECIMAL NOT NULL,
BustoHistorico DECIMAL NOT NULL,
BracoDirHistorico DECIMAL NOT NULL,
BracoEsqHistorico DECIMAL NOT NULL,
EstomagoHistorico DECIMAL NOT NULL,
AbdomemHistorico DECIMAL NOT NULL,
CinturaHistorico DECIMAL NOT NULL,
QuadrilHistorico DECIMAL NOT NULL,
CuloteHistorico DECIMAL NOT NULL,
DataHistorico DATETIME NOT NULL,

FOREIGN KEY (idCliente) REFERENCES cliente (idCliente),
FOREIGN KEY (idEsteticista) REFERENCES Esteticista(idEsteticista)



)

CREATE TABLE AgendaEstetica (
idAgendaEstetica INT AUTO_INCREMENT PRIMARY KEY,
idEsteticista INT,
DiaAgendamento TINYINT NOT NULL,
horaAgendada DATETIME NOT NULL,
horaAgendaFinal DATETIME NOT NULL,

FOREIGN KEY (idesteticista) REFERENCES Esteticista(idEsteticista)



)


CREATE TABLE Procedimento (
idProcedimento INT AUTO_INCREMENT PRIMARY KEY,
nomeProcedimento VARCHAR(45) NOT NULL


)

CREATE TABLE ProcedimentoEsteticista(
IdProcedimento INT,
IdEsteticista INT,

PRIMARY KEY (idProcedimento, idEsteticista),
FOREIGN KEY (Idprocedimento) REFERENCES Procedimento(idProcedimento),
FOREIGN KEY (IdEsteticista) REFERENCES esteticista (idesteticista)



)


CREATE TABLE Agendamento (
idAgendamento INT AUTO_INCREMENT PRIMARY KEY,
idCliente INT,
idEsteticista INT,
idProcedimento INT,
DataAgendamento DATETIME NOT NULL,
SessaoAtual INT NOT NULL,
TotalSessoes INT NOT NULL,
ObservacoesAgendamento VARCHAR(255) NULL,

FOREIGN KEY (Idprocedimento) REFERENCES Procedimento(idProcedimento),
FOREIGN KEY (IdEsteticista) REFERENCES esteticista (idesteticista),
FOREIGN KEY (idCliente) REFERENCES cliente (idCliente)



)