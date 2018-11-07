import punto1.*
class SuenoMultiple inherits Sueno{
	
	var suenos = []

	
override	method validar(persona){
	suenos.forEach({sueno=>sueno.validar(persona)})
}

override method realizar(persona){
	suenos.forEach({sueno=>sueno.realizar(persona)})
}

override method cumplir(){
	suenos.forEach({sueno=>sueno.cumplir()})
}
}