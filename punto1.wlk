class Persona {
	var  suenos =[]
	var property edad 
	var  carrerasAEstudiar
	var property plataAGanar
	var  lugares = []
	var  hijos
	var carrerasHechas =[]
	var felicidad
	var property personalidad
	
	method suenosCumplidos(){
		return suenos.filter({unSueno=> unSueno.estaCumplido()})
	}
	
	method suenosPendientes(){
		return suenos.filter({unSueno=> !(unSueno.estaCumplido())})
	}
	
	method viajarA(lugar){
		lugares.add(lugar)
	}
	method adoptar(adopciones){
		hijos += adopciones
	}
	
	method tieneHijo(){
		return hijos>0
	}
	method sumarFelicidonios(_felicidad){
		felicidad += _felicidad }
		
	
	method tenerUnHijo(){
		hijos += 1
	}
	
	method recibirse(carrera){
		carrerasHechas.add(carrera)
	}
	
	method quiereEstudiar(carrera){
		return carrerasAEstudiar.contains(carrera)
	}
	method seRecibioDe(carrera){
		return carrerasHechas.contains(carrera)
	}
	
	method cumplirSueno(sueno){
		if (sueno.estaCumplido()) {throw new ParcialException ("El sueño esta cumplido")}
		sueno.cumplir(self)
	}
	method cumplirSuenoMasPreciado(){
		self.cumplirSueno(personalidad.suenoMasPreciado(self))
	}

	method esFeliz(){
		return felicidad>self.felicidadSuenosPendientes()
	}
	method felicidadSuenosPendientes(){
		return self.suenosPendientes().sum({sueno => sueno.felicidonios()})
	}
	method suenos100(){
		return suenos.filter({sueno => sueno.felicidonios()>100})
	}
	method esAmbisiosa(){
		return self.suenos100().size()>3
	}
	
}


class ParcialException inherits wollok.lang.Exception {
	constructor (_mensaje) = super (_mensaje)
}

class Sueno {
	var property felicidonios
	var cumplido = false
	
	method estaCumplido(){
		return cumplido
	}
	method validar(persona){}
	
	method realizar(persona){}
	
	method cumplir(){
		cumplido = true
	}
	
	method cumplir(persona){
		self.validar(persona)
		self.realizar(persona)
		self.cumplir()
		persona.sumarFelicidonios(felicidonios)
		}
	}
	
	

class Recibirse inherits Sueno {
	var carrera 
override	method validar (persona){
	
	if (!persona.quiereEstudiar(carrera)) {throw new ParcialException ("No quiere estudiar esa carrera")}	
	if (persona.seRecibioDe(carrera)) {throw new ParcialException ("Ya se recibio")}
	}
	
	
override method realizar(persona){
	persona.recibirse(carrera)
	
}	
	

}

class TenerUnHijo inherits Sueno {
override method realizar(persona){
	persona.tenerUnHijo()
}
}

class Adoptar inherits Sueno {
	var cantAdopciones 
override method validar (persona){
	if (persona.tieneHijo()) {throw new ParcialException ("Ya tiene un hijo")}
}	
override method realizar(persona){
	persona.adoptar(cantAdopciones)
	
}
}

class Viajar inherits Sueno {
	var lugar
override method realizar(persona){
	persona.viajarA(lugar)
}	
}

class Laburo inherits Sueno {
	var sueldo
override method validar(persona){
	if (sueldo<persona.plataAGanar()) {throw new ParcialException ("No se conforma con el sueldo")}
}	

}
