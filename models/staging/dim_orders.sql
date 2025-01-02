{{ config(materialized='table') }}

select 
    o.order_key,
    o.order_status,
    o.order_total,
    o.order_date,
    o.order_month,
    l.order_unique_items,
    l.order_total_quantity,
    c.CUSTKEY,
    c.NAME,
    n.customer_nation
    
from {{ ref('stg_ordersdata') }} as o
    
    inner join {{ ref('order_lineitem') }} l 
        on l.order_key = o.order_key 

    inner join {{ ref('stg_customer') }} c 
        on c.CUSTKEY = o.order_key

    inner join {{ ref('stg_nation') }} as n 
        on n.nation_key = c.C_NATIONKEY
