# Aula 06 — Loja "Cyberstore" 🛒

Anotações sobre criação de tabela, inserção de dados e funções de agregação em SQL (PostgreSQL).

---

## 📑 Índice

1. [Criando a Tabela](#-criando-a-tabela)
2. [Inserindo os Itens](#-inserindo-os-itens)
3. [Contagem de Registros](#-contagem-de-registros)
4. [Valores Máximo, Mínimo e Média](#-valores-máximo-mínimo-e-média)
5. [Resumo Estatístico Completo](#-resumo-estatístico-completo)
6. [Média por Categoria](#-média-por-categoria)
7. [Cálculo de Faturamento](#-cálculo-de-faturamento)

---

## 🏗️ Criando a Tabela

Estrutura da tabela `produtos`, com id autoincrementável, nome, categoria, marca, preço, estoque e data de cadastro:

```sql
CREATE TABLE produtos(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    preco NUMERIC(10,2) NOT NULL,
    estoque INT NOT NULL,
    data_cadastro DATE NOT NULL
);
```

> 💡 **Observação:** `SERIAL PRIMARY KEY` cria automaticamente um identificador único e incremental para cada produto.

---

## 📦 Inserindo os Itens

Inserção de 100 produtos distribuídos em diversas categorias (Notebooks, Periféricos, Monitores, Armazenamento, Redes, Componentes, Impressoras, Áudio, Cabos e Adaptadores, Smartphones):

```sql
INSERT INTO produtos (nome, categoria, marca, preco, estoque, data_cadastro) VALUES
('Notebook Gamer RTX 4060',        'Notebooks', 'Acer',        7990.00,  3, '2025-02-10'),
('Notebook Ultrafino 14',          'Notebooks', 'Dell',        5300.00,  6, '2025-03-04'),
('Notebook Intermediario 16GB',    'Notebooks', 'Lenovo',      4500.00,  9, '2024-11-18'),
('Notebook Basico 8GB',            'Notebooks', 'Positivo',    2890.00, 14, '2024-08-22'),
('Chromebook 11',                  'Notebooks', 'Samsung',     1790.00, 17, '2024-09-15'),
('Notebook Workstation 32GB',      'Notebooks', 'Dell',       11400.00,  2, '2025-06-01'),
('Notebook 2 em 1 Touch',          'Notebooks', 'Lenovo',      4290.00,  7, '2025-01-27'),
('Notebook Gamer 17 Polegadas',    'Notebooks', 'Asus',        9350.00,  4, '2025-05-12'),
('Notebook Empresarial i5',        'Notebooks', 'HP',          3990.00, 11, '2024-12-09'),
('Netbook 4GB',                    'Notebooks', 'Multilaser',  1290.00, 21, '2024-07-30'),
('Mouse Optico USB',               'Perifericos', 'Multilaser',  39.90, 120, '2024-06-11'),
('Mouse Gamer 7 Botoes',           'Perifericos', 'Redragon',   189.90,  45, '2025-01-14'),
('Teclado ABNT2 USB',              'Perifericos', 'Logitech',    79.90,  60, '2024-06-11'),
('Teclado Mecanico RGB',           'Perifericos', 'Redragon',   349.90,  18, '2025-04-02'),
('Mousepad Gamer XL',              'Perifericos', 'Havit',       59.90,  80, '2025-02-19'),
('Webcam Full HD 1080p',           'Perifericos', 'Logitech',   229.90,  25, '2024-10-05'),
('Headset Gamer 7.1',              'Perifericos', 'HyperX',     299.90,  22, '2025-03-21'),
('Mouse Sem Fio Silencioso',       'Perifericos', 'Logitech',    89.90,  55, '2025-05-08'),
('Teclado Sem Fio Slim',           'Perifericos', 'Microsoft',  159.90,  30, '2024-09-27'),
('Kit Teclado e Mouse Sem Fio',    'Perifericos', 'Logitech',   199.90,  27, '2025-06-16'),
('Monitor 21.5 LED',               'Monitores', 'AOC',      649.00, 16, '2024-08-03'),
('Monitor 24 IPS 75Hz',            'Monitores', 'LG',       899.00, 12, '2024-11-11'),
('Monitor Gamer 27 165Hz',         'Monitores', 'AOC',     1899.00,  5, '2025-02-25'),
('Monitor Ultrawide 29',           'Monitores', 'LG',      2290.00,  4, '2025-04-17'),
('Monitor 4K 32',                  'Monitores', 'Samsung', 3490.00,  2, '2025-05-29'),
('Monitor 19 HD',                  'Monitores', 'AOC',      499.00, 20, '2024-05-20'),
('Monitor Curvo 27',               'Monitores', 'Samsung', 1690.00,  6, '2025-01-08'),
('Monitor Portatil 15.6',          'Monitores', 'Asus',    1150.00,  8, '2025-03-13'),
('Suporte Articulado para Monitor','Monitores', 'ELG',      249.90, 19, '2024-10-22'),
('Monitor Profissional 27 QHD',    'Monitores', 'Dell',    2790.00,  3, '2025-06-05'),
('SSD 480GB SATA',                 'Armazenamento', 'Kingston',  249.90,  40, '2024-07-09'),
('SSD 1TB NVMe',                   'Armazenamento', 'Kingston',  549.90,  22, '2025-01-30'),
('SSD 2TB NVMe',                   'Armazenamento', 'Samsung',  1199.00,   7, '2025-04-24'),
('HD Interno 1TB',                 'Armazenamento', 'Seagate',   289.90,  30, '2024-09-02'),
('HD Externo 2TB',                 'Armazenamento', 'Seagate',   549.00,  14, '2024-12-18'),
('Pen Drive 64GB',                 'Armazenamento', 'SanDisk',    49.90, 150, '2024-04-15'),
('Pen Drive 128GB',                'Armazenamento', 'SanDisk',    89.90,  90, '2024-04-15'),
('Cartao MicroSD 128GB',           'Armazenamento', 'SanDisk',    99.90,  70, '2025-02-06'),
('Case para HD 2.5',               'Armazenamento', 'Vinik',      69.90,  35, '2024-11-26'),
('SSD 240GB SATA',                 'Armazenamento', 'Adata',     159.90,  48, '2024-06-28'),
('Roteador Wi-Fi 5 Dual Band',     'Redes', 'TP-Link',   249.90,  26, '2024-08-14'),
('Roteador Wi-Fi 6 AX1500',        'Redes', 'TP-Link',   449.90,  13, '2025-03-07'),
('Switch 8 Portas Gigabit',        'Redes', 'TP-Link',   189.90,  18, '2024-10-30'),
('Adaptador USB Wi-Fi',            'Redes', 'TP-Link',    79.90,  44, '2024-05-06'),
('Repetidor de Sinal Wi-Fi',       'Redes', 'Intelbras', 129.90,  33, '2025-01-21'),
('Cabo de Rede Cat6 5m',           'Redes', 'Vinik',      34.90, 100, '2024-03-19'),
('Access Point Corporativo',       'Redes', 'Ubiquiti',  699.00,   6, '2025-05-20'),
('Roteador Mesh 2 Unidades',       'Redes', 'Intelbras', 899.00,   5, '2025-04-09'),
('Placa de Rede PCIe Gigabit',     'Redes', 'TP-Link',    89.90,  25, '2024-12-03'),
('Patch Panel 24 Portas',          'Redes', 'Furukawa',  389.00,   4, '2025-06-11'),
('Placa de Video RTX 4060 8GB',    'Componentes', 'Gigabyte',  2599.00,  4, '2025-02-13'),
('Processador Ryzen 5 5600',       'Componentes', 'AMD',        899.00, 10, '2024-11-05'),
('Processador Intel Core i5-12400F','Componentes','Intel',     1049.00,  8, '2024-11-05'),
('Memoria RAM 8GB DDR4',           'Componentes', 'Kingston',   179.90, 40, '2024-07-17'),
('Memoria RAM 16GB DDR4',          'Componentes', 'Kingston',   329.90, 24, '2024-07-17'),
('Placa-Mae B550M',                'Componentes', 'Gigabyte',   749.00,  9, '2025-01-16'),
('Fonte 650W 80 Plus Bronze',      'Componentes', 'Corsair',    429.90, 15, '2025-03-28'),
('Gabinete Gamer com 3 Fans',      'Componentes', 'Redragon',   349.00, 12, '2025-05-02'),
('Cooler para Processador',        'Componentes', 'DeepCool',   129.90, 28, '2024-09-19'),
('Pasta Termica 4g',               'Componentes', 'Implastec',   29.90, 95, '2024-04-08'),
('Multifuncional Tanque de Tinta', 'Impressoras', 'Epson',   1199.00,   9, '2024-10-14'),
('Impressora Laser Mono',          'Impressoras', 'Brother', 1590.00,   6, '2025-02-27'),
('Impressora Termica de Etiquetas','Impressoras', 'Elgin',    899.00,   5, '2025-04-30'),
('Scanner de Mesa A4',             'Impressoras', 'Epson',   1290.00,   3, '2025-06-19'),
('Cartucho de Tinta Preto',        'Impressoras', 'HP',        89.90,  60, '2024-06-04'),
('Toner Laser Preto',              'Impressoras', 'Brother',  249.90,  22, '2024-12-12'),
('Refil de Tinta 70ml',            'Impressoras', 'Epson',     49.90,  85, '2024-06-04'),
('Papel A4 500 Folhas',            'Impressoras', 'Report',    27.90, 130, '2024-03-25'),
('Multifuncional Wi-Fi',           'Impressoras', 'HP',       949.00,  11, '2025-01-09'),
('Impressora 3D FDM',              'Impressoras', 'Creality', 2790.00,  2, '2025-05-26'),
('Caixa de Som Bluetooth 10W',     'Audio', 'JBL',        199.90, 35, '2024-08-27'),
('Fone de Ouvido Intra-auricular', 'Audio', 'Philips',     59.90, 90, '2024-05-13'),
('Fone Bluetooth TWS',             'Audio', 'JBL',        249.90, 40, '2025-02-03'),
('Headset Office com Microfone',   'Audio', 'Logitech',   149.90, 30, '2024-11-20'),
('Microfone Condensador USB',      'Audio', 'Fifine',     449.90, 12, '2025-03-18'),
('Interface de Audio 2 Canais',    'Audio', 'Focusrite', 1290.00,  3, '2025-06-23'),
('Caixa de Som para PC 2.0',       'Audio', 'Multilaser',  89.90, 45, '2024-07-02'),
('Soundbar 120W',                  'Audio', 'LG',         899.00,  7, '2025-04-14'),
('Pedestal para Microfone',        'Audio', 'RMV',        129.90, 16, '2025-01-23'),
('Placa de Som USB 7.1',           'Audio', 'Vinik',       79.90, 26, '2024-09-09'),
('Cabo HDMI 2.0 2m',               'Cabos e Adaptadores', 'Vinik',   39.90, 110, '2024-03-11'),
('Cabo DisplayPort 1.8m',          'Cabos e Adaptadores', 'Vinik',   69.90,  40, '2024-10-08'),
('Adaptador USB-C para HDMI',      'Cabos e Adaptadores', 'Baseus',  99.90,  38, '2025-02-17'),
('Hub USB 4 Portas',               'Cabos e Adaptadores', 'Vinik',   79.90,  52, '2024-06-18'),
('Cabo USB-C 1m',                  'Cabos e Adaptadores', 'Baseus',  34.90, 140, '2024-04-22'),
('Adaptador VGA para HDMI',        'Cabos e Adaptadores', 'Vinik',   89.90,  24, '2024-12-27'),
('Cabo de Energia PC 1.5m',        'Cabos e Adaptadores', 'Vinik',   24.90, 100, '2024-03-11'),
('Dock Station USB-C 8 em 1',      'Cabos e Adaptadores', 'Baseus', 549.00,   8, '2025-05-15'),
('Extensor HDMI por Cabo de Rede', 'Cabos e Adaptadores', 'Vinik',  269.90,   6, '2025-03-31'),
('Organizador de Cabos',           'Cabos e Adaptadores', 'Ordene',  19.90,  75, '2024-02-26'),
('Smartphone Basico 64GB',         'Smartphones', 'Motorola',  899.00,  20, '2024-08-06'),
('Smartphone Intermediario 128GB', 'Smartphones', 'Samsung',  1699.00,  14, '2024-11-29'),
('Smartphone Avancado 256GB',      'Smartphones', 'Samsung',  3299.00,   6, '2025-03-05'),
('Smartphone Top de Linha 512GB',  'Smartphones', 'Apple',    6499.00,   2, '2025-06-27'),
('Carregador Turbo 33W',           'Smartphones', 'Xiaomi',    129.90,  55, '2024-09-23'),
('Capa Protetora Universal',       'Smartphones', 'Geonav',     39.90,  95, '2024-05-27'),
('Pelicula de Vidro 3D',           'Smartphones', 'Geonav',     29.90, 120, '2024-05-27'),
('Power Bank 10000mAh',            'Smartphones', 'Xiaomi',    189.90,  33, '2025-01-13'),
('Smartwatch Fitness',             'Smartphones', 'Xiaomi',    449.00,  18, '2025-04-21'),
('Suporte Veicular para Celular',  'Smartphones', 'Geonav',     59.90,  47, '2024-07-24');
```

---

## 🔢 Contagem de Registros

**Contar todos os itens da tabela:**

```sql
SELECT COUNT(*) FROM produtos;
```

**Salvando a contagem com um nome de coluna (alias):**

```sql
SELECT COUNT(*) AS total_registros FROM produtos;
```

**Contar produtos com estoque abaixo de 10:**

```sql
SELECT COUNT(*) AS qtd_produtos_baixo_estoque FROM produtos WHERE estoque < 10;
```

**Contar produtos de uma categoria específica:**

```sql
SELECT COUNT(*) AS qtd_perifericos FROM produtos WHERE categoria = 'Perifericos';
```

---

## 📈 Valores Máximo, Mínimo e Média

**Preço mais alto:**

```sql
SELECT MAX(preco) AS maior_preco FROM produtos;
```

**Preço mais baixo:**

```sql
SELECT MIN(preco) AS menor_preco FROM produtos;
```

**Preço médio:**

```sql
SELECT AVG(preco) AS media_preco FROM produtos;
```

> ⚠️ O `AVG` retorna um valor com muitas casas decimais. Para arredondar, usamos `ROUND()`:

```sql
SELECT ROUND(AVG(preco),2) AS media FROM produtos;
```

---

## 📊 Resumo Estatístico Completo

Reunindo tudo em uma única consulta — total de registros, maior preço, menor preço e média (já arredondada):

```sql
SELECT COUNT(*) AS produtos, MAX(preco) AS maior_preço, MIN(preco) AS menor_preço, ROUND(AVG(preco),2) AS media FROM produtos;
```

---

## 💻 Média por Categoria

Exemplo aplicado à categoria **Notebooks**:

```sql
SELECT ROUND(AVG(preco),2) AS media_notebooks FROM produtos WHERE categoria = 'Notebooks';
```

---

## 💰 Cálculo de Faturamento

O faturamento de cada produto é calculado por `PREÇO × ESTOQUE`.

**Faturamento por produto:**

```sql
SELECT nome, preco, estoque, preco * estoque AS faturamento_por_produto FROM produtos;
```

**Faturamento total da loja (se vender todo o estoque):**

```sql
SELECT SUM(preco * estoque) AS faturamento_total FROM produtos;
```

---

## 📝 Resumo das Funções de Agregação Usadas

| Função | Descrição |
|---|---|
| `COUNT(*)` | Conta o número de registros |
| `MAX()` | Retorna o maior valor de uma coluna |
| `MIN()` | Retorna o menor valor de uma coluna |
| `AVG()` | Calcula a média dos valores |
| `SUM()` | Soma os valores de uma coluna |
| `ROUND(valor, 2)` | Arredonda um número para 2 casas decimais |
| `AS` | Cria um alias (apelido) para a coluna do resultado |
| `WHERE` | Filtra os registros conforme uma condição |
