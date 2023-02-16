// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function cellular_automata_island_map(ancho, alto, spawning) constructor {
	
	//variables
	width = ancho;
	height = alto;

	//se crea el mapa inicial
	island_map = array_create(width, 0);
	for (var i = 0; i < width; i += 1) {
		island_map[i] = array_create(height, 0);
	}
	
	//randomiza la cuadrícula del mapa
	for (var col = 5; col < (width - 5); col += 1) {
		for (var row = 5; row < (height - 5); row += 1) {			
			island_map[col][row] = random(1) <= spawning ? 70 : 10;  		
		}	
	}
	
	
	//funcion iterar
	static iterate = function(_num) {
		
		repeat(_num) {
			
			//se crea un nuevo mapa que reemplazará al anterior
			var nuevo = array_create(width, 0);
			for (var i = 0; i < width; i += 1) {
				nuevo[i] = array_create(height, 0);
			}
			
			//loop por cada celda del antiguo mapa
			for (var col = 1; col < (width - 1); col += 1) { 
				for (var row = 1; row < (height - 1); row += 1) {
					
					var vecinos, actual;
			        vecinos = 0;  
			        actual = island_map[col][row]; //loop en la vecindad de cada celda del antiguo mapa
			        for (var i = -1; i <= 1; i++) {
			          for (var j = -1; j <= 1; j++) {
			            vecinos += island_map[col + i][row + j];
			          }
			        }
				
					vecinos -= actual;
					vecinos /= 8;
					
					//reglas para los cambios
				    if (vecinos < 40) { //vecinos son bajos, disminuye el valor o aumenta poco a la celda actual
				        nuevo[col][row] = actual + (random(vecinos - actual));
				    }else if (actual > vecinos) { //si la celda actual es más grande que sus vecinos, fluctua
				        nuevo[col][row] = actual + (random_range(-10, 10));
				    }  else {
				        nuevo[col][row] = actual + (random(vecinos/5));
				    }
					
				}
			}
			
			//se reemplaza el viejo mapa
			island_map = nuevo;	
		}
	
	}

}



