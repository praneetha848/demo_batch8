{{ config(materialized='table') }}

WITH tb1 as(
    select * from
{{ref('snap_ordersdetails')}} where DBT_VALID_TO is null)
select * from tb1