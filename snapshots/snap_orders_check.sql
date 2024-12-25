{% snapshot snap_orders_check %}

     {{
        config(
         target_schema='snapshots',
          strategy='check',
          unique_key='id',
         check_cols=['user_id','order_date','status'],
     )
     }}

     select * from {{ ref( 'stg_orders') }} 

{% endsnapshot %}