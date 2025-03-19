SELECT
    id,
    created_at,
    city,
    state,
    year(birth_date) as birth_year,
    source as sales_channel
FROM
{{ ref('bronze_users') }}