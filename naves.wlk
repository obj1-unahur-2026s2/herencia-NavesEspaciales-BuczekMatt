

class NavesEspaciales{

    var velocidad = 0
    method acelerar(unNumero) {
      velocidad+=unNumero
    }
    method desacelerar(unNumero) {
      velocidad-=unNumero
    }


}

class Navebaliza inherits NavesEspaciales{
    var baliza = "verde"
    method cambiarColorDeBaliza(colorNuevo) {
        baliza = colorNuevo
    }
}

class NaveDePasajeros inherits NavesEspaciales{
    var pasajeros 
    var racionesDeComida
    var cantDeBebidas 

    method cargarComida(unaCantidad) {
      racionesDeComida+=unaCantidad
    }
    method cargarBebida(unaCantidad) {
      cantDeBebidas+=unaCantidad
    }
    method decargarComida(unaCantidad) {
      racionesDeComida-=unaCantidad
    }
    method decargarBebida(unaCantidad) {
      cantDeBebidas-=unaCantidad
    }
    method cantDePasajeros(unaCantidad) {
      pasajeros = unaCantidad
    }

    method pasajeros() = pasajeros
    method racionesDeComida() = racionesDeComida
    method cantDeBebidas() = cantDeBebidas
}

class NaveDeCombate inherits NavesEspaciales{
    const mensajes = []
    var estaInvisible = false
    var misilesDesplegados = false
    
    

    method estaInvisible() {
      return estaInvisible
    }
    method ponerseVisible() {
      estaInvisible = false
    }
    method ponerseInvisible() {
      estaInvisible = true
    }

    method desplegarMisiles() {
      misilesDesplegados = true
    }
    method replegarMisiles() {
      misilesDesplegados = false
    }
    method misilesDesplegados() {
      return misilesDesplegados
    }
    method mensajesEmitidos() {
      return mensajes
    }
    method emitirMensaje(unMensaje) {
        mensajes.add(unMensaje)
    }
    method primerMensajeEmitido() {
      return self.mensajesEmitidos().first()
    }
    method ultimoMensajeEmitido() {
      return self.mensajesEmitidos().last()
    }
    method esEscueta() {
      return self.mensajesEmitidos().all({ mensaje => mensaje.size() <= 30 }) 
    }

    method emitioMensaje(unMensaje) {
      
    }
}