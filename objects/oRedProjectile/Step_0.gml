if !is_network_clone {
t += spd
if (t > 1) t = 1

x = lerp(start_x, target_x, t)
y = lerp(start_y, target_y, t)

if (t >= 1) {
    with (BlueParent) {
        if (point_distance(x, y, other.target_x, other.target_y) <= other.radius) {
            if isBuilding {
                hp -= other.towerdamage
            } else {
                hp -= other.damage
            }
        }
    }
    instance_destroy()
}
}