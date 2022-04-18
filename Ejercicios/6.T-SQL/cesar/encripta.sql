go
create or alter function encripta (@msg as varchar(8000))
returns varchar(8000)
as begin
    declare @alfabeto as varchar(200) ='QWERTYUIOPASDFGHJKLÑÇZXCVBNM'
    declare @resultado as varchar(100) =''

    declare @numcaracteres as int = len(@msg)
    declare @contador as int = 1
    declare @numclave as int = len(@alfabeto)
    while @contador <=@numcaracteres 
    begin 
        declare @letra as varchar =SUBSTRING(@msg,@contador,1)
        declare @encontrado as bit = 0
        declare @contador1 as int=1
        while (@encontrado =0 and @contador1 <=@numclave)
        BEGIN
            if  (@letra = SUBSTRING(@alfabeto,@contador1,1))
            begin
                set @encontrado =1
                set @resultado = @resultado + SUBSTRING(@alfabeto,((@contador1) % (@numclave)) +1,1) 
            end
            set @contador1 = @contador1+1
        END
        if ( @encontrado =0)
        BEGIN
            set @resultado = @resultado + @letra
        END
        set @contador=@contador+1
    end
    return @resultado
end


