OpenBadges::Badge.delete_all
OpenBadges::Tag.delete_all
OpenBadges::BadgeTag.delete_all
OpenBadges::Alignment.delete_all
OpenBadges::BadgeAlignment.delete_all

image_path = File.join(Rails.root, '/app/assets')

OpenBadges::Badge.create(
  id: 1,
  name: 'Teleport',
  image: File.open(File.join(image_path, 'teleport.png')),
  criteria: 'http://criteria.teleport.com',
  description: 'Manipulate space time to instantaneously travel from one location to another')
OpenBadges::Badge.create(
  id: 2,
  name: 'Ice Wall',
  image: File.open(File.join(image_path, 'ice_wall.png')),
  criteria: 'http://criteria.ice_wall.com',
  description: 'Concentrate water vapour into a wall like structure and rapidly decrease its temperature')
OpenBadges::Badge.create(
  id: 3,
  name: 'Fireball',
  image: File.open(File.join(image_path, 'fireball.png')),
  criteria: 'http://criteria.fireball.com',
  description: 'Vibrate gas molecules violently within a confined space to create a ball of fire')

# 100.times do |i|
#   OpenBadges::Badge.create(
#   name: "Teleport - #{i}",
#   # image: 'http://localhost:3000/assets/teleport.png',
#   description: 'Manipulate space time to instantaneously travel from one location to another')
# end

OpenBadges::Tag.create(
  id: 1,
  name: 'magic')
OpenBadges::Tag.create(
  id: 2,
  name: 'elemental')

OpenBadges::BadgeTag.create(
  badge_id: 1,
  tag_id: 1)
OpenBadges::BadgeTag.create(
  badge_id: 2,
  tag_id: 1)
OpenBadges::BadgeTag.create(
  badge_id: 3,
  tag_id: 1)
OpenBadges::BadgeTag.create(
  badge_id: 2,
  tag_id: 2)
OpenBadges::BadgeTag.create(
  badge_id: 3,
  tag_id: 2)

OpenBadges::Alignment.create(
  id: 1,
  name: 'Time Dilation',
  url: 'http://www.hogwarts.edu/time_dilation',
  description: 'Manipulated space time without time dilation')
OpenBadges::Alignment.create(
  id: 2,
  name: 'Elemental Theory',
  url: 'http://www.hogwarts.edu/elemental_theory',
  description: 'Apply elemental knowledge to cast spells that are more useful')

OpenBadges::BadgeAlignment.create(
  badge_id: 1,
  alignment_id: 1)
OpenBadges::BadgeAlignment.create(
  badge_id: 2,
  alignment_id: 2)
OpenBadges::BadgeAlignment.create(
  badge_id: 3,
  alignment_id: 3)
