{% snapshot dim_opportunities_snapshot %}

{{
    config(
      target_schema=var('schema'),
      unique_key='id',
      strategy='timestamp',
      updated_at='updated_at',
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