# 2021.06.07

# 这里有张 World 表

# +-----------------+------------+------------+--------------+---------------+
# | name            | continent  | area       | population   | gdp           |
# +-----------------+------------+------------+--------------+---------------+
# | Afghanistan     | Asia       | 652230     | 25500100     | 20343000      |
# | Albania         | Europe     | 28748      | 2831741      | 12960000      |
# | Algeria         | Africa     | 2381741    | 37100000     | 188681000     |
# | Andorra         | Europe     | 468        | 78115        | 3712000       |
# | Angola          | Africa     | 1246700    | 20609294     | 100990000     |
# +-----------------+------------+------------+--------------+---------------+

-- auto-generated definition
create table test_world
(
    name       varchar(255) not null,
    continent  varchar(255) null,
    area       bigint       null,
    population bigint       null,
    gdp        bigint       null
);

INSERT INTO td_mysql_db.test_world (name, continent, area, population, gdp) VALUES ('Afghanistan', 'Asia', 652230, 25500100, 20343000);
INSERT INTO td_mysql_db.test_world (name, continent, area, population, gdp) VALUES ('Albania', 'Europe', 28748, 2831741, 12960000);
INSERT INTO td_mysql_db.test_world (name, continent, area, population, gdp) VALUES ('Algeria', 'Africa', 2381741, 37100000, 188681000);
INSERT INTO td_mysql_db.test_world (name, continent, area, population, gdp) VALUES ('Andorra', 'Europe', 468, 78115, 3712000);
INSERT INTO td_mysql_db.test_world (name, continent, area, population, gdp) VALUES ('Angola', 'Africa', 1246700, 20609294, 100990000);

# 如果一个国家的面积超过 300 万平方公里，或者人口超过 2500 万，那么这个国家就是大国家。
# 编写一个 SQL 查询，输出表中所有大国家的名称、人口和面积。
# 例如，根据上表，我们应该输出:

# +--------------+-------------+--------------+
# | name         | population  | area         |
# +--------------+-------------+--------------+
# | Afghanistan  | 25500100    | 652230       |
# | Algeria      | 37100000    | 2381741      |
# +--------------+-------------+--------------+

# 答案
select name, population, area
from test_world
where area > '3000000'
   or population > '25000000';

