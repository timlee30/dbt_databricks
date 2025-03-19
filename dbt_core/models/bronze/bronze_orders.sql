{{
  config(
         materialized = 'incremental',
         unique_key = 'id'
         )
}}
SELECT
*
FROM 
{{ source('landing', 'orders') }}

{% if is_incremental() %}
where created_at > (select coalesce(max(created_at),'1900-01-01') from {{ this }})
{% endif %}
