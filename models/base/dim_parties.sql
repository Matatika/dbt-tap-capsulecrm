{{ config(materialized='table') }}

with parties as (
    select * from {{ ref('dim_parties_snapshot') }}
    where dbt_valid_to is null
)

select * from parties
