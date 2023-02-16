/// @description Creación del mapa
// You can write your code in this editor
generacionCuadros = function() {
	
	instance_destroy(cuadro);
	
	var espacio = sprite_get_width(Sprite1);
	
	
	//loop por cada celda
	for (var col = 0; col < mapa.width; col += 1) {
		for (var row = 0; row < mapa.height; row += 1) {
			with(instance_create_layer(col * espacio, row * espacio, layer, cuadro)) { //se crea una nueva instancia del objeto especificado en una layer
				colorear(other.mapa.island_map[col][row]); 
			}//se referencia a la instancia isla y a los valores de la cuadricula
		}
	}

}


randomize();
mapa = new cellular_automata_island_map(60, 60, 0.4);
generacionCuadros();

