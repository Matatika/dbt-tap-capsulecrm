{{ config(materialized='table') }}

with parties as (
    select * from {{ ref('fact_parties_snapshot') }} 
    where dbt_valid_to is null
)

select * from parties
