extends Area2D

var activo = [false,false,false,false]

func _ready():
	activo = GameHandler.get_palancas()
	_actualizaEstados(0)
	_actualizaEstados(1)
	_actualizaEstados(2)
	_actualizaEstados(3)

func _on_Rojo_body_shape_entered(body_id, body, body_shape, local_shape):
	activo[local_shape] = !activo[local_shape]
	GameHandler.actualizaPalancas(local_shape,activo[local_shape])
	self._actualizaEstados(local_shape)

func _actualizaEstados(id):
	var estadoPlataforma: bool
	var animacion
	var contadorDiscos = GameHandler.contadorDiscos
	if contadorDiscos >= 2:
		match id:
			0:
				animacion = get_parent().get_node("Rojo/PalancaAscensor/Palanca").animation
				estadoPlataforma = get_parent().get_node("Rojo/Ascensor")._get("activo")
				if  activo[0]:
					if animacion != "activate":
						get_parent().get_node("Rojo/PalancaAscensor/Palanca").play("activate")
					get_parent().get_node("Sombra Secretos/Sombra de descubrimiento Interior").visible = false
					if estadoPlataforma == false:
						get_parent().get_node("Rojo/Ascensor")._set("activo",true)
				else:
					if ((animacion != "desactivate") or (animacion != "start")):
						get_parent().get_node("Rojo/PalancaAscensor/Palanca").play("desactivate")
					get_parent().get_node("Sombra Secretos/Sombra de descubrimiento Interior").visible = true
					if estadoPlataforma:
						get_parent().get_node("Rojo/Ascensor")._set("activo",false)
			1:
				animacion = get_parent().get_node("Rojo/PalancaPlataformaMovil0y5/Palanca").animation
				estadoPlataforma = get_parent().get_node("Rojo/PlataformaMovil")._get("activo")
				if  activo[1]:
					if animacion != "activate":
						get_parent().get_node("Rojo/PalancaPlataformaMovil0y5/Palanca").play("activate")
					if estadoPlataforma == false:
						get_parent().get_node("Rojo/PlataformaMovil")._set("activo",true)
					estadoPlataforma = get_parent().get_node("Rojo/PlataformaMovil5")._get("activo")
					if estadoPlataforma == false:
						get_parent().get_node("Rojo/PlataformaMovil5")._set("activo",true)
				else:
					if ((animacion != "desactivate") or (animacion != "start")):
						get_parent().get_node("Rojo/PalancaPlataformaMovil0y5/Palanca").play("desactivate")
					if estadoPlataforma:
						get_parent().get_node("Rojo/PlataformaMovil")._set("activo",false)
					estadoPlataforma = get_parent().get_node("Rojo/PlataformaMovil5")._get("activo")
					if estadoPlataforma:
						get_parent().get_node("Rojo/PlataformaMovil5")._set("activo",false)
			2:
				animacion = get_parent().get_node("Rojo/PalancaPlataformaMovil1/Palanca").animation
				estadoPlataforma = get_parent().get_node("Rojo/PlataformaMovil1")._get("activo")
				if  activo[2]:
					if animacion != "activate":
						get_parent().get_node("Rojo/PalancaPlataformaMovil1/Palanca").play("activate")
					if estadoPlataforma == false:
						get_parent().get_node("Rojo/PlataformaMovil1")._set("activo",true)
				else:
					if ((animacion != "desactivate") or (animacion != "start")):
						get_parent().get_node("Rojo/PalancaPlataformaMovil1/Palanca").play("desactivate")
					if estadoPlataforma:
						get_parent().get_node("Rojo/PlataformaMovil1")._set("activo",false)
			3:
				animacion = get_parent().get_node("Rojo/PalancaPlataformaMovil2y3/Palanca").animation
				estadoPlataforma = get_parent().get_node("Rojo/PlataformaMovil2")._get("activo")
				if  activo[3]:
					if animacion != "activate":
						get_parent().get_node("Rojo/PalancaPlataformaMovil2y3/Palanca").play("activate")
					if estadoPlataforma == false:
						get_parent().get_node("Rojo/PlataformaMovil2")._set("activo",true)
					estadoPlataforma = get_parent().get_node("Rojo/PlataformaMovil3")._get("activo")
					if estadoPlataforma == false:
						get_parent().get_node("Rojo/PlataformaMovil3")._set("activo",true)
				else:
					if ((animacion != "desactivate") or (animacion != "start")):
						get_parent().get_node("Rojo/PalancaPlataformaMovil2y3/Palanca").play("desactivate")
					if estadoPlataforma:
						get_parent().get_node("Rojo/PlataformaMovil2")._set("activo",false)
					estadoPlataforma = get_parent().get_node("Rojo/PlataformaMovil3")._get("activo")
					if estadoPlataforma:
						get_parent().get_node("Rojo/PlataformaMovil3")._set("activo",false)
