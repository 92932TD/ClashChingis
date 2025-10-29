function arrow_spell(xx, yy, radius, damage, towerdamage, spd) {
    var proj = instance_create_layer(480, 1620, "Instances", oProjectile);
    proj.start_x = 480
    proj.start_y = 1620;
    proj.target_x = xx
	proj.spd = spd
    proj.target_y = yy
    proj.radius = radius;
    proj.damage = damage;
    proj.towerdamage = towerdamage;
	if radius = 150 { 
		proj.sprite_index = sFireball
	} else if radius = 210 {
		proj.sprite_index = sBlueArrowInHand
	}
}
