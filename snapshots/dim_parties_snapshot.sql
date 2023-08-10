{% snapshot dim_parties_snapshot %}

{{
    config(
      target_schema=var('schema'),
      unique_key='id',
      strategy='timestamp',
      updated_at='updated_at',
    )
}}

with parties as (
    select * from {{ source ('capsulecrm_source', 'parties') }}
),

dim_parties_snapshot as (
    select
        *
    from parties
)

select * from dim_parties_snapshot
{% endsnapshot %}