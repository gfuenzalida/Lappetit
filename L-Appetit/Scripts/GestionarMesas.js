

function Mesa(id,pos_x,pos_y,cant_max) {
    this.id = id;
    this.pos_x = pos_x;
    this.pos_y = pos_y;
    this.cant_max = cant_max;
}


function entreMesas(id, entradax, entraday, cant_max) {
    var hor_4 = 101;
    var vert_4 = 96;
    var hor_6 = 101;
    var vert_6 = 96;
    if (mesasArray == null) {
        return false;
    }
    else {
        var i, in_dim_x, in_dim_y;
        if (cant_max == '4') {
            in_dim_x = hor_4;
            in_dim_y = vert_4;
        }
        else if (cant_max == '6') {
            in_dim_x = hor_6;
            in_dim_y = vert_6;
        }
        for (i = 0; i < mesasArray.length; i++) {
            if (id == mesasArray[i].id_mesa)
                continue;

            var mesa_x = mesasArray[i].pos_x;
            var mesa_y = mesasArray[i].pos_y;
            var dim_x;
            var dim_y;
            if (mesasArray[i].cant_maxima == 4) {
                dim_x = hor_4;
                dim_y = vert_4;
            }
            else if (mesasArray[i].cant_maxima == 6) {
                dim_x = hor_6;
                dim_y = vert_6;
            }

            //funcion de comprobacion
            if (((mesasArray[i].pos_x > entradax - dim_x) && (mesasArray[i].pos_x < entradax + in_dim_x)) && ((mesasArray[i].pos_y > entraday - dim_y) && (mesasArray[i].pos_y < entraday + in_dim_y))) {
                return false;
            }
        }
        return true;
    }
}