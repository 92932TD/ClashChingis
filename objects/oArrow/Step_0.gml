
if (instance_exists(target)) {
 
    direction = point_direction(x, y, target.x, target.y);
} 
   
    



x += lengthdir_x(60, direction);
y += lengthdir_y(60, direction);

image_angle = direction + 90;
