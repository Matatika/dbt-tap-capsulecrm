{{ config(materialized='table') }}

with parties as (
    select * from {{ source ('capsulecrm_source', 'parties') }}
)

select * from parties
