{% snapshot dim_opportunities_snapshot %}

{{
    config(
      target_schema=var('schema'),
      unique_key='reference',
      strategy='timestamp',
      updated_at='last_modified',
    )
}}

with opportunities as (
    select * from {{ source ('capsulecrm_source', 'opportunities') }}
),

dim_opportunities_snapshot as (
    select
        *
    from opportunities
)

select * from dim_opportunities_snapshot
{% endsnapshot %}