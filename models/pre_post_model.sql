{{ config(
     materialized="table",
     post_hook="TRUNCATE TABLE {{source('datafeed_shared_schema','raw_SUPPLIES_DATA')}}"
) }}

WITH tb1 as(
     select 
     *
     from {{source('datafeed_shared_schema','raw_SUPPLIES_DATA')}})
select * from tb1