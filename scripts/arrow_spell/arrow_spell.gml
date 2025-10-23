function arrow_spell(xx, yy, radius, damage, towerdamage) {
   
    with (RedParent) {
         
            if (point_distance(x, y, xx, yy) <= radius) {
                
                if isBuilding  {
                    hp -= towerdamage;
                } else {
                    hp -= damage;
                }
            }
        }
    }

