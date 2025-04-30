{{ config(materialized='table') }}

WITH supplier_parts AS (
SELECT * 
FROM {{ref('stg_supplier')}}
JOIN {{ref('stg_partsupp')}}
ON s_suppkey=ps_suppkey
JOIN {{ref('stg_part')}}
ON ps_partkey=p_partkey
)

SELECT
s_suppkey AS supplier_key,
s_name AS supplier_name,
s_nationkey AS nation_key,
s_acctbal AS account_balance,
ps_availqty AS available_quantity,
ps_supplycost AS supply_cost,
p_partkey AS part_key,
p_name AS part_name,
p_mfgr AS part_manufacturer,
p_brand AS part_brand,
p_type AS part_type,
p_size AS part_size,
p_container AS part_container,
p_retailprice AS part_retail_price
FROM supplier_parts
