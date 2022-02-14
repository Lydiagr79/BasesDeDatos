use soccer

--Buscar plantilla de un equipo por el nombre del equipo y dar la fecha de debut, la fecha del ultimo partido y los partidos jugados de cada jugador.

select player_name,max(fechaUltimoPartido) as fechaUltimoPartido,min(fechaPrimerPartido) as fechaPrimerPartido,sum(numeroDePartidosJugados) as numeroDePartidosJugados from (

    select t.team_api_id,t.team_long_name,p.player_api_id,p.player_name,max(m.[date]) as fechaUltimoPartido,min(m.date) as fechaPrimerPartido,count(m.id) as numeroDePartidosJugados from match m
    inner join team t on t.team_api_id = m.home_team_api_id
    inner join player p
    on 
        m.home_player_1 = p.player_api_id or m.home_player_2 = p.player_api_id or m.home_player_3 = p.player_api_id or m.home_player_4 = p.player_api_id or m.home_player_5 = p.player_api_id or m.home_player_6 = p.player_api_id or m.home_player_7 = p.player_api_id or m.home_player_8 = p.player_api_id or m.home_player_9 = p.player_api_id or m.home_player_10 = p.player_api_id or m.home_player_11 = p.player_api_id 
        or m.home_player_x1 = p.player_api_id or m.home_player_x2 = p.player_api_id or m.home_player_x3 = p.player_api_id or m.home_player_x4 = p.player_api_id or m.home_player_x5 = p.player_api_id or m.home_player_x6 = p.player_api_id or m.home_player_x7 = p.player_api_id or m.home_player_x8 = p.player_api_id or m.home_player_x9 = p.player_api_id or m.home_player_x10 = p.player_api_id or m.home_player_x11 = p.player_api_id 
        or m.home_player_y1 = p.player_api_id or m.home_player_y2 = p.player_api_id or m.home_player_y3 = p.player_api_id or m.home_player_y4 = p.player_api_id or m.home_player_y5 = p.player_api_id or m.home_player_y6 = p.player_api_id or m.home_player_y7 = p.player_api_id or m.home_player_y8 = p.player_api_id or m.home_player_y9 = p.player_api_id or m.home_player_y10 = p.player_api_id or m.home_player_y11 = p.player_api_id 
    GROUP BY t.team_api_id,t.team_long_name,player_api_id,player_name

    UNION ALL

    select t.team_api_id,t.team_long_name,player_api_id,p.player_name,max(m.[date]) as fechaUltimoPartido,min(m.date) as fechaPrimerPartido,count(m.id) as numeroDePartidosJugados from match m
    inner join team t on t.team_api_id = m.away_team_api_id
    inner join player p
    on 
        m.away_player_1 = p.player_api_id or m.away_player_2 = p.player_api_id or m.away_player_3 = p.player_api_id or m.away_player_4 = p.player_api_id or m.away_player_5 = p.player_api_id or m.away_player_6 = p.player_api_id or m.away_player_7 = p.player_api_id or m.away_player_8 = p.player_api_id or m.away_player_9 = p.player_api_id or m.away_player_10 = p.player_api_id or m.away_player_11 = p.player_api_id 
        or m.away_player_x1 = p.player_api_id or m.away_player_x2 = p.player_api_id or m.away_player_x3 = p.player_api_id or m.away_player_x4 = p.player_api_id or m.away_player_x5 = p.player_api_id or m.away_player_x6 = p.player_api_id or m.away_player_x7 = p.player_api_id or m.away_player_x8 = p.player_api_id or m.away_player_x9 = p.player_api_id or m.away_player_x10 = p.player_api_id or m.away_player_x11 = p.player_api_id 
        or m.away_player_y1 = p.player_api_id or m.away_player_y2 = p.player_api_id or m.away_player_y3 = p.player_api_id or m.away_player_y4 = p.player_api_id or m.away_player_y5 = p.player_api_id or m.away_player_y6 = p.player_api_id or m.away_player_y7 = p.player_api_id or m.away_player_y8 = p.player_api_id or m.away_player_y9 = p.player_api_id or m.away_player_y10 = p.player_api_id or m.away_player_y11 = p.player_api_id  
    GROUP BY t.team_api_id,t.team_long_name,player_api_id,player_name

) as t1
where team_long_name like '%Betis%'
group by t1.player_name,t1.player_api_id
order by fechaUltimoPartido desc

select season,league_id,name,min(numpartidos),max(numpartidos) from (
select t1.season,t1.team_long_name,t1.name,t1.league_id,sum(numPartidos) as numpartidos from (
select season,t.team_long_name,league_id,l.name,count(1) as numPartidos from [Match] m
inner join team t on t.team_api_id =m.home_team_api_id
inner join League l on l.id=m.league_id
--inner join team v on v.team_api_id =m.away_team_api_id
--where team_long_name like '%Betis%'
group by season,t.team_long_name,league_id,l.name
union all
select season,t.team_long_name,league_id,l.name,count(1) from [Match] m
inner join team t on t.team_api_id =m.away_team_api_id
inner join League l on l.id=m.league_id
--inner join team v on v.team_api_id =m.away_team_api_id
--where team_long_name like '%Betis%'
group by season,t.team_long_name,league_id,l.name
) as t1

group by t1.season,t1.team_long_name,t1.name,t1.league_id
) as t2
group by season,league_id,name
order by league_id