{{ config(materialized='table') }}

with opportunities as (
    select * from {{ ref('fact_opportunities_snapshot') }} 
    where dbt_valid_to is null
)

select * from opportunities