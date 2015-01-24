class FightScene
  constructor: (@game) ->
    @sprite_bg = @game.add.sprite 0, 0, 'fightbg'
    @sprite_bg.width = 640
