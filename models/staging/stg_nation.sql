{{ config(materialized='table') }}

WITH tb1 as(
    select 
    n_nationkey as nation_key,
    --this lookup table is only used for customers  
    n_name as customer_nation
    
    from {{source('datafeed_shared_schema','RAW_NATION')}})
select * from tb1