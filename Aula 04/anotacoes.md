## Visualizando produtos em ordem decrescente com base no estoque:

```sql
SELECT * FROM produtos
ORDER BY estoque DESC;
```

## Visualizando apenas o nome e o valor dos produtos:

```sql
SELECT nome,valor FROM produtos;
```

## Visualizando apenas o produto com o id 1:

```sql
SELECT * FROM produtos WHERE id=1;
```

## Atualizando o valor do produto de id 1:

```sql
UPDATE produtos SET valor = 6 WHERE id = 1;
```

## Deletando o produto de id 4:

```sql
DELETE FROM produtos WHERE id = 4; 
```