{% macro get_season(x)%}

CASE WHEN MONTH(TO_TIMESTAMP({{x}})) in (12,1,2)
    THEN 'WINTER'
    WHEN MONTH(TO_TIMESTAMP({{x}})) in (3,4,5)
    THEN 'SPRING'
    WHEN MONTH(TO_TIMESTAMP({{x}})) in (6,7,8)
    THEN 'SUMMER'
    ELSE 'AUTUMN' 
    END

{% endmacro %}

{% macro get_daytype(x) %}
CASE 
WHEN DAYNAME(TO_TIMESTAMP({{x}})) in ('Sat','Sun')
THEN 'WEEKEND'
ELSE 'BUSINESSDAY'
END
{% endmacro %}