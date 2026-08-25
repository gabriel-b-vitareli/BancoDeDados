-- CREATE TABLE filmes(
--     id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
--     nome VARCHAR(100) NOT NULL,
--     duracao INT NOT NULL DEFAULT 0,
--     avaliacao NUMERIC(2, 1) NOT NULL DEFAULT 0
-- );

SELECT * FROM filmes;

-- INSERT INTO filmes(nome, duracao, avaliacao) VALUES 
-- ('A Origem', 148, 4.4),
-- ('Interestelar', 169, 4.3),
-- ('Blade Runner 2049', 164, 4.2),
-- ('Parasita', 132, 4.2),
-- ('Django Livre', 165, 4.2),
-- ('Whiplash: Em busca da perfeição', 106, 4.2),
-- ('O Lobo de Wall Street', 180, 4.1),
-- ('Toy Story 3', 103, 4.1),
-- ('Mad Max: Estrada da Fúria', 120, 4.0),
-- ('Star Wars: Episódio III – A Vingança dos Sith', 140, 4.0),
-- ('Blade Runner - O Caçador de Androides', 117, 4.0),
-- ('12 Anos de Escravidão', 134, 4.0),
-- ('O Regresso', 156, 3.9),
-- ('A Rede Social', 120, 3.9),
-- ('La La Land', 128, 3.9),
-- ('Arrival', 116, 3.9),
-- ('O Irlandês', 209, 3.9),
-- ('Guerra dos Mundos (2005)', 116, 3.5),
-- ('O Mandaloriano e Grogu', 132, 3.5),
-- ('Guerra dos Mundos (2025)', 90, 0.5);

-- UPDATE filmes
-- SET avaliacao = 5.0
-- WHERE id = 3;

-- UPDATE filmes
-- SET avaliacao = 0.0
-- WHERE id = 20;

-- UPDATE filmes
-- SET avaliacao = 4.2
-- WHERE id = 15;

-- UPDATE filmes
-- SET nome = 'Blade Runner (1985)'
-- where id = 11;

-- UPDATE filmes
-- SET duracao = 141
-- WHERE id = 10;

-- SELECT * FROM filmes ORDER BY avaliacao;

-- DELETE FROM filmes WHERE id = 20;
-- DELETE FROM filmes WHERE id = 19;
-- DELETE FROM filmes WHERE id = 18;
-- DELETE FROM filmes WHERE id = 13;
-- DELETE FROM filmes WHERE id = 17;