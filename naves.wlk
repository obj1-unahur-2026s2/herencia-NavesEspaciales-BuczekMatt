

class NavesEspaciales{

    var velocidad = 0
    var direccion = 0
    var combustible = 0
    method acelerar(unNumero) {
      velocidad = (velocidad + unNumero).min(100000)
    }
    method desacelerar(unNumero) {
      velocidad = (velocidad - unNumero).max(0)
    }
    method irHaciaElSol() {
      direccion = 10
    }
    method escaparDelSol() {
      direccion = -10
    }
    method ponerseParaleloAlSol() {
      direccion = 0
    }
    method acercarseUnPocoAlSol() {
      direccion = (direccion + 1).min(10)
    }
    method alejarseUnPocoDelSol() {
      direccion = (direccion - 1).max(-10)
    }
    method prepararViaje(){
      self.cargarCombustible(30000)
      self.acelerar(5000)
    }
    method cargarCombustible(litros) {
      combustible+=litros
    }
    method descargarCombustible(litros) {
      combustible = (combustible - litros).max(0)
    }

}

class NaveBaliza inherits NavesEspaciales{
    var baliza = "verde"
    method cambiarColorDeBaliza(colorNuevo) {
        baliza = colorNuevo
    }
    override method prepararViaje(){
      super().prepararViaje()
      self.cambiarColorDeBaliza("verde")
      self.ponerseParaleloAlSol()
    }
}

class NaveDePasajeros inherits NavesEspaciales{
    var pasajeros = 0
    var racionesDeComida = 0
    var cantDeBebidas = 0

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

    override method prepararViaje(){
      super().prepararViaje()
      self.cargarComida(4*self.pasajeros()) 
      self.cargarBebida(6*self.pasajeros())
      self.acercarseUnPocoAlSol()
    }
}
class NaveHospital inherits NaveDePasajeros{
  
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
      return self.mensajesEmitidos().contains(unMensaje)
    }
    override method prepararViaje(){
      super().prepararViaje()
      self.ponerseVisible()
      self.replegarMisiles()
      self.acelerar(15000)
      self.emitirMensaje("Saliendo en misión")
    }
}