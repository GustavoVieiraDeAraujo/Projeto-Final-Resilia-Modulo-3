-- Set mais antigo 
SELECT COUNT(name) AS quantidade_sets, MIN(year) as ano FROM sets
	WHERE year = 1950;

-- Set mais recente
SELECT COUNT(name) AS quantidade_sets, MAX(year) as ano FROM sets
	WHERE year = 2017;

-- Maior num de peças
SELECT name, num_parts FROM sets 
	WHERE num_parts = (
		SELECT MAX(num_parts) FROM sets
        ) 
		GROUP BY name;

-- Numero de peças dos sets "Advent Calendar"
SELECT SUM(num_parts) AS total_peças , name FROM sets 
	WHERE num_parts > 1 AND name LIKE 'Advent Calendar%'
		GROUP BY name
			ORDER BY total_peças ASC;

-- Quantidade de peças por cores
SELECT name, SUM(inventory_parts.quantity) AS quantidade_peças_cores FROM  colors
	INNER JOIN inventory_parts ON colors.id = inventory_parts.color_id 
		GROUP BY color_id 
			ORDER BY SUM(inventory_parts.quantity) DESC LIMIT 10;

-- Quantidade de peças transparentes 
SELECT COUNT(is_trans) AS quantidade_cores_transparentes FROM colors
	WHERE is_trans = 't';

-- Numero total de cores
SELECT COUNT(id) AS total_cores FROM colors;

-- TOP 10 sets mais usados nos temas
SELECT name AS nome_set, COUNT(theme_id) AS quantas_vezes_foi_usado_em_temas FROM sets 
	GROUP BY name 
		ORDER BY COUNT(theme_id) DESC LIMIT 10;
        
-- Os três primeiros temas com iniciais "A" que mais possuem sets       
SELECT themes.name,COUNT(sets.name) as quantidade_de_sets FROM sets
	INNER JOIN themes ON sets.theme_id = themes.id
		WHERE themes.name LIKE 'A%'
			GROUP BY themes.name
				ORDER BY quantidade_de_sets DESC LIMIT 3;

-- O tema com mais sets
SELECT themes.name,COUNT(sets.name) as quantidade_de_sets FROM sets
	INNER JOIN themes ON sets.theme_id = themes.id
			GROUP BY themes.name
				ORDER BY quantidade_de_sets DESC LIMIT 1;
 
-- O tema com menos sets
SELECT themes.name,COUNT(sets.name) as quantidade_de_sets FROM sets
	INNER JOIN themes ON sets.theme_id = themes.id
		WHERE themes.name LIKE 'A%'
			GROUP BY themes.name
				ORDER BY quantidade_de_sets ASC LIMIT 1;
                
-- Os inventarios que possuem mais de 10 e menos de 20 cores ordenados de forma crescente
SELECT inventory_parts.inventory_id, COUNT(color_id) AS quantidade_cores FROM inventory_parts
	INNER JOIN colors ON colors.id = inventory_parts.color_id
		GROUP BY inventory_parts.inventory_id
			HAVING COUNT(color_id) > 10 AND COUNT(color_id) < 20
				ORDER BY quantidade_cores ASC;

-- O inventario que mais tem cores
SELECT inventory_parts.inventory_id, COUNT(color_id) AS quantidade_cores FROM inventory_parts
	INNER JOIN colors ON colors.id = inventory_parts.color_id
		GROUP BY inventory_parts.inventory_id
			HAVING COUNT(color_id) 
				ORDER BY quantidade_cores DESC LIMIT 1;
                
-- O inventario que tem menos cores
SELECT inventory_parts.inventory_id, COUNT(color_id) AS quantidade_cores FROM inventory_parts
	INNER JOIN colors ON colors.id = inventory_parts.color_id
		GROUP BY inventory_parts.inventory_id
			HAVING COUNT(color_id) > 5
				ORDER BY quantidade_cores ASC LIMIT 1;