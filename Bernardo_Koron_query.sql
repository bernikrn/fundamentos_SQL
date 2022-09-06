/*
	Listado de coches activos que hay en KeepCoding:
		- Nombre modelo, marca y grupo de coches (los nombre de todos)
		- Fecha de compra
		- Matricula
		- Nombre del color del coche
		- Total kilómetros
		- Nombre empresa que esta asegurado el coche
		- Numero de póliza
 */

select b.name "Modelo", c.name "Marca", d.name "Grupo",
a.dt_buy "Fecha compra", a.plate_number"Matricula",
e.name "Color", a.total_km "Kilometros", f.name "Aseguradora", a.policy_n "Poliza N" 
from bernardo_koron.cars a 
inner join bernardo_koron.models b on a.id_model = b.id_model
inner join bernardo_koron.brands c on  b.id_brand = c.id_brand 
inner join bernardo_koron.brand_groups d on  c.id_group  = d.id_group 
inner join bernardo_koron.colors e on a.id_color = e.id_color
inner join bernardo_koron.insurances f on a.id_insurance = f.id_insurance
where dt_termination = '4000-01-01'
