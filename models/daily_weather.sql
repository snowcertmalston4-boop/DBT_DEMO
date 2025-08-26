with daily_weather as
(
    select 
    date(time) as daily_weather,
    weather,
    temp,
    pressure,
    humidity,
    clouds
    from {{ source('demo', 'weather') }}
    limit 10
),

daily_weather_agg as (
    select
    daily_weather,
    weather,
    round(avg(temp),2),
    avg(pressure),
    avg(humidity),
    avg(clouds)

    -- row_number() over (partition by daily_weather order by count(weather) desc) as row_number
    from daily_weather
    group by daily_weather, weather
    qualify row_number() over (partition by daily_weather order by count(weather) desc) = 1
)

select * from daily_weather_agg