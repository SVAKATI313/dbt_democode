{{ config(materialized='view') }}

WITH tb1 as(
    select
    empid as ID
    empname as NAME
    from {{source('datafeed_shared_schema','STG_EMPL')}})
select * from tb1