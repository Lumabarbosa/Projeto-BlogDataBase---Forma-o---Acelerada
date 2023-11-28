CREATE DATABASE IF NOT EXISTS BlogDB;

USE BlogDB;

CREATE TABLE IF NOT EXISTS Autor (
`ID_Autor` INT AUTO_INCREMENT PRIMARY KEY,
`Nome_Autor` VARCHAR(50) NOT NULL,
`Email`VARCHAR(100) NOT NULL,
CONSTRAINT unique_Email UNIQUE (Email)
);

CREATE TABLE IF NOT EXISTS Post (
`ID_Post` INT AUTO_INCREMENT PRIMARY KEY,
`Título` VARCHAR(100) NOT NULL,
`Conteúdo` TEXT NOT NULL,
`Data_Publicação` DATE NOT NULL,
`Nome_Autor` VARCHAR(50),
`ID_Autor` INT,
FOREIGN KEY (ID_Autor) REFERENCES Autor(ID_Autor)
);
CREATE TABLE Comentário (
`ID_Comentario` INT AUTO_INCREMENT PRIMARY KEY,
`Texto_Comentario` TEXT NOT NULL,
`Data_Comentario`DATE NOT NULL,
`ID_Autor` INT,
`ID_Post` INT,
FOREIGN KEY (ID_Autor) REFERENCES Autor(ID_Autor),
FOREIGN KEY (ID_Post) REFERENCES Post(ID_Post)
);

SELECT * FROM Autor, Post;
SELECT * FROM Post;
SELECT * FROM Comentário;

INSERT INTO Autor(Nome_Autor, Email) VALUES ('John Atkins', 'john.atkins@email.com');
INSERT INTO Autor(Nome_Autor, Email) VALUES ('Ricardo Solomons', 'ricardo.solomons@email.com');

INSERT INTO Post(Título, Conteúdo, Data_Publicação, Nome_Autor, ID_Autor) VALUES (
'Princípios de Química', 'Química geral', '1979-01-01', 'John Atkins', ID_Autor
);
INSERT INTO Post(Título, Conteúdo, Data_Publicação, Nome_Autor, ID_Autor) VALUES (
'Fundamentos da Química Orgânica', 'Química orgânica', '1988-02-02', 'Ricardo Solomons', ID_Autor
);

INSERT INTO Comentário(Texto_Comentario, Data_Comentario, ID_Autor, ID_Post) VALUES (
'Lei de Lavoisier', '2022-04-04', ID_Autor, ID_Post
);
INSERT INTO Comentário(Texto_Comentario, Data_Comentario, ID_Autor, ID_Post) VALUES (
'Reações Orgânicas', '2023-05-05', ID_Autor, ID_Post
);


