import punto1.*
import punto2.*


object realista {
	
method suenoMasPreciado(persona){
		return persona.suenosPendientes().max({sueno => sueno.felicidonios()})
	}
}

object alocados {
 method suenoMasPreciado(persona){
	return persona.suenosPendientes().anyOne()
}
}

object obsesivos {
  method suenoMasPreciado(persona){
		return persona.suenosPendientes().head()
	}
}

