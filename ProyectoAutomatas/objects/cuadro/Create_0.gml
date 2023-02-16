/// @description define qué color tendrá cada cuadro
// You can write your code in this editor
colorear = function(_val) { //toma los valores de la cuadrícula
		_val = min(_val, 150);
		
        if (_val > 135) { //valores altos
			image_blend = make_color_rgb(extra(_val,15,35),_val,extra(_val,35,75));  
        } else if (_val > 80){
			image_blend = make_color_rgb(extra(_val,200,212),extra(_val,112,154),extra(_val,75,100));  
		} else { //valores bajos
			image_blend = make_color_rgb(_val,extra(_val,30,145),extra(_val,70,255));  
        }  

}


