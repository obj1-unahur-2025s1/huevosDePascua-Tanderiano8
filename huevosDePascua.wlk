object terreno {
    const property huevosEscondidos = []
    method esconderHuevo(listaDeHuevos) {huevosEscondidos.addAll(listaDeHuevos)} 
    method huevosSinEncontrar() = huevosEscondidos.size()
    method huevosConChocolateBlanco() = huevosEscondidos.count({h => h.tieneChocolateBlanco()})
    method noFueEncontrado(unHuevo) = huevosEscondidos.contains(unHuevo)
    method encontrarUnHuevoPor(unHuevo, unChico){
        if(self.noFueEncontrado(unHuevo)){
            unChico.comer(unHuevo)
            huevosEscondidos.remove(unHuevo)
        }
    }
    method encontrarPrimerHuevoPor(unChico){
        if (not huevosEscondidos.isEmpty()){
            self.encontrarUnHuevoPor(huevosEscondidos.first(),unChico)
        }
    }
    method encontrarRestantesPor(unChico){
        huevosEscondidos.forEach({h=> self.encontrarUnHuevoPor(h, unChico)})
    }
    method losDeChocolateBlanco()=  huevosEscondidos.filter({h=> h.esDeChocolateBlanco()})

    method elDeMayorCalorias() = if ( not huevosEscondidos.isEmpty())
    huevosEscondidos.max({h=> h.calorias()}) 



}
object huevoRepostero {
    method calorias() = 750
    method tieneChocolateBlanco() = true
    method tieneChocolateAmargo() = false
}

object huevoMixto {
  method calorias() = 900
  method tieneChocolateBlanco() = true
  method tieneChocolateAmargo() = false 
}

object conejo {
  var property peso = 200
  method calorias() = peso *10  
  method tieneChocolateBlanco() = false
  method tieneChocolateAmargo() = true  
}

object blisterHuevitos {
  var property cantidad = 1
  method calorias() = cantidad * 100 + (cantidad.div(5)*150) 
  method tieneChocolateBlanco() = cantidad >= 5
  method tieneChocolateAmargo() = false 
} 


object matrioshka {
 var property decoracion = arbolDeChocolate
 var property chocolateDentro = huevoRepostero
 method calorias() = chocolateDentro.calorias() + decoracion.calorias() + 3000
 method tieneChocolateBlanco() = chocolateDentro.tieneChocolateBlanco()
 method tieneChocolateAmargo() = true   
}

object arbolDeChocolate{
    method calorias() = 150
}
object florDeChocolate{
    var property petalos = 5
    method calorias () = 100 * petalos
}


object ana{
    const huevosEncontrados=[]
    method comer(unHuevo){
        huevosEncontrados.add(unHuevo)
    }
    method estaEnfermo()=
        self.caloriasConsumidas() > 5000 || 
        self.comioDeChocoBlanco()
    
    method caloriasConsumidas() = 
    huevosEncontrados.sum({h => h.calorias()})
    method comioDeChocoBlanco() = huevosEncontrados.any({h=> h.esDeChocolateBlanco()}) 

}


object jose{
    var ultimoHuevoComido= huevoRepostero
    method comer(unHuevo){ultimoHuevoComido= unHuevo}
    method  estaEnfermo()= ultimoHuevoComido.esDeChocolateBlanco()
}

object tito{

    method comer(unHuevo){}
    method estaEnfermo() = false
}
