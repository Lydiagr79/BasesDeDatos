--1.-Crea una función para calcular el factorial con sumas en lugar de multiplicaciones.​

        --4 = 4+3+2+1 = 10​

        --5 = 5+4+3+2+1=15​

--2.-Crea una función para calcular el iva, pasandole el importe y el % de iva.​

--3.-Crea una función para calcular los gastos de envio del arepazo, si CP empieza por ​

        --410NN -> 3.99 Sevilla ciudad.​

        --41NNN (n es un numero)-> 6.99 es un pueblo de sevilla​

        --Otra cosa numerica -> 9.99​

        --NULL -> Cod postal no valido​


--4.-(usar Arepezo) Crea un parse para los datos del cliente​. La función debe devolver 1 si es valido y 0 si no es valido.
    --A esta función le pasaremos el id del cliente y nos validará las siguientes cosas:

        --CP valido​ ( para españa, 5 digitos numericos y los dos primeros menores deben estar en la tabla correos)

        --Email valido​ ( contiene una arroba y detras de la arroba tiene . punto y minimo 2 letras.)

        --DNI con letra correcta.​ (añadir el campos dni a la tabla clientes)

        --Nombre de almenos 2 letras.​ 

    
-- 5.- Crea una función que mirando la tabla correos del arepezo, Nos diga la provincia según el cod postal.
            -- usa esa función para comprobar si la provincia indicada en la tabla clientes está bien.​




--6.- crea una funcion que pasandole la fecha de nacimiento te devuelva la edad de una persona mirando la fecha actual. 
--Ten en cuenta el dia, el mes y el año.



------EJERCICIOS CON FUNCIOINES QUE DEVUELVEN TABLAS




-- 7.- Crear una función en la bbdd del Arepazo que nos devuelva en una tabla los elementos del
-- menu que no están disponibles cuando se agota un ingrediente que le pasamos como parametro.

--8.- Crear una función en la BBDD del arepazo que nos devuelva los 10 elementos del menu
-- mas solicitados. Indicando en un campo, el numero de veces que se ha pedido.

